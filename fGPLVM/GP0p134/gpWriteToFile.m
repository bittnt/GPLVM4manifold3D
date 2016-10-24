function gpWriteToFile(fileName, model)

% GPWRITETOFILE Write a file to be read by the C++ implementation.
%
%	Description:
%
%	GPWRITETOFILE(FILENAME, MODEL) writes a GP model to a file produced
%	by the C++ GP implementation.
%	 Arguments:
%	  FILENAME - the file name written by the C++ software.
%	  MODEL - a MATLAB GP model structure containing the model for the
%	   file.
%	
%
%	See also
%	GPWRITETOFID, GPCREATE


%	Copyright (c) 2008 Neil D. Lawrence
% 	gpWriteToFile.m SVN version 3
% 	last update 2008-03-21T18:07:25.000000Z

FID = fopen(fileName, 'w');
if FID==-1
  error(['Cannot open file ' fileName])
end
gpWriteToFID(FID, model);
fclose(FID);