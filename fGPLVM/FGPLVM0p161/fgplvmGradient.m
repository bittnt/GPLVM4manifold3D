function g = fgplvmGradient(params, model)

% FGPLVMGRADIENT GP-LVM gradient wrapper.
%
%	Description:
%
%	G = FGPLVMGRADIENT(PARAMS, MODEL) is a wrapper function for the
%	gradient of the negative log likelihood of an GP-LVM model with
%	respect to the latent postions and parameters.
%	 Returns:
%	  G - the gradient of the negative log likelihood with respect to
%	   the latent positions and the parameters at the given point.
%	 Arguments:
%	  PARAMS - vector of parameters and latent postions where the
%	   gradient is to be evaluated.
%	  MODEL - the model structure into which the latent positions and
%	   the parameters will be placed.
%	
%
%	See also
%	FGPLVMLOGLIKEGRADIENTS, FGPLVMEXPANDPARAM


%	Copyright (c) 2006, 2005 Neil D. Lawrence
% 	fgplvmGradient.m CVS version 1.3
% 	fgplvmGradient.m SVN version 29
% 	last update 2007-11-03T14:33:00.000000Z

model = fgplvmExpandParam(model, params);
g = - fgplvmLogLikeGradients(model);
