function l = invgammaPriorLogProb(prior, x)

% INVGAMMAPRIORLOGPROB Log probability of inverse gamma prior.
%
%	Description:
%	l = invgammaPriorLogProb(prior, x)
%% 	invgammaPriorLogProb.m CVS version 1.2
% 	invgammaPriorLogProb.m SVN version 29
% 	last update 2007-11-03T14:22:18.000000Z



% Compute log prior
D = length(x);
l = D*prior.a*log(prior.b)-D*gammaln(prior.a)-(prior.a+1)*sum(log(x))-prior.b*sum(1./x);
