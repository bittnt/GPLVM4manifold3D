function kern = whiteKernParamInit(kern)

% WHITEKERNPARAMINIT WHITE kernel parameter initialisation.
%
%	Description:
%	The white noise kernel arises from assuming independent Gaussian
%	noise for each point in the function. The variance of the noise is
%	given by the kern.variance parameter.
%	
%	This kernel is not intended to be used independently, it is provided
%	so that it may be combined with other kernels in a compound kernel.
%	
%	
%
%	KERN = WHITEKERNPARAMINIT(KERN) initialises the white noise kernel
%	structure with some default parameters.
%	 Returns:
%	  KERN - the kernel structure with the default parameters placed in.
%	 Arguments:
%	  KERN - the kernel structure which requires initialisation.
%	
%
%	See also
%	CMPNDKERNPARAMINIT, KERNCREATE, KERNPARAMINIT


%	Copyright (c) 2004, 2005, 2006 Neil D. Lawrence
% 	whiteKernParamInit.m CVS version 1.5
% 	whiteKernParamInit.m SVN version 1
% 	last update 2006-11-20T15:39:52.000000Z


kern.variance = exp(-2);
kern.nParams = 1;

kern.transforms.index = 1;
kern.transforms.type = optimiDefaultConstraint('positive');

kern.isStationary = true;
