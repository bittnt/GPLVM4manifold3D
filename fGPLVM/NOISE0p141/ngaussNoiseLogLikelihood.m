function L = ngaussNoiseLogLikelihood(noise, mu, varsigma, y)

% NGAUSSNOISELOGLIKELIHOOD Log likelihood of the data under the NGAUSS noise model.
%
%	Description:
%
%	NGAUSSNOISELOGLIKELIHOOD(NOISE, MU, VARSIGMA, Y) returns the log
%	likelihood of a data set under the  noiseless Gaussian noise model.
%	 Arguments:
%	  NOISE - the noise structure for which the log likelihood is
%	   required.
%	  MU - input mean locations for the log likelihood.
%	  VARSIGMA - input variance locations for the log likelihood.
%	  Y - target locations for the log likelihood.
%	
%
%	See also
%	NGAUSSNOISEPARAMINIT, NGAUSSNOISELIKELIHOOD, NOISELOGLIKELIHOOD


%	Copyright (c) 2004, 2005 Neil D. Lawrence
% 	ngaussNoiseLogLikelihood.m CVS version 1.1
% 	ngaussNoiseLogLikelihood.m SVN version 29
% 	last update 2007-11-03T14:29:08.000000Z


L = gaussianNoiseLogLikelihood(noise, mu, varsigma, y);
