function kern = simwhiteKernParamInit(kern)

% SIMWHITEKERNPARAMINIT SIM-WHITE kernel parameter initialisation.
%
%	Description:
%
%	KERN = SIMWHITEKERNPARAMINIT(KERN) initialises the SIM-White (Single
%	Input Motif - White) kernel structure with some default parameters.
%	 Returns:
%	  KERN - the kernel structure with the default parameters placed in.
%	 Arguments:
%	  KERN - the kernel structure which requires initialisation.
%	
%
%	See also
%	KERNCREATE, KERNPARAMINIT


%	Copyright (c) 2009 David Luengo
% 	simwhiteKernParamInit.m SVN version 355
% 	last update 2009-05-14T11:55:32.000000Z


if kern.inputDimension > 1
  error('SIM-WHITE kernel only valid for one-D input.')
end

kern.nParams = 3;
kern.decay = 1;
kern.variance = 1;
kern.sensitivity = 1;

kern.delay = 0;
kern.initVal = 1;

kern.transforms.index = [1 2];
kern.transforms.type = optimiDefaultConstraint('positive');

kern.isStationary = false;
kern.positiveTime = true;
