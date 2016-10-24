function model = mogUpdatePrior(model)

% MOGUPDATEPRIOR Update the priors of an MOG model.
%
%	Description:
%
%	MODEL = MOGUPDATEPRIOR(MODEL) updates the prior probabilities of a
%	mixtures of Gaussians model.
%	 Returns:
%	  MODEL - the model with updated priors.
%	 Arguments:
%	  MODEL - the model which is to be updated.
%	
%
%	See also
%	MOGCREATE, MOGUPDATEMEAN, MOGUPDATECOVARIANCE, MOGESTEP


%	Copyright (c) 2006, 2008 Neil D. Lawrence
% 	mogUpdatePrior.m CVS version 1.2
% 	mogUpdatePrior.m SVN version 24
% 	last update 2008-06-19T16:02:35.978901Z

if model.isInfinite
  % First compute expectations of v.
  sumS = sum(model.posterior);
  a0bar = model.a0 + sumS; % Posterior value for a_0.
  a1bar = model.a1 + cumsum(sumS); % Posterior value for a_1.
  model.v = a0bar./(a0bar+a1bar);
  tmp = cumprod(1-model.v);
  model.prior = model.v;
  model.prior(2:end) = model.prior(2:end).*tmp(1:end-1);
else
  model.prior = mean(model.posterior);
  model.prior(find(model.prior==0))=1e-100;
end
