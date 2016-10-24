function bvhPlayData(skel, channels, frameLength)

% BVHPLAYDATA Play bvh motion capture data.
%
%	Description:
%
%	BVHPLAYDATA(SKEL, CHANNELS, FRAMELENGTH) plays channels from the bvh
%	motion capture format.
%	 Arguments:
%	  SKEL - the skeleton for the motion.
%	  CHANNELS - the channels for the motion.
%	  FRAMELENGTH - the framelength for the motion.
%	
%
%	See also
%	SKELPLAYDATA


%	Copyright (c) 2005, 2006 Neil D. Lawrence
% 	bvhPlayData.m CVS version 1.2
% 	bvhPlayData.m SVN version 42
% 	last update 2008-08-12T20:23:47.000000Z

skelPlayData(skel, channels, frameLength);