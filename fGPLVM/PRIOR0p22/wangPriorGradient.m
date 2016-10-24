function g = wangPriorGradient(prior, x)

% WANGPRIORGRADIENT Gradient wrt x of the Wang prior.
%
%	Description:
%	g = wangPriorGradient(prior, x)
%% 	wangPriorGradient.m CVS version 1.1
% 	wangPriorGradient.m SVN version 29
% 	last update 2007-11-03T14:22:18.000000Z

% Compute gradient of prior
g = -prior.M./x;
