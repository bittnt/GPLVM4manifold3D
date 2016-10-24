function model = mlpOptimise(model, X, Y, display, iters);

% MLPOPTIMISE Optimise MLP for given inputs and outputs.
%
%	Description:
%
%	MODEL = MLPOPTIMISE(MODEL, X, Y) optimises a MLP using a nonlinear
%	optimiser. squares fit.
%	 Returns:
%	  MODEL - the optimised model.
%	 Arguments:
%	  MODEL - the model to be optimised.
%	  X - the input data locations for the optimisation.
%	  Y - the target data locations for the optimisation.
%	
%
%	See also
%	MLPCREATE, MODELOPTIMISE


%	Copyright (c) 2005, 2006, 2007 Neil D. Lawrence
% 	mlpOptimise.m CVS version 1.4
% 	mlpOptimise.m SVN version 24
% 	last update 2007-03-27T18:20:30.376581Z


if nargin < 4
  display = 1;
  if nargin < 5
    iters = 500;
  end
end

options = optOptions;
options(14) = iters;
options(1) = display;
model = netopt(model, options, X, Y, model.optimiser);  