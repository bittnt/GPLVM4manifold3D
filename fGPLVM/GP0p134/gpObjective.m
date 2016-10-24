function f = gpObjective(params, model)

% GPOBJECTIVE Wrapper function for GP objective.
%
%	Description:
%
%	F = GPOBJECTIVE(PARAMS, MODEL) returns the negative log likelihood
%	of a Gaussian process model given the model structure and a vector
%	of parameters. This allows the use of NETLAB minimisation functions
%	to find the model parameters.
%	 Returns:
%	  F - the negative log likelihood of the GP model.
%	 Arguments:
%	  PARAMS - the parameters of the model for which the objective will
%	   be evaluated.
%	  MODEL - the model structure for which the objective will be
%	   evaluated.
%	
%
%	See also
%	SCG, CONJGRAD, GPCREATE, GPGRADIENT, GPLOGLIKELIHOOD, GPOPTIMISE


%	Copyright (c) 2005, 2006 Neil D. Lawrence
% 	gpObjective.m CVS version 1.1
% 	gpObjective.m SVN version 3
% 	last update 2007-11-03T14:35:13.000000Z

model = gpExpandParam(model, params);
f = - gpLogLikelihood(model);
