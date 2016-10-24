function e = negNoiseLogLikelihood(params, model, prior)

% NEGNOISELOGLIKELIHOOD Wrapper function for calling noise likelihoods.
%
%	Description:
%	e = negNoiseLogLikelihood(params, model, prior)
%% 	negNoiseLogLikelihood.m CVS version 1.4
% 	negNoiseLogLikelihood.m SVN version 29
% 	last update 2007-11-03T14:29:07.000000Z

model.noise = noiseExpandParam(model.noise, params);
fhandle = str2func([model.noise.type 'NoiseLogLikelihood']);
e = - fhandle([], [], model);

if prior
  e =e +0.5*params*params';
end