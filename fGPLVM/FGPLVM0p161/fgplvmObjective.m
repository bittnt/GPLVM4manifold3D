function f = fgplvmObjective(params, model)

% FGPLVMOBJECTIVE Wrapper function for GP-LVM objective.
%
%	Description:
%
%	F = FGPLVMOBJECTIVE(PARAMS, MODEL) provides a wrapper function for
%	the GP-LVM, it takes the negative of the log likelihood, feeding the
%	parameters correctly to the model.
%	 Returns:
%	  F - the negative of the log likelihood of the model.
%	 Arguments:
%	  PARAMS - the parameters of the GP-LVM model.
%	  MODEL - the model structure in which the parameters are to be
%	   placed.
%	
%
%	See also
%	FGPLVMCREATE, FGPLVMLOGLIKELIHOOD, FGPLVMEXPANDPARAM


%	Copyright (c) 2005, 2006 Neil D. Lawrence
% 	fgplvmObjective.m CVS version 1.4
% 	fgplvmObjective.m SVN version 29
% 	last update 2007-11-03T14:32:57.000000Z

model = fgplvmExpandParam(model, params);
f = - fgplvmLogLikelihood(model);
