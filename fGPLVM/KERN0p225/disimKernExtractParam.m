function [params, names] = disimKernExtractParam(kern)

% DISIMKERNEXTRACTPARAM Extract parameters from the DISIM kernel structure.
%
%	Description:
%
%	PARAM = DISIMKERNEXTRACTPARAM(KERN) Extract parameters from the
%	single input motif kernel structure into a vector of parameters for
%	optimisation.
%	 Returns:
%	  PARAM - vector of parameters extracted from the kernel. If the
%	   field 'transforms' is not empty in the kernel matrix, the
%	   parameters will be transformed before optimisation (for example
%	   positive only parameters could be logged before being returned).
%	 Arguments:
%	  KERN - the kernel structure containing the parameters to be
%	   extracted.
%
%	[PARAM, NAMES] = DISIMKERNEXTRACTPARAM(KERN) Extract parameters and
%	their names from the single input motif kernel structure.
%	 Returns:
%	  PARAM - vector of parameters extracted from the kernel. If the
%	   field 'transforms' is not empty in the kernel matrix, the
%	   parameters will be transformed before optimisation (for example
%	   positive only parameters could be logged before being returned).
%	  NAMES - cell array of strings containing parameter names.
%	 Arguments:
%	  KERN - the kernel structure containing the parameters to be
%	   extracted.
%	
%	
%	
%
%	See also
%	% SEEALSO DISIMKERNPARAMINIT, DISIMKERNEXPANDPARAM, KERNEXTRACTPARAM, SCG, CONJGRAD


%	Copyright (c) 2006 Neil D. Lawrence
%	Copyright (c) 2007-2008 Antti Honkela
% 	disimKernExtractParam.m CVS version 1.1
% 	disimKernExtractParam.m SVN version 163
% 	last update 2009-01-08T09:55:06.000000Z
params = [kern.di_decay kern.inverseWidth kern.di_variance, ...
	  kern.decay, kern.variance, kern.rbf_variance];
if nargout > 1
  names = {'di_decay', 'inverse width', 'di_variance', ...
	   'decay', 'variance', 'rbf_variance'};
end
