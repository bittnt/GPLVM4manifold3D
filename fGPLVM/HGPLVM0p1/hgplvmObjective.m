function f = hgplvmObjective(params, model)

% HGPLVMOBJECTIVE Wrapper function for hierarchical GP-LVM objective.
%
%	Description:
%
%	F = HGPLVMOBJECTIVE(PARAMS, MODEL) provides a wrapper function for
%	the hierarchical GP-LVM, it takes the negative of the log
%	likelihood, feeding the parameters correctly to the model.
%	 Returns:
%	  F - the negative of the log likelihood of the model.
%	 Arguments:
%	  PARAMS - the parameters of the GP-LVM model.
%	  MODEL - the model structure in which the parameters are to be
%	   placed.
%	
%
%	See also
%	HGPLVMCREATE, HGPLVMLOGLIKELIHOOD, HGPLVMEXPANDPARAM


%	Copyright (c) 2007 Neil D. Lawrence
% 	hgplvmObjective.m version 1.1


model = hgplvmExpandParam(model, params);
f = - hgplvmLogLikelihood(model);
