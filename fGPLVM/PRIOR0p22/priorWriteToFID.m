function priorWriteToFID(FID, prior)

% PRIORWRITETOFID Write a prior to a C++ stream.
%
%	Description:
%
%	PRIORWRITETOFID(FID, PRIOR) writes to a file stream a prior.
%	 Arguments:
%	  FID - the file ID from where the data is loaded.
%	  PRIOR - the prior loaded in from the file.
%	
%
%	See also
%	MODELWRITETOFID, PRIORCREATE, PRIORWRITEPARAMSTOFID


%	Copyright (c) 2008 Neil D. Lawrence
% 	priorWriteToFID.m SVN version 326
% 	last update 2009-04-17T21:20:25.000000Z

writeVersionToFID(FID, 0.2);
writeStringToFID(FID, 'baseType', 'prior');
writeStringToFID(FID, 'type', prior.type);
priorWriteParamsToFID(prior, FID);


