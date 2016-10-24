function ll = multimodelLogLikelihood(model)

% MULTIMODELLOGLIKELIHOOD Log likelihood of MULTIMODEL model.
%
%	Description:
%
%	LL = MULTIMODELLOGLIKELIHOOD(MODEL) computes the log likelihood of 
%	the multi-task learning wrapper model.
%	 Returns:
%	  LL - the computed log likelihood.
%	 Arguments:
%	  MODEL - the model structure for which log likelihood is being
%	   computed.
%	
%
%	See also
%	MULTIMODELCREATE, MULTIMODELLOGLIKEGRADIENTS, MODELLOGLIKELIHOOD


%	Copyright (c) 2007 Neil D. Lawrence
% 	multimodelLogLikelihood.m CVS version 1.1
% 	multimodelLogLikelihood.m SVN version 24
% 	last update 2007-03-27T18:20:34.588798Z

ll = 0;
for i = 1:length(model.comp)
  ll = ll + modelLogLikelihood(model.comp{i});
end