function kern = whitefixedKernExpandParam(kern, params)

% WHITEFIXEDKERNEXPANDPARAM Create kernel structure from WHITEFIXED kernel's parameters.
%
%	Description:
%
%	KERN = WHITEFIXEDKERNEXPANDPARAM(KERN, PARAM) returns a fixed
%	parameter white noise kernel structure filled with the parameters in
%	the given vector. This is used as a helper function to enable
%	parameters to be optimised in, for example, the NETLAB optimisation
%	functions.
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
%	WHITEFIXEDKERNPARAMINIT, WHITEFIXEDKERNEXTRACTPARAM, KERNEXPANDPARAM


%	Copyright (c) 2006 Nathaniel J. King
% 	whitefixedKernExpandParam.m CVS version 1.4
% 	whitefixedKernExpandParam.m SVN version 1
% 	last update 2008-10-11T19:45:37.000000Z


kern = kern;