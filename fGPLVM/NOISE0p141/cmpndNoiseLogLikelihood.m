function L = cmpndNoiseLogLikelihood(noise, mu, varsigma, y)

% CMPNDNOISELOGLIKELIHOOD Log likelihood of the data under the CMPND noise model.
%
%	Description:
%
%	CMPNDNOISELOGLIKELIHOOD(NOISE, MU, VARSIGMA, Y) returns the log
%	likelihood of a data set under the  compound noise model.
%	 Arguments:
%	  NOISE - the noise structure for which the log likelihood is
%	   required.
%	  MU - input mean locations for the log likelihood.
%	  VARSIGMA - input variance locations for the log likelihood.
%	  Y - target locations for the log likelihood.
%	
%
%	See also
%	CMPNDNOISEPARAMINIT, CMPNDNOISELIKELIHOOD, NOISELOGLIKELIHOOD


%	Copyright (c) 2004, 2005 Neil D. Lawrence
% 	cmpndNoiseLogLikelihood.m CVS version 1.1
% 	cmpndNoiseLogLikelihood.m SVN version 29
% 	last update 2007-11-03T14:29:11.000000Z


L = 0;
for i = 1:length(noise.comp)
  L = L + noiseLogLikelihood(noise.comp{i}, ...
			     mu(:, i), ...
			     varsigma(:, i), ...
			     y(:, i));
end