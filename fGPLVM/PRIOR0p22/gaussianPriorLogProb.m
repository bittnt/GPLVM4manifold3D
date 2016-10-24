function l = gaussianPriorLogProb(prior, x)

% GAUSSIANPRIORLOGPROB Log probability of Gaussian prior.
%
%	Description:
%	l = gaussianPriorLogProb(prior, x)
%% 	gaussianPriorLogProb.m CVS version 1.4
% 	gaussianPriorLogProb.m SVN version 29
% 	last update 2007-11-03T14:22:18.000000Z

% Compute log prior
l = -.5*sum(sum(prior.precision*x.*x + log(2*pi) - log(prior.precision)));
