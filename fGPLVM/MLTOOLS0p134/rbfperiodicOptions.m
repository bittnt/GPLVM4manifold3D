function options = rbfperiodicOptions(numHidden)

% RBFPERIODICOPTIONS Create a default options structure for the RBFPERIODIC model.
%
%	Description:
%
%	OPTIONS = RBFPERIODICOPTIONS creates a default options structure for
%	the periodic radial basis function model structure.
%	 Returns:
%	  OPTIONS - the default options structure.
%	
%
%	See also
%	RBFPERIODICCREATE, MODELOPTIONS


%	Copyright (c) 2007 Neil D. Lawrence
% 	rbfperiodicOptions.m CVS version 1.1
% 	rbfperiodicOptions.m SVN version 24
% 	last update 2007-03-27T18:20:36.984000Z

if nargin < 1
  numHidden = 20;
end
options.hiddenDim = numHidden;
options.optimiser = optimiDefaultOptimiser;