function kern = expKernParamInit(kern)

% EXPKERNPARAMINIT EXP kernel parameter initialisation.
%
%	Description:
%
%	KERN = EXPKERNPARAMINIT(KERN) initialises the exponentiated kernel
%	structure with some default parameters.
%	 Returns:
%	  KERN - the kernel structure with the default parameters placed in.
%	 Arguments:
%	  KERN - the kernel structure which requires initialisation.
%	
%
%	See also
%	KERNCREATE, KERNPARAMINIT


%	Copyright (c) 2006 Neil D. Lawrence
% 	expKernParamInit.m CVS version 1.1
% 	expKernParamInit.m SVN version 328
% 	last update 2009-04-23T11:33:39.000000Z

kern.argument = kernParamInit(kern.argument);
kern.nParams = kern.argument.nParams + 1;
kern.variance = 1;
kern.transforms.index = [1];
kern.transforms.type = optimiDefaultConstraint('positive');
if isfield(kern.argument, 'isStationary') 
  kern.isStationary = kern.argument.isStationary;
else
  kern.isStationary = false;
end
% Deal with fact that white variance is exponentiated.
if isfield(kern.argument, 'whiteVariance')
  whiteVar = kern.argument.whiteVariance;
  kern.whiteVariance = kern.variance*(exp(2*whiteVar)-exp(whiteVar));
end
