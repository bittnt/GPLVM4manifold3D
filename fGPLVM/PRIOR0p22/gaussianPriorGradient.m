function g = gaussianPriorGradient(prior, x)

% GAUSSIANPRIORGRADIENT Gradient wrt x of the log Gaussian prior.
%
%	Description:
%	g = gaussianPriorGradient(prior, x)
%% 	gaussianPriorGradient.m CVS version 1.3
% 	gaussianPriorGradient.m SVN version 29
% 	last update 2007-11-03T14:22:19.000000Z

% Compute gradient of prior
g = -prior.precision*x;
