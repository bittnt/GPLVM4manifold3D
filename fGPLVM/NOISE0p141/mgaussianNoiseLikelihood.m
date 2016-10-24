function L = mgaussianNoiseLikelihood(noise, mu, varsigma, y)

% MGAUSSIANNOISELIKELIHOOD Likelihood of the data under the MGAUSSIAN noise model.
%
%	Description:
%
%	MGAUSSIANNOISELIKELIHOOD(NOISE, MU, VARSIGMA, Y) returns the
%	likelihood of a data set under the  multiple output Gaussian noise
%	model.
%	 Arguments:
%	  NOISE - the noise structure for which the likelihood is required.
%	  MU - input mean locations for the likelihood.
%	  VARSIGMA - input variance locations for the likelihood.
%	  Y - target locations for the likelihood.
%	
%
%	See also
%	MGAUSSIANNOISEPARAMINIT, MGAUSSIANNOISELOGLIKELIHOOD, NOISELIKELIHOOD


%	Copyright (c) 2004, 2005 Neil D. Lawrence
% 	mgaussianNoiseLikelihood.m CVS version 1.1
% 	mgaussianNoiseLikelihood.m SVN version 29
% 	last update 2007-11-03T14:29:07.000000Z


N = size(y, 1);
D = size(y, 2);
for i = 1:D
  varsigma(:, i) = varsigma(:, i) + noise.sigma2(i);
  mu(:, i) = mu(:, i) + noise.bias(i);
end
arg = (mu - y)./sqrt(varsigma);

L = (2*pi*varsigma).^(-1/2).*exp( - .5*arg.*arg);

% Set likelihood of unlabelled points to 1.
L(find(isnan(y)) = 1;