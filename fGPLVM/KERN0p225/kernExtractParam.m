function [params, names] = kernExtractParam(kern)

% KERNEXTRACTPARAM Extract parameters from kernel structure.
%
%	Description:
%
%	PARAM = KERNEXTRACTPARAM(KERN) Extract parameters from the kernel
%	into a vector of parameters for optimisation.
%	 Returns:
%	  PARAM - vector of parameters extracted from the kernel. If the
%	   field 'transforms' is not empty in the kernel, the parameters will
%	   be transformed before optimisation (for example positive only
%	   parameters could be logged before being returned).
%	 Arguments:
%	  KERN - the kernel structure containing the parameters to be
%	   extracted.
%	
%
%	See also
%	KERNEXPANDPARAM, SCG, CONJGRAD


%	Copyright (c) 2003, 2004, 2005, 2006 Neil D. Lawrence
% 	kernExtractParam.m CVS version 1.6
% 	kernExtractParam.m SVN version 316
% 	last update 2009-03-08T08:54:26.000000Z

fhandle = str2func([kern.type 'KernExtractParam']);
names = cell(1, kern.nParams);

if nargout > 1
  [params, names] = fhandle(kern);
else
  params = fhandle(kern);
end
  

% Check if parameters are being optimised in a transformed space.
if ~isempty(kern.transforms)
  for i = 1:length(kern.transforms)
    index = kern.transforms(i).index;
    fhandle = str2func([kern.transforms(i).type 'Transform']);
    params(index) = fhandle(params(index), 'xtoa');
  end
end
