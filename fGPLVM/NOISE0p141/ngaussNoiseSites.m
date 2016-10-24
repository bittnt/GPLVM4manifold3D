function [m, beta] = ngaussNoiseSites(noise, g, nu, mu, varSigma, y)

% NGAUSSNOISESITES Site updates for noiseless Gaussian noise model.
%
%	Description:
%	[m, beta] = ngaussNoiseSites(noise, g, nu, mu, varSigma, y)
%% 	ngaussNoiseSites.m CVS version 1.2
% 	ngaussNoiseSites.m SVN version 29
% 	last update 2007-11-03T14:29:06.000000Z



[m, beta] = gaussianNoiseSites(noise, g, nu, mu, varSigma, y);