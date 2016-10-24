function [params, names] = invgammaPriorExtractParam(prior)

% INVGAMMAPRIOREXTRACTPARAM Extract params from inverse gamma prior structure.
%
%	Description:
%	[params, names] = invgammaPriorExtractParam(prior)
%% 	invgammaPriorExtractParam.m CVS version 1.2
% 	invgammaPriorExtractParam.m SVN version 29
% 	last update 2007-11-03T14:22:18.000000Z



params = [prior.a prior.b];
if nargout > 1
  names = {'inv gamma a', 'inv gamma b'};
end