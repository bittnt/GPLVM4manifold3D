function g = negNoiseGradientParam(params, model, prior)

% NEGNOISEGRADIENTPARAM Wrapper function for calling noise gradients.
%
%	Description:
%	g = negNoiseGradientParam(params, model, prior)
%% 	negNoiseGradientParam.m CVS version 1.3
% 	negNoiseGradientParam.m SVN version 29
% 	last update 2007-11-03T14:29:07.000000Z

model.noise = noiseExpandParam(model.noise, params);
fhandle = str2func([model.noise.type 'GradientParam']);
g = - fhandle(model);

if prior
  g = g + params;
end