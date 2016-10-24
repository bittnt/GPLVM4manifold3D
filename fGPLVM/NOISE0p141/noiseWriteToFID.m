function noiseWriteToFID(noise, FID)

% NOISEWRITETOFID Load from an FID written by the C++ implementation.
%
%	Description:
%
%	NOISEWRITETOFID(NOISE, FID) loads in from a file stream the data
%	format produced by C++ implementations.
%	 Arguments:
%	  NOISE - the noise model to write to the stream.
%	  FID - the file ID from where the data is loaded.
%	
%
%	See also
%	MODELREADFROMFID, NOISECREATE, NOISEREADPARAMSFROMFID


%	Copyright (c) 2005, 2006, 2008 Neil D. Lawrence
% 	noiseWriteToFID.m SVN version 29
% 	last update 2008-03-21T18:35:48.000000Z

writeVersionToFID(FID, 0.2);
writeStringToFID(FID, 'baseType', 'noise');  
writeStringToFID(FID, 'type', noise.type);
noiseWriteParamsToFID(noise, FID);
