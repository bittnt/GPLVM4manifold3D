function handle = bvhVisualise(channels, skel, padding)

% BVHVISUALISE For updating a bvh representation of 3-D data.
%
%	Description:
%
%	HANDLE = BVHVISUALISE(CHANNELS, SKEL) draws a bvh representation in
%	a 3-D plot.
%	 Returns:
%	  HANDLE - a vector of handles to the plotted structure.
%	 Arguments:
%	  CHANNELS - the channels to update the skeleton with.
%	  SKEL - the skeleton structure.
%	
%
%	See also
%	BVHMODIFY, SKELVISUALISE


%	Copyright (c) 2005, 2006 Neil D. Lawrence
% 	bvhVisualise.m CVS version 1.3
% 	bvhVisualise.m SVN version 42
% 	last update 2008-08-12T20:23:47.000000Z

if nargin < 3
  padding = 0;
end
handle = skelVisualise(channels, skel, padding);