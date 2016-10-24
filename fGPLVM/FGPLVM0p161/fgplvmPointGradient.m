function g = fgplvmPointGradient(x, model, y)

% FGPLVMPOINTGRADIENT Wrapper function for gradient of a single point.
%
%	Description:
%
%	G = FGPLVMPOINTGRADIENT(X, MODEL, Y) is a wrapper function for the
%	gradient of the log likelihood with respect to a point in the latent
%	space. The GP-LVM model is one that is assumed to have already been
%	trained.
%	 Returns:
%	  G - the gradient of the log likelihood with respect to the latent
%	   position.
%	 Arguments:
%	  X - the position in the latent space that is being optimised.
%	  MODEL - the trained GP-LVM model that is being optimised.
%	  Y - the position in data space for which the latent point is being
%	   optimised.
%	
%
%	See also
%	FGPLVMPOINTLOGLIKEGRADIENT, FGPLVMOPTIMISEPOINT


%	Copyright (c) 2005, 2006 % COPYRIGHT Neil D. Lawrence
% 	fgplvmPointGradient.m CVS version 1.4
% 	fgplvmPointGradient.m SVN version 29
% 	last update 2007-11-03T14:32:54.000000Z

g = - fgplvmPointLogLikeGradient(model, x, y);
