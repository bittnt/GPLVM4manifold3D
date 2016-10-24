function l = laplacePriorLogProb(prior, x)

% LAPLACEPRIORLOGPROB Log probability of Laplace prior.
%
%	Description:
%	l = laplacePriorLogProb(prior, x)
%% 	laplacePriorLogProb.m CVS version 1.1
% 	laplacePriorLogProb.m SVN version 29
% 	last update 2007-11-03T14:22:18.000000Z

% Compute log prior
l = -prior.precision*sum(abs(x)) - log(2) + log(prior.precision);
