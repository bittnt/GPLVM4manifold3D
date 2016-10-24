function y = gpDynamicsSamp(model, X);

% GPDYNAMICSSAMP Sample from the dynamics for a given input.
%
%	Description:
%
%	GPDYNAMICSSAMP(MODEL, X, X) does a one step ahead sample from the
%	dynamics for a single input location.
%	 Arguments:
%	  MODEL - the dynamics model from which to sample.
%	  X - the input position from which to sample.
%	  X - the new latent position sampled from the dynamics.
%	
%
%	See also
%	GPDYNAMICSCREATE


%	Copyright (c) 2006 Neil D. Lawrence
% 	gpDynamicsSamp.m CVS version 1.4
% 	gpDynamicsSamp.m SVN version 29
% 	last update 2007-11-03T14:32:45.000000Z

[mu, var] = gpPosteriorMeanVar(model, X);
y = gsamp(mu, diag(var), 1);
if isfield(model, 'diff') & model.diff
  y = X + y;
end