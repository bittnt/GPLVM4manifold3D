function kern = tensorKernExpandParam(kern, params)

% TENSORKERNEXPANDPARAM Create kernel structure from TENSOR kernel's parameters.
%
%	Description:
%
%	KERN = TENSORKERNEXPANDPARAM(KERN, PARAM) returns a tensor product
%	kernel structure filled with the parameters in the given vector.
%	This is used as a helper function to enable parameters to be
%	optimised in, for example, the NETLAB optimisation functions.
%	 Returns:
%	  KERN - kernel structure with the given parameters in the relevant
%	   locations.
%	 Arguments:
%	  KERN - the kernel structure in which the parameters are to be
%	   placed.
%	  PARAM - vector of parameters which are to be placed in the kernel
%	   structure.
%	
%
%	See also
%	TENSORKERNPARAMINIT, TENSORKERNEXTRACTPARAM, KERNEXPANDPARAM


%	Copyright (c) 2006 Neil D. Lawrence
% 	tensorKernExpandParam.m CVS version 1.3
% 	tensorKernExpandParam.m SVN version 1
% 	last update 2006-11-20T13:13:50.000000Z


kern = cmpndKernExpandParam(kern, params);