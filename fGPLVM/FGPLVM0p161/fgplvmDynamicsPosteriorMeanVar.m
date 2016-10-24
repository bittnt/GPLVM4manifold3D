function [mu, varsigma] = fgplvmDynamicsPosteriorMeanVar(model, X);

% FGPLVMDYNAMICSPOSTERIORMEANVAR Mean and variances of the posterior at points given by X.
%
%	Description:
%	[mu, varsigma] = fgplvmDynamicsPosteriorMeanVar(model, X);
%% 	fgplvmDynamicsPosteriorMeanVar.m CVS version 1.4
% 	fgplvmDynamicsPosteriorMeanVar.m SVN version 29
% 	last update 2007-11-03T14:33:02.000000Z

if ~isfield(model, 'alpha')
  if model.dynamics.diff
    Y = model.X(2:end, :) - model.X(1:end-1, :);
  else
    Y = model.X(2:end, :);
  end
  model.dynamics = gpComputeAlpha(model.dynamics, Y);
end
[mu, varsigma] = gpPosteriorMeanVar(model.dynamics, X);
