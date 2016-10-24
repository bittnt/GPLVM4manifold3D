function l = wangPriorLogProb(prior, x)

% WANGPRIORLOGPROB Log probability of Wang prior.
%
%	Description:
%	l = wangPriorLogProb(prior, x)
%% 	wangPriorLogProb.m CVS version 1.1
% 	wangPriorLogProb.m SVN version 29
% 	last update 2007-11-03T14:22:18.000000Z

% Compute log prior
D = length(x);
l = -prior.M*sum(log(x));
