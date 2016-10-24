function prior = priorParamInit(prior)

% PRIORPARAMINIT Prior model's parameter initialisation.
%
%	Description:
%
%	PRIOR = PRIORPARAMINIT(PRIOR) wrapper function for initialising
%	prior distributions parameters.
%	 Returns:
%	  PRIOR - initialised prior structure.
%	 Arguments:
%	  PRIOR - structure to initialise.
%	
%
%	See also
%	PRIORCREATE


%	Copyright (c) 2003 Neil D. Lawrence
% 	priorParamInit.m CVS version 1.3
% 	priorParamInit.m SVN version 29
% 	last update 2008-03-21T17:49:49.000000Z

prior = feval([prior.type 'PriorParamInit'], prior);
