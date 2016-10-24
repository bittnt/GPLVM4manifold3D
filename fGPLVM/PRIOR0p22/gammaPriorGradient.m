function g = gammaPriorGradient(prior, x)

% GAMMAPRIORGRADIENT Gradient wrt x of the gamma prior.
%
%	Description:
%	g = gammaPriorGradient(prior, x)
%% 	gammaPriorGradient.m CVS version 1.3
% 	gammaPriorGradient.m SVN version 29
% 	last update 2007-11-03T14:22:19.000000Z

% Compute gradient of prior
g = (prior.a-1)./x-prior.b;
