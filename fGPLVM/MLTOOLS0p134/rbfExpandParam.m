function model = rbfExpandParam(model, params)

% RBFEXPANDPARAM Update rbf model with new vector of parameters.
%
%	Description:
%
%	MODEL = RBFEXPANDPARAM(MODEL, PARAMS) takes a vector of RBF weights
%	and centres and places them in their respective positions in the RBF
%	model. The function is a wrapper for the rbfunpak command.
%	 Returns:
%	  MODEL - the model with the weights distributed in the correct
%	   places.
%	 Arguments:
%	  MODEL - the model in which the weights are to be placed.
%	  PARAMS - a vector of the weights to be placed in the model.
%	
%
%	See also
%	RBFUNPAK, RBFCREATE, RBFEXTRACTPARAM


%	Copyright (c) 2006, 2007 Neil D. Lawrence
% 	rbfExpandParam.m CVS version 1.3
% 	rbfExpandParam.m SVN version 24
% 	last update 2008-07-12T08:02:54.695353Z

model = rbfunpak(model, params);