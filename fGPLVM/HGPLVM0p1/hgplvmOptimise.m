function model = hgplvmOptimise(model, display, iters);

% HGPLVMOPTIMISE Optimise the HGPLVM.
%
%	Description:
%
%	MODEL = HGPLVMOPTIMISE(MODEL, DISPLAY, ITERS) takes a given GP-LVM
%	model structure and optimises with respect to parameters and latent
%	positions.
%	 Returns:
%	  MODEL - the optimised model.
%	 Arguments:
%	  MODEL - the model to be optimised.
%	  DISPLAY - flag dictating whether or not to display optimisation
%	   progress (set to greater than zero) (default value 1).
%	  ITERS - number of iterations to run the optimiser for (default
%	   value 2000).
%	hgplvmLogLikeGradients, hgplvmObjective, hgplvmGradient
%	
%
%	See also
%	HGPLVMCREATE, HGPLVMLOGLIKELIHOOD, 


%	Copyright (c) 2005, 2006 Neil D. Lawrence
% 	hgplvmOptimise.m version 1.1



if nargin < 3
  iters = 2000;
  if nargin < 2
    display = 1;
  end
end


params = hgplvmExtractParam(model);

options = optOptions;
if display
  options(1) = 1;
  if length(params) <= 100
    options(9) = 1;
  end
end
options(14) = iters;

if isfield(model, 'optimiser')
  optim = str2func(model.optimiser);
else
  optim = str2func('scg');
end

if strcmp(func2str(optim), 'optimiMinimize')
  % Carl Rasmussen's minimize function 
  params = optim('hgplvmObjectiveGradient', params, options, model);
else
  % NETLAB style optimization.
  params = optim('hgplvmObjective', params,  options, ...
                 'hgplvmGradient', model);
end

model = hgplvmExpandParam(model, params);
