function noise = scaleNoiseExpandParam(noise, params)

% SCALENOISEEXPANDPARAM Expand Scale noise structure from param vector.
%
%	Description:
%	noise = scaleNoiseExpandParam(noise, params)
%% 	scaleNoiseExpandParam.m CVS version 1.1
% 	scaleNoiseExpandParam.m SVN version 29
% 	last update 2007-11-03T14:29:04.000000Z

noise.bias = params(1:noise.numProcess);
noise.scale = params(noise.numProcess+1:end);