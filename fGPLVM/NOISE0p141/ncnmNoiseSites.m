function [m, beta] = ncnmNoiseSites(noise, g, nu, mu, varSigma, y)

% NCNMNOISESITES Site updates for null category model.
%
%	Description:
%	[m, beta] = ncnmNoiseSites(noise, g, nu, mu, varSigma, y)
%% 	ncnmNoiseSites.m CVS version 1.1
% 	ncnmNoiseSites.m SVN version 29
% 	last update 2007-11-03T14:29:10.000000Z

% The standard code.
beta = nu./(1-nu.*varSigma);
m = mu + g./nu;
