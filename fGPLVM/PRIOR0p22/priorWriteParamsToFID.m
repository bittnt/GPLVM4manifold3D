function prior = priorWriteParamsToFID(prior, FID)

% PRIORWRITEPARAMSTOFID Write prior params from C++ written FID.
%
%	Description:
%
%	PRIOR = PRIORWRITEPARAMSTOFID(PRIOR, FID) writes prior parameters
%	from a file written by C++.
%	 Returns:
%	  PRIOR - the prior with the parameters added.
%	 Arguments:
%	  PRIOR - the prior to put the parameters in.
%	  FID - the stream from which parameters are write.
%	
%
%	See also
%	PRIORWRITETOFID, MODELWRITETOFID


%	Copyright (c) 2008 Neil D. Lawrence
% 	priorWriteParamsToFID.m SVN version 326
% 	last update 2009-04-17T21:20:40.000000Z

writeIntToFID(FID, 'numParams', prior.nParams);
fhandle = str2func([prior.type 'PriorExtractParam']);
params = fhandle(prior);
doubleMatrixWriteToFID(params, FID);

