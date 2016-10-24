function prior = laplacePriorExpandParam(prior, params)

% LAPLACEPRIOREXPANDPARAM Expand Laplace prior structure from param vector.
%
%	Description:
%	prior = laplacePriorExpandParam(prior, params)
%% 	laplacePriorExpandParam.m CVS version 1.1
% 	laplacePriorExpandParam.m SVN version 29
% 	last update 2007-11-03T14:22:18.000000Z

prior.precision = params(1);
