function l = gammaPriorLogProb(prior, x)

% GAMMAPRIORLOGPROB Log probability of Gamma prior.
%
%	Description:
%	l = gammaPriorLogProb(prior, x)
%% 	gammaPriorLogProb.m CVS version 1.2
% 	gammaPriorLogProb.m SVN version 29
% 	last update 2007-11-03T14:22:19.000000Z

% Compute log prior
D = length(x);
l = D*prior.a*log(prior.b)-D*gammaln(prior.a)+(prior.a-1)*sum(log(x))-prior.b*sum(x);
