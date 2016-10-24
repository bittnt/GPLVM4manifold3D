function g = normuniPriorGradient(prior, x)

% NORMUNIPRIORGRADIENT Gradient wrt x of the log normal uniform prior.
%
%	Description:
%	g = normuniPriorGradient(prior, x)
%% 	normuniPriorGradient.m CVS version 1.1
% 	normuniPriorGradient.m SVN version 29
% 	last update 2007-11-03T14:22:18.000000Z

% Compute gradient of prior
u = (x+prior.width/2)/prior.sigma;
uprime = u - prior.width/prior.sigma;

B1 = gaussOverDiffCumGaussian(u, uprime, 1);
B2 = gaussOverDiffCumGaussian(u, uprime, 2);
g = (B1-B2)/prior.sigma;

