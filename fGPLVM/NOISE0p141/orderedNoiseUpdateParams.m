function [nu, g] = orderedNoiseUpdateParams(noise, mu, varsigma, y, index)

% ORDEREDNOISEUPDATEPARAMS Update parameters for ordered categorical noise model.
%
%	Description:
%	[nu, g] = orderedNoiseUpdateParams(noise, mu, varsigma, y, index)
%% 	orderedNoiseUpdateParams.m CVS version 1.2
% 	orderedNoiseUpdateParams.m SVN version 29
% 	last update 2007-11-03T14:29:05.000000Z



[g, dlnZ_dvs] = orderedNoiseGradVals(noise, mu(index, :), ...
                                            varsigma(index, :), ...
                                            y(index, :));

nu = g.*g - 2*dlnZ_dvs;