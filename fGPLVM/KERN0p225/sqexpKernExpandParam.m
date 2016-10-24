function kern = sqexpKernExpandParam(kern, params)

% SQEXPKERNEXPANDPARAM Create kernel structure from SQEXP kernel's parameters.
%
%	Description:
%
%	KERN = SQEXPKERNEXPANDPARAM(KERN, PARAM) returns a pre-built
%	compound squared exponential kernel structure filled with the
%	parameters in the given vector. This is used as a helper function to
%	enable parameters to be optimised in, for example, the NETLAB
%	optimisation functions.
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
%	SQEXPKERNPARAMINIT, SQEXPKERNEXTRACTPARAM, KERNEXPANDPARAM


%	Copyright (c) 2004 Neil D. Lawrence
% 	sqexpKernExpandParam.m CVS version 1.3
% 	sqexpKernExpandParam.m SVN version 1
% 	last update 2006-10-25T10:53:01.000000Z


kern.inverseWidth = params(1);
kern.rbfVariance = params(2);
kern.biasVariance = params(3);
kern.whiteVariance = params(4);
