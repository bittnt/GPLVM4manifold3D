function [params, names] = normuniPriorExtractParam(prior)

% NORMUNIPRIOREXTRACTPARAM Extract params from normal uniform prior structure.
%
%	Description:
%	[params, names] = normuniPriorExtractParam(prior)
%% 	normuniPriorExtractParam.m CVS version 1.1
% 	normuniPriorExtractParam.m SVN version 29
% 	last update 2007-11-03T14:22:18.000000Z

params = [prior.sigma prior.width];
if nargout > 1
  names = {'Distribution scale', 'Uniform width'};
end