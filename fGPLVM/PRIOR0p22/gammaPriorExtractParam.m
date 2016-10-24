function [params, names] = gammaPriorExtractParam(prior)

% GAMMAPRIOREXTRACTPARAM Extract params from gamma prior structure.
%
%	Description:
%	[params, names] = gammaPriorExtractParam(prior)
%% 	gammaPriorExtractParam.m CVS version 1.2
% 	gammaPriorExtractParam.m SVN version 29
% 	last update 2007-11-03T14:22:19.000000Z

params = [prior.a prior.b];
if nargout > 1
  names = {'gamma a', 'gamma b'};
end