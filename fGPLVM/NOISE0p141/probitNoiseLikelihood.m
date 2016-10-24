function L = probitNoiseLikelihood(noise, mu, varsigma, y)

% PROBITNOISELIKELIHOOD Likelihood of the data under the PROBIT noise model.
%
%	Description:
%
%	PROBITNOISELIKELIHOOD(NOISE, MU, VARSIGMA, Y) returns the likelihood
%	of a data set under the  probit based classification noise model.
%	 Arguments:
%	  NOISE - the noise structure for which the likelihood is required.
%	  MU - input mean locations for the likelihood.
%	  VARSIGMA - input variance locations for the likelihood.
%	  Y - target locations for the likelihood.
%	
%
%	See also
%	PROBITNOISEPARAMINIT, PROBITNOISELOGLIKELIHOOD, NOISELIKELIHOOD


%	Copyright (c) 2004, 2005 Neil D. Lawrence
% 	probitNoiseLikelihood.m CVS version 1.1
% 	probitNoiseLikelihood.m SVN version 29
% 	last update 2007-11-03T14:29:05.000000Z


D = size(y, 2);
for i = 1:D
  mu(:, i) = mu(:, i) + noise.bias(i);
end
L = cumGaussian((y.*mu)./(sqrt(noise.sigma2+varsigma)));
