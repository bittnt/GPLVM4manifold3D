function noise = noiseReadParamsFromFID(type, FID)

% NOISEREADPARAMSFROMFID Read the noise parameters from C++ file FID.
%
%	Description:
%
%	NOISE = NOISEREADPARAMSFROMFID(TYPE, FID) reads noise parameters
%	from a C++ file stream and returns them in the appropriate noise
%	structure.
%	 Returns:
%	  NOISE - the noise structure containing the parameters.
%	 Arguments:
%	  TYPE - the type of noise structure that is being read.
%	  FID - the file ID of the stream that is being read.
%	
%
%	See also
%	NOISEREADFROMFID


%	Copyright (c) 2005, 2008 Neil D. Lawrence
% 	noiseReadParamsFromFID.m CVS version 1.4
% 	noiseReadParamsFromFID.m SVN version 29
% 	last update 2009-01-12T19:43:13.000000Z

noise.numProcess = readIntFromFID(FID, 'outputDim');
noise.nParams = readIntFromFID(FID, 'numParams');
noise.type = type;  

if strcmp(type, 'ncnm') 
  noise.gammaSplit = readIntFromFID(FID, 'gammaSplit');
end
noise = noiseParamInit(noise);
params = modelReadFromFID(FID);
fhandle = str2func([noise.type 'NoiseExpandParam']);
noise = fhandle(noise, params);
