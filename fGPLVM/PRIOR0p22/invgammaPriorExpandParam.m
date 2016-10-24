function prior = invgammaPriorExpandParam(prior, params)

% INVGAMMAPRIOREXPANDPARAM Expand inverse gamma prior structure from params.
%
%	Description:
%	prior = invgammaPriorExpandParam(prior, params)
%% 	invgammaPriorExpandParam.m CVS version 1.2
% 	invgammaPriorExpandParam.m SVN version 29
% 	last update 2007-11-03T14:22:18.000000Z



prior.a = params(1);
prior.b = params(2);
