function ll = gpDynamicsPointLogLikelihood(model, x, y)

% GPDYNAMICSPOINTLOGLIKELIHOOD Compute the log likelihood of a point under the GP dynamics model.
%
%	Description:
%	DESC computes the log likelihood of a given point under the GP
%	dynamics model.
%	ARG model : the model for which the log likelihood is to be
%	computed.
%	ARG x : the input location for the model.
%	ARG y : the target location for the model.
%	RETURN ll : the log likelihood of the given point.
%	
%	
%	
%
%	See also
%	GPDYNAMICSCREATE, GPDYNAMICSLOGLIKELIHOOD, GPPOINTLOGLIKELIHOOD


%	Copyright (c) 2006 Neil D. Lawrence
% 	gpDynamicsPointLogLikelihood.m CVS version 1.1
% 	gpDynamicsPointLogLikelihood.m SVN version 29
% 	last update 2007-11-03T14:32:46.000000Z

ll = gpPointLogLikelihood(model, x, y);