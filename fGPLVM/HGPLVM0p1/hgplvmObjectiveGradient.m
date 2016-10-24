function [f, g] = hgplvmObjectiveGradient(params, model)

% HGPLVMOBJECTIVEGRADIENT Wrapper function for HGPLVM objective and gradient.
%
%	Description:
%
%	[F, G] = HGPLVMOBJECTIVEGRADIENT(PARAMS, MODEL) returns the negative
%	log likelihood of a Gaussian process model given the model structure
%	and a vector of parameters. This allows the use of NETLAB
%	minimisation functions to find the model parameters.
%	 Returns:
%	  F - the negative log likelihood of the HGPLVM model.
%	  G - the gradient of the negative log likelihood of the HGPLVM
%	   model with respect to the parameters.
%	 Arguments:
%	  PARAMS - the parameters of the model for which the objective will
%	   be evaluated.
%	  MODEL - the model structure for which the objective will be
%	   evaluated.
%	
%
%	See also
%	MINIMIZE, HGPLVMCREATE, HGPLVMGRADIENT, HGPLVMLOGLIKELIHOOD, HGPLVMOPTIMISE


%	Copyright (c) 2007 Neil D. Lawrence
% 	hgplvmObjectiveGradient.m version 1.1


% Check how the optimiser has given the parameters
if size(params, 1) > size(params, 2)
  % As a column vector ... transpose everything.
  transpose = true;
  model = hgplvmExpandParam(model, params');
else
  transpose = false;
  model = hgplvmExpandParam(model, params);
end

f = - hgplvmLogLikelihood(model);
if nargout > 1
  g = - hgplvmLogLikeGradients(model);
end
if transpose
  g = g';
end