function ll = pmvuLogLikelihood(model)

% PMVULOGLIKELIHOOD Log likelihood of PMVU model.
%
%	Description:
%
%	LL = PMVULOGLIKELIHOOD(MODEL) computes the log likelihood of  the
%	probabilistic maximum variance unfolding model.
%	 Returns:
%	  LL - the computed log likelihood.
%	 Arguments:
%	  MODEL - the model structure for which log likelihood is being
%	   computed.
%	
%
%	See also
%	PMVUCREATE, PMVULOGLIKEGRADIENTS, MODELLOGLIKELIHOOD


%	Copyright (c)  Neil D. Lawrence 2009
% 	pmvuLogLikelihood.m SVN version 584
% 	last update 2009-11-06T08:16:00.520777Z

  if model.sigma2 == 0
    ll = -model.d*model.logDetK;
    ll = ll - sum(sum(model.Y.*((model.L*model.Y)+model.gamma*model.Y)));

  else
    ll = -model.d*model.logDetSigma;
    ll = ll - sum(sum(model.Y.*(model.invSigma*model.Y)));
  end
  ll = ll*0.5;