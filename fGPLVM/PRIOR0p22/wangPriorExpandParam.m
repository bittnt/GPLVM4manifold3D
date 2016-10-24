function prior = wangPriorExpandParam(prior, params)

% WANGPRIOREXPANDPARAM Expand wang prior structure from params.
%
%	Description:
%	prior = wangPriorExpandParam(prior, params)
%% 	wangPriorExpandParam.m CVS version 1.1
% 	wangPriorExpandParam.m SVN version 29
% 	last update 2007-11-03T14:22:18.000000Z

prior.M = params(1);
