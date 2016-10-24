function kern = gibbsperiodicKernExpandParam(kern, params)

% GIBBSPERIODICKERNEXPANDPARAM Create kernel structure from GIBBSPERIODIC kernel's parameters.
%
%	Description:
%
%	KERN = GIBBSPERIODICKERNEXPANDPARAM(KERN, PARAM) returns a
%	Gibbs-kernel derived periodic kernel structure filled with the
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
%	GIBBSPERIODICKERNPARAMINIT, GIBBSPERIODICKERNEXTRACTPARAM, KERNEXPANDPARAM


%	Copyright (c) 2007 Neil D. Lawrence
% 	gibbsperiodicKernExpandParam.m CVS version 1.1
% 	gibbsperiodicKernExpandParam.m SVN version 1
% 	last update 2008-10-11T19:45:36.000000Z

kern.lengthScaleFunc = modelExpandParam(kern.lengthScaleFunc, params(1:end-1));
kern.variance = params(end);

