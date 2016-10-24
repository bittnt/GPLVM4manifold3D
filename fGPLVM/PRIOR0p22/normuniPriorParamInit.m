function prior = normuniPriorParamInit(prior)

% NORMUNIPRIORPARAMINIT Normal uniform prior model's parameter initialisation.
%
%	Description:
%
%	PRIOR = NORMUNIPRIORPARAMINIT(PRIOR) initialises the parameters of
%	the normal uniform prior with some default parameters.
%	 Returns:
%	  PRIOR - prior structure with initial values in place.
%	 Arguments:
%	  PRIOR - prior structure to be initialised.
%	
%
%	See also
%	PRIORCREATE, GAMMAPRIORPARAMINIT, GAUSSIANPRIORPARAMINIT


%	Copyright (c) 2004, 2005, 2006 Neil D. Lawrence
% 	normuniPriorParamInit.m CVS version 1.2
% 	normuniPriorParamInit.m SVN version 29
% 	last update 2007-11-03T14:22:18.000000Z

prior.sigma = 0.1;
prior.width = 2;
prior.transforms.index = [1 2];
prior.transforms.type = optimiDefaultConstraint('positive');
prior.nParams = 2;
