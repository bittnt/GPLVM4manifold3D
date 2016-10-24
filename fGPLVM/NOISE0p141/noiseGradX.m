function g = noiseGradX(noise, mu, varsigma, dmu, dvs, y);

% NOISEGRADX Returns the gradient of the log-likelihood wrt x.
%
%	Description:
%	g = noiseGradX(noise, mu, varsigma, dmu, dvs, y);
%% 	noiseGradX.m CVS version 1.3
% 	noiseGradX.m SVN version 29
% 	last update 2007-11-03T14:29:07.000000Z

[dlnZ_dmu, dlnZ_dvs] = noiseGradVals(noise, mu, varsigma, y);
g = dlnZ_dmu*dmu' + dlnZ_dvs*dvs';
