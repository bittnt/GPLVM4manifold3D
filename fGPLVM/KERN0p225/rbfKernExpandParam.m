function kern = rbfKernExpandParam(kern, params)

% RBFKERNEXPANDPARAM Create kernel structure from RBF kernel's parameters.
%
%	Description:
%
%	KERN = RBFKERNEXPANDPARAM(KERN, PARAM) returns a radial basis
%	function kernel structure filled with the parameters in the given
%	vector. This is used as a helper function to enable parameters to be
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
%	RBFKERNPARAMINIT, RBFKERNEXTRACTPARAM, KERNEXPANDPARAM


%	Copyright (c) 2004, 2005, 2006 Neil D. Lawrence
% 	rbfKernExpandParam.m CVS version 1.6
% 	rbfKernExpandParam.m SVN version 1
% 	last update 2009-03-17T15:22:20.000000Z

kern.inverseWidth = params(1);
kern.variance = params(2);
