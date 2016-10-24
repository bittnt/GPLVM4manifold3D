function [g1, g2] = lfmXrbfKernGradient(lfmKern, rbfKern, t1, t2, covGrad)

% LFMXRBFKERNGRADIENT Compute gradient between the LFM and RBF kernels.
%
%	Description:
%
%	[G1, G2] = LFMXRBFKERNGRADIENT(LFMKERN, RBFKERN, T) computes the
%	gradient of an objective function with respect to cross kernel terms
%	between LFM and RBF kernels for the multiple output kernel.
%	 Returns:
%	  G1 - gradient of objective function with respect to kernel
%	   parameters of LFM kernel.
%	  G2 - gradient of objective function with respect to kernel
%	   parameters of RBF kernel.
%	 Arguments:
%	  LFMKERN - the kernel structure associated with the LFM kernel.
%	  RBFKERN - the kernel structure associated with the RBF kernel.
%	  T - inputs for which kernel is to be computed.
%
%	[G1, G2] = LFMXRBFKERNGRADIENT(LFMKERN, RBFKERN, T1, T2) computes
%	the gradient of an objective function with respect to cross kernel
%	terms between LFM and RBF kernels for the multiple output kernel.
%	 Returns:
%	  G1 - gradient of objective function with respect to kernel
%	   parameters of LFM kernel.
%	  G2 - gradient of objective function with respect to kernel
%	   parameters of RBF kernel.
%	 Arguments:
%	  LFMKERN - the kernel structure associated with the LFM kernel.
%	  RBFKERN - the kernel structure associated with the RBF kernel.
%	  T1 - row inputs for which kernel is to be computed.
%	  T2 - column inputs for which kernel is to be computed.
%	
%	
%	
%
%	See also
%	MULTIKERNPARAMINIT, MULTIKERNCOMPUTE, LFMKERNPARAMINIT, RBFKERNPARAMINIT


%	Copyright (c) 2007, 2008 David Luengo


%	With modifications by Neil D. Lawrence 2007


%	With modifications by Mauricio A. Alvarez 2008
% 	lfmXrbfKernGradient.m SVN version 87
% 	last update 2008-10-11T19:45:36.000000Z

if nargin < 5
  covGrad = t2;
  t2 = t1;
end
if size(t1, 2) > 1 | size(t2, 2) > 1
  error('Input can only have one column');
end
if lfmKern.inverseWidth ~= rbfKern.inverseWidth
  error('Kernels cannot be cross combined if they have different inverse widths.')
end

%Kxf = lfmXrbfKernCompute(lfmKern, rbfKern, t1, t2);

m = lfmKern.mass;
D = lfmKern.spring;
C = lfmKern.damper;
S = lfmKern.sensitivity;

alpha = C/(2*m);
omega = sqrt(D/m-alpha^2);

sigma2 = 2/lfmKern.inverseWidth;% Tamporarly changed by MA
sigma = sqrt(sigma2);

if isreal(omega)
    gamma = alpha + j*omega;
%    ComputeUpsilon1 = lfmComputeUpsilon(gamma,sigma2,t1, t2, 2);
    ComputeUpsilon1 = lfmComputeUpsilonMatrix(gamma,sigma2,t1, t2);
else
    gamma1 = alpha + j*omega;
    gamma2 = alpha - j*omega;
%     ComputeUpsilon1 = lfmComputeUpsilon(gamma2,sigma2,t1, t2, 2);
%     ComputeUpsilon2 = lfmComputeUpsilon(gamma1,sigma2,t1, t2, 2);    
    ComputeUpsilon1 = lfmComputeUpsilonMatrix(gamma2,sigma2,t1, t2);
    ComputeUpsilon2 = lfmComputeUpsilonMatrix(gamma1,sigma2,t1, t2);
end


matGrad = zeros(length(t1), length(t2));

% Gradient with respect to m, C and D

for ind = 1:3 % Parameter (m, D or C)
  switch ind
   case 1  % Gradient wrt m
    gradThetaM = 1;
    gradThetaAlpha = -C/(2*(m^2));
    gradThetaOmega = (C^2-2*m*D)/(2*(m^2)*sqrt(4*m*D-C^2));
   case 2  % Gradient wrt D
    gradThetaM = 0;
    gradThetaAlpha = 0;
    gradThetaOmega = 1/sqrt(4*m*D-C^2);
   case 3  % Gradient wrt C
    gradThetaM = 0;
    gradThetaAlpha = 1/(2*m);
    gradThetaOmega = -C/(2*m*sqrt(4*m*D-C^2));
  end
    
  % Gradient evaluation
  
    if isreal(omega)
        gamma = alpha + j*omega;
        gradThetaGamma = gradThetaAlpha + j*gradThetaOmega;
%         matGrad(:,:) = -(sigma*sqrt(pi)*S/(2*m*omega)) ...
%             * imag(lfmGradientUpsilon(gamma,sigma2,gradThetaGamma,t1, t2, 1) ...
%             - (gradThetaM/m + gradThetaOmega/omega) ...
%             * ComputeUpsilon1);
        
       matGrad(:,:) = -(sigma*sqrt(pi)*S/(2*m*omega)) ...
            * imag(lfmGradientUpsilonMatrix(gamma,sigma2,t1, t2)*gradThetaGamma ...
            - (gradThetaM/m + gradThetaOmega/omega) ...
            * ComputeUpsilon1);                        
    else
        gamma1 = alpha + j*omega;
        gamma2 = alpha - j*omega;
        gradThetaGamma1 = gradThetaAlpha + j*gradThetaOmega;
        gradThetaGamma2 = gradThetaAlpha - j*gradThetaOmega;
%         matGrad(:,:) = (sigma*sqrt(pi)*S/(j*4*m*omega)) ...
%             * (lfmGradientUpsilon(gamma2,sigma2,gradThetaGamma2, t1, t2, 1) ...
%             - lfmGradientUpsilon(gamma1,sigma2,gradThetaGamma1,t1, t2, 1) ...
%             - (gradThetaM/lfmKern.mass + gradThetaOmega/omega) ...
%             * (ComputeUpsilon1 - ComputeUpsilon2));
        
        matGrad(:,:) = (sigma*sqrt(pi)*S/(j*4*m*omega)) ...
            * (lfmGradientUpsilonMatrix(gamma2,sigma2, t1, t2)*gradThetaGamma2 ...
            -  lfmGradientUpsilonMatrix(gamma1,sigma2, t1, t2)*gradThetaGamma1 ...
            - (gradThetaM/lfmKern.mass + gradThetaOmega/omega) ...
            * (ComputeUpsilon1 - ComputeUpsilon2));
        
    end

    g1(ind) = sum(sum(matGrad.*covGrad));

end

% Gradient with respect to sigma

if isreal(omega)
    gamma = alpha + j*omega;
%     matGrad(:,:) = -(sqrt(pi)*S/(2*m*omega)) ...
%         * imag(ComputeUpsilon1 ...
%         + sigma*lfmGradientSigmaUpsilon(gamma,sigma2,t1, t2, 1));
    
    matGrad(:,:) = -(sqrt(pi)*S/(2*m*omega)) ...
        * imag(ComputeUpsilon1 ...
        + sigma*lfmGradientSigmaUpsilonMatrix(gamma,sigma2,t1, t2));    
else
    gamma1 = alpha + j*omega;
    gamma2 = alpha - j*omega;
%     matGrad(:,:) = (sqrt(pi)*S/(j*4*m*omega)) ...
%         *(ComputeUpsilon1 - ComputeUpsilon2 ...
%         + sigma*(lfmGradientSigmaUpsilon(gamma2,sigma2,t1,t2,1) ...
%         - lfmGradientSigmaUpsilon(gamma1,sigma2,t1,t2,1)));    
    matGrad(:,:) = (sqrt(pi)*S/(j*4*m*omega)) ...
        *(ComputeUpsilon1 - ComputeUpsilon2 ...
        + sigma*(lfmGradientSigmaUpsilonMatrix(gamma2,sigma2,t1,t2) ...
        - lfmGradientSigmaUpsilonMatrix(gamma1,sigma2,t1,t2)));
end;

% g1(4) = sum(sum(matGrad.*Kxf.*covGrad))*(-(sigma^3)/4); % temporarly introduced by MA
g1(4) = sum(sum(matGrad.*covGrad))*(-(sigma^3)/4); % temporarly introduced by MA
g2(1) = g1(4);

% Gradient with respect to S

if isreal(omega)
    % gamma = alpha + j*omega;
    matGrad(:,:) = -(sqrt(pi)*sigma/(2*m*omega)) ...
        * imag(ComputeUpsilon1);
else
    %gamma1 = alpha + j*omega;
    %gamma2 = alpha - j*omega;
    matGrad(:,:) = (sqrt(pi)*sigma/(j*4*m*omega)) ...
        *(ComputeUpsilon1 - ComputeUpsilon2);
end;

g1(5) = sum(sum(matGrad.*covGrad));

% Gradient with respect to the "variance" of the RBF
g2(1) = 0; % Otherwise is counted twice, temporarly changed by MA
g2(2) = 0;
