function l = normuniPriorLogProb(prior, x)

% NORMUNIPRIORLOGPROB Log probability of a normal uniform.
%
%	Description:
%	l = normuniPriorLogProb(prior, x)
%% 	normuniPriorLogProb.m CVS version 1.2
% 	normuniPriorLogProb.m SVN version 29
% 	last update 2007-11-03T14:22:18.000000Z

% Compute log prior
u = (x+prior.width/2)/prior.sigma;
uprime = u - prior.width/prior.sigma;
l = sum(- log(prior.width) + lnDiffCumGaussian(u, uprime));


