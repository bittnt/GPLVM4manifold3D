function [params, names] = laplacePriorExtractParam(prior)

% LAPLACEPRIOREXTRACTPARAM Extract params from Laplace prior structure.
%
%	Description:
%	[params, names] = laplacePriorExtractParam(prior)
%% 	laplacePriorExtractParam.m CVS version 1.1
% 	laplacePriorExtractParam.m SVN version 29
% 	last update 2007-11-03T14:22:18.000000Z

params = prior.precision;
if nargout > 1
  names = {'Laplace precision'};
end