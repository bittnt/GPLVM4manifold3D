function [W, b] = modelGetOutputWeights(model)

% MODELGETOUTPUTWEIGHTS Wrapper function to return output weight and bias matrices.
%
%	Description:
%
%	[W, B] = MODELGETOUTPUTWEIGHTS(MODEL) returns the output weight and
%	bias matrices for any mapping model that can be interpreted as a
%	generalised linear model (e.g. rbf networks, kernel based
%	regressions, multi layer perceptrons, linear).
%	 Returns:
%	  W - the output weight matrix.
%	  B - the output biases.
%	 Arguments:
%	  MODEL - the mapping model.
%	
%
%	See also
%	MLPCREATE, RBFCREATE, KBRCREATE, LINEARCREATE


%	Copyright (c) 2008 Neil D. Lawrence
% 	modelGetOutputWeights.m SVN version 24
% 	last update 2008-06-19T16:02:31.396597Z
  
switch model.type
 case 'mlp'
  W = model.w2;
  b = model.b2;
 case 'rbf'
  W = model.w2;
  b = model.b2;
 case 'kbr'
  W = model.A;
  b = model.bias;
 case 'linear'
  W = model.W;
  b = model.b;
 otherwise 
  error('Model has no implementation of output weights and biases.');
end
