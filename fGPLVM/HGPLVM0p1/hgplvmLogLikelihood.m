function ll = hgplvmLogLikelihood(model)

% HGPLVMLOGLIKELIHOOD Log-likelihood for an HGPLVM.
%
%	Description:
%
%	LL = HGPLVMLOGLIKELIHOOD(MODEL) returns the log likelihood for a
%	given hierarchical GP-LVM model.
%	 Returns:
%	  LL - the log likelihood of the data given the model.
%	 Arguments:
%	  MODEL - the model for which the log likelihood is to be computed.
%	   The model contains the data for which the likelihood is being
%	   computed in the 'y' component of the structure.
%	
%
%	See also
%	FGPLVMLOGLIKELIHOOD, HGPLVMCREATE


%	Copyright (c) 2007 Neil D. Lawrence
% 	hgplvmLogLikelihood.m version 1.1

ll = 0;
for i = 1:length(model.node)
  ll = ll + fgplvmLogLikelihood(model.node(i));
end
