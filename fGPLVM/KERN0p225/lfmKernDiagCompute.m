function k = lfmKernDiagCompute(kern, t)

% LFMKERNDIAGCOMPUTE Compute diagonal of LFM kernel.
%
%	Description:
%
%	K = LFMKERNDIAGCOMPUTE(KERN, T) computes the diagonal of the kernel
%	matrix for the single input motif kernel given a design matrix of
%	inputs.
%	 Returns:
%	  K - a vector containing the diagonal of the kernel matrix computed
%	   at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  T - input data matrix in the form of a design matrix.
%	
%
%	See also
%	LFMKERNPARAMINIT, KERNDIAGCOMPUTE, KERNCREATE, LFMKERNCOMPUTE


%	Copyright (c) 2007 Neil D. Lawrence
% 	lfmKernDiagCompute.m SVN version 171
% 	last update 2009-01-08T09:55:07.000000Z
% COPYRIGHT : Mauricio Alvarez, 2008


if size(t, 2) > 1 
  error('Input can only have one column');
end

% k2 = zeros(size(t, 1), 1);
% for i = 1:size(t, 1)
%   k2(i) = lfmXlfmKernCompute(kern, kern, t(i), t(i));
% end

% Get length scale out.
sigma2 = 2/kern.inverseWidth;
sigma = sqrt(sigma2);

% Parameters of the kernel
alpha = kern.damper./(2*kern.mass);
omega = sqrt(kern.spring./kern.mass - alpha*alpha);

if isreal(omega)
    % Precomputations to increase speed
    gamma  = alpha + j*omega;
    preExp =  exp(-gamma*t);   
    % Actual computation of the kernel    
    k = sigma*kern.sensitivity^2* ...
        real(lfmDiagComputeH3(-gamma, sigma2, t, [2*alpha gamma], preExp, 0) + ...
             lfmDiagComputeH4( gamma, sigma2, t, [gamma 2*alpha], preExp ,0));
    k = k*sqrt(pi)/(4*kern.mass^2*omega^2);
else
    % Precomputations to increase the speed
    preExp = zeros(length(t),2);    
    gamma_p = alpha + j*omega;
    gamma_m = alpha - j*omega;
    preFactors(1) = 2/(gamma_p + gamma_m) - 1/gamma_m;
    preFactors(2) = 2/(gamma_p + gamma_m) - 1/gamma_p;
    preExp(:,1) = exp(-gamma_p*t);
    preExp(:,2) = exp(-gamma_m*t);
    % Actual computation of the kernel    
    k = sigma*(kern.sensitivity^2)* ...
        (lfmDiagComputeH3(-gamma_m, sigma2, t, preFactors(1), preExp(:,2), 1) + ...
         lfmDiagComputeH3(-gamma_p, sigma2, t, preFactors(2), preExp(:,1), 1) + ...
         lfmDiagComputeH4( gamma_m, sigma2, t, [gamma_m  (gamma_p + gamma_m)], [preExp(:,2) preExp(:,1)] , 1) + ...
         lfmDiagComputeH4( gamma_p, sigma2, t, [gamma_p  (gamma_p + gamma_m)], preExp , 1));
    k = k*sqrt(pi)/(8*kern.mass^2*omega^2);                
end
end

function vec = lfmDiagComputeH3(gamma, sigma2, t, factor, preExp, mode)

if mode
    vec = preExp.*lfmComputeUpsilonVector(gamma ,sigma2, t)*factor;
else
    temp = preExp.*lfmComputeUpsilonVector(gamma ,sigma2, t);    
    vec = 2*real(temp/factor(1)) - temp/factor(2);
end
end

function vec = lfmDiagComputeH4(gamma, sigma2, t, factor, preExp, mode)

if mode
    vec = (preExp(:,1)/factor(1) -  2*preExp(:,2)/factor(2))...
        .*lfmComputeUpsilonVector(gamma ,sigma2, t);
else
    temp = lfmComputeUpsilonVector(gamma ,sigma2, t);
    temp2 = temp.*conj(preExp)/factor(2);
    vec = temp.*preExp/factor(1) - 2*real(temp2);
end

end




