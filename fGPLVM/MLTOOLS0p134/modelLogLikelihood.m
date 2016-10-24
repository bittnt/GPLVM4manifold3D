function ll = modelLogLikelihood(model)

% MODELLOGLIKELIHOOD Compute a model log likelihood.
%
%	Description:
%
%	LL = MODELLOGLIKELIHOOD(MODEL) computes the log likelihood of the
%	given model.
%	 Returns:
%	  LL - the log likelihood of the data given the model.
%	 Arguments:
%	  MODEL - the model for which the log likelihood is to be computed.
%	
%
%	See also
%	MODELLOGLIKEGRADIENTS, MODELCREATE


%	Copyright (c) 2005, 2006 Neil D. Lawrence
% 	modelLogLikelihood.m CVS version 1.2
% 	modelLogLikelihood.m SVN version 24
% 	last update 2007-03-27T18:20:36.007941Z

fhandle = str2func([model.type 'LogLikelihood']);
ll = fhandle(model);