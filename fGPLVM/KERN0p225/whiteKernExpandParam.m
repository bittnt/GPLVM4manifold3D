function kern = whiteKernExpandParam(kern, params)

% WHITEKERNEXPANDPARAM Create kernel structure from WHITE kernel's parameters.
%
%	Description:
%
%	KERN = WHITEKERNEXPANDPARAM(KERN, PARAM) returns a white noise
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
%	WHITEKERNPARAMINIT, WHITEKERNEXTRACTPARAM, KERNEXPANDPARAM


%	Copyright (c) 2004, 2005, 2006 Neil D. Lawrence
% 	whiteKernExpandParam.m CVS version 1.4
% 	whiteKernExpandParam.m SVN version 355
% 	last update 2009-05-14T11:55:33.000000Z


kern.variance = params(1);
