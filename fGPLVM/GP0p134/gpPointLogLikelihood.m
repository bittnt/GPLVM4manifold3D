function ll = gpPointLogLikelihood(model, x, y)

% GPPOINTLOGLIKELIHOOD Log-likelihood of a test point for a GP.
%
%	Description:
%
%	GPPOINTLOGLIKELIHOOD(MODEL, X, Y) returns the log likelihood of a
%	latent point and an observed data point for the posterior prediction
%	of a GP model.
%	 Arguments:
%	  MODEL - the model for which the point prediction will be made.
%	  X - the input point for which the posterior distribution will be
%	   evaluated.
%	  Y - the target point for which the posterior distribution will be
%	   evaluated.
%	
%
%	See also
%	GPCREATE


%	Copyright (c) 2006 Neil D. Lawrence
% 	gpPointLogLikelihood.m CVS version 1.1
% 	gpPointLogLikelihood.m SVN version 3
% 	last update 2007-11-03T14:35:13.000000Z

logTwoPi = log(2*pi);
[mu, varSigma] = gpPosteriorMeanVar(model, x);
ll = zeros(size(x, 1), 1);
ydiff = y-mu;
ll = log(varSigma) + (ydiff.*ydiff)./varSigma +logTwoPi;
ll(find(isnan(ll)))=0;
ll = -0.5*sum(ll, 2);

% ydiff = y - mu;
% f = sum((ydiff(:).*ydiff(:)));
% lp = log(varSigma(1)) + f./varSigma(1) +logTwoPi;
% lp = -0.5*lp;
