function g = hgplvmGradient(params, model)

% HGPLVMGRADIENT Hierarchical GP-LVM gradient wrapper.
%
%	Description:
%
%	G = HGPLVMGRADIENT(PARAMS, MODEL) is a wrapper function for the
%	gradient of the negative log likelihood of a hierarchical GP-LVM
%	model with respect to the latent postions and parameters.
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
%	HGPLVMLOGLIKEGRADIENTS, HGPLVMEXPANDPARAM


%	Copyright (c) 2007 Neil D. Lawrence
% 	hgplvmGradient.m version 1.1


model = hgplvmExpandParam(model, params);
g = - hgplvmLogLikeGradients(model);
