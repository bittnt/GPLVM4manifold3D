function model = linearExpandParam(model, params);

% LINEAREXPANDPARAM Update linear model with vector of parameters.
%
%	Description:
%	model = linearExpandParam(model, params);
%% 	linearExpandParam.m CVS version 1.2
% 	linearExpandParam.m SVN version 24
% 	last update 2007-03-27T18:20:27.205936Z


startVal = 1;
endVal = model.inputDim*model.outputDim;
model.W = reshape(params(1:endVal), model.inputDim, model.outputDim);
model.b = params(endVal+1:end);