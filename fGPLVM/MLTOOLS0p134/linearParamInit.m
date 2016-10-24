function model = linearParamInit(model)

% LINEARPARAMINIT Initialise the parameters of an LINEAR model.
%
%	Description:
%
%	MODEL = LINEARPARAMINIT(MODEL) sets the initial weight vectors and
%	biases to small random values.
%	 Returns:
%	  MODEL - the initialised model.
%	 Arguments:
%	  MODEL - the input model to initialise.
%	
%
%	See also
%	MODELPARAMINIT, LINEARCREATE


%	Copyright (c) 2006 Neil D. Lawrence
% 	linearParamInit.m CVS version 1.1
% 	linearParamInit.m SVN version 24
% 	last update 2007-03-27T18:20:28.435115Z

model.W = randn(model.inputDim, model.outputDim)/sqrt(model.inputDim + 1);
model.b = randn(1, model.outputDim)/sqrt(model.inputDim + 1);
model.beta = 1;