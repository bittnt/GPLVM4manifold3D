
% SIMKERNDIAGGRADIENT Compute the gradient of the SIM kernel's diagonal wrt parameters.
%
%	Description:
%
%	G = SIMKERNDIAGGRADIENT(KERN, T, FACTORS) computes the gradient of
%	functions of the diagonal of the single input motif kernel matrix
%	with respect to the parameters of the kernel. The parameters'
%	gradients are returned in the order given by the simKernExtractParam
%	command.
%	 Returns:
%	  G - gradients of the relevant function with respect to each of the
%	   parameters. Ordering should match the ordering given in
%	   simKernExtractParam.
%	 Arguments:
%	  KERN - the kernel structure for which the gradients are computed.
%	  T - the input times for which the gradient is being computed.
%	  FACTORS - partial derivatives of the function of interest with
%	   respect to the diagonal elements of the kernel.
%	
%	
%
%	See also
%	SIMKERNPARAMINIT, KERNDIAGGRADIENT, SIMKERNEXTRACTPARAM, SIMKERNGRADIENT


%	Copyright (c) 2006 Neil D. Lawrence
%	Copyright (c) 2009 David Luengo
% 	simKernDiagGradient.m CVS version 1.2
% 	simKernDiagGradient.m SVN version 375
% 	last update 2009-06-02T22:01:41.000000Z

if size(t, 2) > 1
  error('Input can only have one column');
end

sigma = sqrt(2/kern.inverseWidth);

if (kern.isStationary == false)
    [h, dh_dD_p, dh_dD_q, dh_dsigma] = ...
        simComputeH(t, t, kern.decay, kern.decay, kern.delay, kern.delay, sigma);
else
    [h, dh_dD_p, dh_dD_q, dh_dsigma] = ...
        simComputeHStat(t, t, kern.decay, kern.decay, kern.delay, kern.delay, sigma);
end

if ~isfield(kern, 'isNormalised') || (kern.isNormalised == false)
    g(1) = kern.variance * sqrt(pi) * sigma * dh_dDp;
    g(2) = kern.variance * sqrt(pi) * sigma * (dh_dsigma - 1/(2*kern.inverseWidth)*h);
    g(3) = sqrt(pi) * sigma * h;
else
    g(1) = kern.variance * dh_dDp;
    g(2) = kern.variance * dh_dsigma;
    g(3) = h;
end
