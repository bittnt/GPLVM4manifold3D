function model = linearCreate(inputDim, outputDim, options)

% LINEARCREATE Create a linear model.
%
%	Description:
%	model = linearCreate(inputDim, outputDim, options)
%% 	linearCreate.m CVS version 1.3
% 	linearCreate.m SVN version 24
% 	last update 2007-03-27T18:20:26.661158Z

model.type = 'linear';
model.activeFunc = options.activeFunc; 
model.inputDim = inputDim;
model.outputDim = outputDim;
model.numParams = (inputDim + 1)*outputDim;

model = linearParamInit(model);
