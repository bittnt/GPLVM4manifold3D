function [g, nu] = ngaussNoiseNuG(noise, mu, varSigma, y)

% NGAUSSNOISENUG Update nu and g parameters associated with noiseless Gaussian noise model.
%
%	Description:
%	[g, nu] = ngaussNoiseNuG(noise, mu, varSigma, y)
%% 	ngaussNoiseNuG.m CVS version 1.2
% 	ngaussNoiseNuG.m SVN version 29
% 	last update 2007-11-03T14:29:06.000000Z



[g, nu] = gaussianNoiseNuG(noise, mu, varSigma, y);
