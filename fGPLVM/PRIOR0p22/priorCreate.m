function prior = priorCreate(type)

% PRIORCREATE Create a prior structure given a type.
%
%	Description:
%
%	PRIOR = PRIORCREATE(TYPE) creates a prior structure given a type.
%	 Returns:
%	  PRIOR - The prior structure.
%	 Arguments:
%	  TYPE - Type of prior to be created,  some standard types are
%	   'gamma', 'gaussian', 'laplace' and 'invgamma'.
%	
%
%	See also
%	PRIORPARAMINIT


%	Copyright (c) 2003 Neil D. Lawrence
% 	priorCreate.m CVS version 1.2
% 	priorCreate.m SVN version 29
% 	last update 2008-03-21T17:40:10.000000Z

prior.type = type;
prior = priorParamInit(prior);
