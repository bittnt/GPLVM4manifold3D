function g = invgammaPriorGradient(prior, x)

% INVGAMMAPRIORGRADIENT Gradient wrt x of the log Gaussian prior.
%
%	Description:
%	g = invgammaPriorGradient(prior, x)
%% 	invgammaPriorGradient.m CVS version 1.2
% 	invgammaPriorGradient.m SVN version 29
% 	last update 2007-11-03T14:22:18.000000Z



% Compute gradient of prior
D = length(x);
g =-(prior.a+1)./x + prior.b./(x.*x);
