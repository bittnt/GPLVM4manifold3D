function [ax, data] = fgplvmDynamicsSample(model, points);

% FGPLVMDYNAMICSSAMPLE Sample a field from the GP.
%
%	Description:
%	[ax, data] = fgplvmDynamicsSample(model, points);
%% 	fgplvmDynamicsSample.m CVS version 1.4
% 	fgplvmDynamicsSample.m SVN version 29
% 	last update 2007-11-03T14:33:02.000000Z

if nargin < 2
  points = 20;
end

% Dynamics samples are only in 2-D at the moment.
if(size(model.X, 2)~=2)
  error(['Latent space should be two-dimensional to sample ' ...
         'dynamics'])
end

fgplvmKernDynamicsSample(model.dynamics.kern, points, model.dynamics.diff);
