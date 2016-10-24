function g = laplacePriorGradient(prior, x)

% LAPLACEPRIORGRADIENT Gradient wrt x of the log Laplace prior.
%
%	Description:
%	g = laplacePriorGradient(prior, x)
%% 	laplacePriorGradient.m CVS version 1.1
% 	laplacePriorGradient.m SVN version 29
% 	last update 2007-11-03T14:22:18.000000Z

% Compute gradient of prior
g = -prior.precision*sign(x);
