function [params, names] = whiteKernExtractParam(kern)

% WHITEKERNEXTRACTPARAM Extract parameters from the WHITE kernel structure.
%
%	Description:
%
%	PARAM = WHITEKERNEXTRACTPARAM(KERN) Extract parameters from the
%	white noise kernel structure into a vector of parameters for
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
%	[PARAM, NAMES] = WHITEKERNEXTRACTPARAM(KERN) Extract parameters and
%	parameter names from the white noise kernel structure.
%	 Returns:
%	  PARAM - vector of parameters extracted from the kernel. If the
%	   field 'transforms' is not empty in the kernel matrix, the
%	   parameters will be transformed before optimisation (for example
%	   positive only parameters could be logged before being returned).
%	  NAMES - cell array of strings giving paramter names.
%	 Arguments:
%	  KERN - the kernel structure containing the parameters to be
%	   extracted.
%	
%	
%
%	See also
%	% SEEALSO WHITEKERNPARAMINIT, WHITEKERNEXPANDPARAM, KERNEXTRACTPARAM, SCG, CONJGRAD


%	Copyright (c) 2004, 2005, 2006 Neil D. Lawrence
% 	whiteKernExtractParam.m CVS version 1.4
% 	whiteKernExtractParam.m SVN version 355
% 	last update 2009-05-14T11:55:33.000000Z
params = kern.variance;
if nargout > 1
  names = {'variance'};
end
