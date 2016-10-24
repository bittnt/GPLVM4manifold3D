function options = mogOptions(numComp)

% MOGOPTIONS Sets the default options structure for MOG models.
%
%	Description:
%
%	OPTIONS = MOGOPTIONS(NUMCOMPONENTS) sets the default options
%	structure for mixtures of Gaussians models.
%	 Returns:
%	  OPTIONS - structure containing the default options.
%	 Arguments:
%	  NUMCOMPONENTS - number of components in the mixture model.
%	
%
%	See also
%	MOGCREATE


%	Copyright (c) 2006, 2008 Neil D. Lawrence
% 	mogOptions.m CVS version 1.2
% 	mogOptions.m SVN version 24
% 	last update 2008-01-07T13:22:44.924188Z

options.numComponents = numComp;
options.covtype = 'ppca';
% Whether it is an infinite mixture (false by default);
options.isInfinite = false;
options.a1=1;