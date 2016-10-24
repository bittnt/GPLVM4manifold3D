function prior = gammaPriorExpandParam(prior, params)

% GAMMAPRIOREXPANDPARAM Expand gamma prior structure from params.
%
%	Description:
%	prior = gammaPriorExpandParam(prior, params)
%% 	gammaPriorExpandParam.m CVS version 1.2
% 	gammaPriorExpandParam.m SVN version 29
% 	last update 2007-11-03T14:22:19.000000Z

prior.a = params(1);
prior.b = params(2);
