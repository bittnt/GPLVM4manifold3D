function options = mlpOptions(numHidden)

% MLPOPTIONS Options for the multi-layered perceptron.
%
%	Description:
%
%	OPTIONS = MLPOPTIONS returns the default options for a multi-layer
%	perceptron.
%	 Returns:
%	  OPTIONS - default options structure for Multi-layer peceptron.
%
%	OPTIONS = MLPOPTIONS(NUMHIDDEN)
%	 Returns:
%	  OPTIONS - default options structure for Multi-layer peceptron with
%	   the specified number of hidden units.
%	 Arguments:
%	  NUMHIDDEN - number of hidden units.
%	
%
%	See also
%	MLPCREATE, MLP


%	Copyright (c) 2006 Neil D. Lawrence
% 	mlpOptions.m CVS version 1.4
% 	mlpOptions.m SVN version 24
% 	last update 2007-03-27T18:20:30.400524Z

if nargin < 1
  numHidden = 20;
end
options.hiddenDim = numHidden;
options.activeFunc = 'linear';
options.optimiser = optimiDefaultOptimiser;