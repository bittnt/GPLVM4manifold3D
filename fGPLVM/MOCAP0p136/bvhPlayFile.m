function bvhPlayFile(fileName)

% BVHPLAYFILE Play motion capture data from a bvh file.
%
%	Description:
%
%	BVHPLAYFILE(FILENAME) plays motion capture data by reading in a bvh
%	file from disk.
%	 Arguments:
%	  FILENAME - the name of the file to read in, in bvh format.
%	
%
%	See also
%	ACCLAIMPLAYFILE, BVHREADFILE, SKELPLAYDATA


%	Copyright (c) 2005 Neil D. Lawrence
% 	bvhPlayFile.m CVS version 1.3
% 	bvhPlayFile.m SVN version 42
% 	last update 2008-08-12T20:23:47.000000Z

[skel, channels, frameLength] = bvhReadFile(fileName);
skelPlayData(skel, channels, frameLength);
