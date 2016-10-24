function g = modelGradient(params, model, varargin)

% MODELGRADIENT Gradient of error function to minimise for given model.
%
%	Description:
%
%	G = MODELGRADIENT(PARAMS, MODEL, ...) gives the gradient of the
%	objective function for a model. By default the objective function is
%	a negative log likelihood.
%	 Returns:
%	  G - the gradient of the error function to be minimised.
%	 Arguments:
%	  PARAMS - parameter vector to evaluate at.
%	  MODEL - model structure to optimise.
%	  ... - optional additional arguments.
%	
%
%	See also
%	MODELLOGLIKEGRADIENT, MODELOBJECTIVE, MODELOPTIMISE


%	Copyright (c) 2006 Neil D. Lawrence
% 	modelGradient.m CVS version 1.2
% 	modelGradient.m SVN version 24
% 	last update 2007-03-27T18:20:35.935814Z

fhandle = [model.type 'Gradient'];
if exist(fhandle) == 2
  fhandle = str2func(fhandle);
  g = fhandle(params, model, varargin{:});
else
  fhandle = str2func([model.type 'ExpandParam']);
  model = fhandle(model, params);
  fhandle = str2func([model.type 'LogLikeGradients']);
  g = - fhandle(model, varargin{:});
end
