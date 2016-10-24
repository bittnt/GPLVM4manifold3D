function options = isomapOptions(neighbours)

% ISOMAPOPTIONS Options for a isomap.
%
%	Description:
%
%	OPTIONS = ISOMAPOPTIONS(NEIGHBOURS) returns the default options for
%	isomap.
%	 Returns:
%	  OPTIONS - default options structure for isomap.
%	 Arguments:
%	  NEIGHBOURS - the number of neighbours to use.
%	
%
%	See also
%	ISOMAPCREATE, MODELCREATE


%	Copyright (c) 2009 Neil D. Lawrence
% 	isomapOptions.m SVN version 503
% 	last update 2009-08-26T16:41:06.170520Z

  if nargin < 1
    neighbours = 7;
  end
  options.numNeighbours = neighbours;
end