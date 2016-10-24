function kern = ggwhiteKernExpandParam(kern, params)

% GGWHITEKERNEXPANDPARAM Create kernel structure from GG white kernel's parameters.
%
%	Description:
%
%	KERN = GGWHITEKERNEXPANDPARAM(KERN, PARAM) returns a gaussian
%	gaussian white kernel structure filled with the parameters in the
%	given vector. This is used as a helper function to enable parameters
%	to be optimised in, for example, the NETLAB optimisation functions.
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
%
%	See also
%	GGWHITEKERNPARAMINIT, GGWHITEKERNEXTRACTPARAM, KERNEXPANDPARAM


%	Copyright (c) 2008 Mauricio A. Alvarez and Neil D. Lawrence


%	With modifications by Mauricio A Alvarez 2009
% 	ggwhiteKernExpandParam.m SVN version 405
% 	last update 2009-06-26T09:42:27.000000Z

kern.precisionG = params(1:end-2)';
kern.sigma2Noise = params(end-1);
kern.variance = params(end);

