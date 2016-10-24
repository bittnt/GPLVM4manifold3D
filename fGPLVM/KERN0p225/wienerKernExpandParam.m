function kern = wienerKernExpandParam(kern, params)

% WIENERKERNEXPANDPARAM Create kernel structure from WIENER kernel's parameters.
%
%	Description:
%
%	KERN = WIENERKERNEXPANDPARAM(KERN, PARAM) returns a wiener kernel
%	structure filled with the parameters in the given vector. This is
%	used as a helper function to enable parameters to be optimised in,
%	for example, the NETLAB optimisation functions.
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
%	WIENERKERNPARAMINIT, WIENERKERNEXTRACTPARAM, KERNEXPANDPARAM


%	Copyright (c) 2009 Neil D. Lawrence
% 	wienerKernExpandParam.m SVN version 265
% 	last update 2009-03-08T08:54:28.000000Z

kern.variance = params(1);