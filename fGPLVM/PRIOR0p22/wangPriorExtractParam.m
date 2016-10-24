function [params, names] = wangPriorExtractParam(prior)

% WANGPRIOREXTRACTPARAM Extract params from Wang prior structure.
%
%	Description:
%	[params, names] = wangPriorExtractParam(prior)
%% 	wangPriorExtractParam.m CVS version 1.1
% 	wangPriorExtractParam.m SVN version 29
% 	last update 2007-11-03T14:22:18.000000Z

params = [prior.M];
if nargout > 1
  names = {'M'};
end