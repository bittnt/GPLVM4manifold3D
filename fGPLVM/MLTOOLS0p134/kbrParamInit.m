function model = kbrParamInit(model)

% KBRPARAMINIT KBR model parameter initialisation.
%
%	Description:
%
%	MODEL = KBRPARAMINIT(MODEL) initialises the kernel based regression
%	model structure with some default parameters.
%	 Returns:
%	  MODEL - the model structure with the default parameters placed in.
%	 Arguments:
%	  MODEL - the model structure which requires initialisation.
%	
%
%	See also
%	KBRCREATE, MODELCREATE, MODELPARAMINIT


%	Copyright (c) 2007 Neil D. Lawrence
% 	kbrParamInit.m CVS version 1.2
% 	kbrParamInit.m SVN version 24
% 	last update 2007-03-27T18:20:26.523427Z

model.A = randn(model.numData, model.outputDim)/sqrt(model.numData+1);
model.bias = randn(1, model.outputDim)/sqrt(model.numData+1);



