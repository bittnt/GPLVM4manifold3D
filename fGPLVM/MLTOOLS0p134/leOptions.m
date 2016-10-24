function options = leOptions(neighbours)

% LEOPTIONS Options for a Laplacian eigenmaps.
%
%	Description:
%
%	OPTIONS = LEOPTIONS(NEIGHBOURS) returns the default options for a
%	Laplacian eigenmaps.
%	 Returns:
%	  OPTIONS - default options structure for Laplacian eigenmaps.
%	 Arguments:
%	  NEIGHBOURS - the number of neighbours to use.
%	
%
%	See also
%	LECREATE, MODELCREATE


%	Copyright (c) 2009 Neil D. Lawrence
% 	leOptions.m SVN version 548
% 	last update 2009-10-09T06:08:21.230174Z

  if nargin < 1
    neighbours = 7;
  end
  options.numNeighbours = neighbours;
  options.isNormalised = true;
  options.weightType = 'rbf';
  options.weightScale = 1.0;
  options.regulariser = 0.0;
end
