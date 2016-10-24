function y = hgplvmOut(model, x, parentNode)

% HGPLVMOUT Give the output of the HGPLVM model.
%
%	Description:
%
%	Y = HGPLVMOUT(MODEL, X) evaluates the output of a given Gaussian
%	process model.
%	 Returns:
%	  Y - the output of the HGPLVM model. The function checks if there
%	   is a noise model associated with the HGPLVM, if there is, it is
%	   used, otherwise the mean of hgplvmPosteriorMeanVar is returned.
%	 Arguments:
%	  MODEL - the model for which the output is being evaluated.
%	  X - the input position for which the output is required.
%	
%
%	See also
%	HGPLVMCREATE


%	Copyright (c) 2007 Neil D. Lawrence
% 	hgplvmOut.m version 1.1


