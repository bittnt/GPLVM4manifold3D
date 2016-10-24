function prior = normuniPriorExpandParam(prior, params)

% NORMUNIPRIOREXPANDPARAM Expand Normal uniform prior structure from param vector.
%
%	Description:
%	prior = normuniPriorExpandParam(prior, params)
%% 	normuniPriorExpandParam.m CVS version 1.1
% 	normuniPriorExpandParam.m SVN version 29
% 	last update 2007-11-03T14:22:18.000000Z

prior.sigma = params(1);
prior.width = params(2);
