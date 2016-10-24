function model  = modelSetOutputWeights(model, W, b)

% MODELSETOUTPUTWEIGHTS Wrapper function to return set output weight and bias matrices.
%
%	Description:
%
%	MODEL = MODELSETOUTPUTWEIGHTS(MODEL, W, B) sets the output weight
%	and bias matrices for any mapping model that can be interpreted as a
%	generalised linear model (e.g. rbf networks, kernel based
%	regressions, multi layer perceptrons, linear).
%	 Returns:
%	  MODEL - the model with updated weights and bias matrices.
%	 Arguments:
%	  MODEL - the mapping model.
%	  W - the output weight matrix.
%	  B - the output biases.
%	
%
%	See also
%	MLPCREATE, RBFCREATE, KBRCREATE, LINEARCREATE


%	Copyright (c) 2008 Neil D. Lawrence
% 	modelSetOutputWeights.m SVN version 24
% 	last update 2008-06-19T16:02:31.450780Z
  
switch model.type
 case 'mlp'
  model.w2 = W;
  model.b2 = b;
 case 'rbf'
  model.w2 = W;
  model.b2 = b;
 case 'kbr'
  model.A = W;
  model.bias = b;
 case 'linear'
  model.W = W;
  model.b = b;
 otherwise 
  error('Model has no implementation of output weights and biases.');
end
