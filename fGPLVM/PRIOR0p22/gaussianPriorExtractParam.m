function [params, names] = gaussianPriorExtractParam(prior)

% GAUSSIANPRIOREXTRACTPARAM Extract params from Gaussian prior structure.
%
%	Description:
%	[params, names] = gaussianPriorExtractParam(prior)
%% 	gaussianPriorExtractParam.m CVS version 1.3
% 	gaussianPriorExtractParam.m SVN version 29
% 	last update 2007-11-03T14:22:19.000000Z

params = prior.precision;
if nargout > 1
  names = {'Gaussian precision'};
end