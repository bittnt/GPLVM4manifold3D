function [model,labels] = fgplvmReadFromFile(fileName)

% FGPLVMREADFROMFILE Load a file produced by the C++ implementation.
%
%	Description:
%
%	[MODEL, LABELS] = FGPLVMREADFROMFILE(FILENAME) loads a GP-LVM model
%	from a file produced by the C++ implementation of the GP-LVM.
%	 Returns:
%	  MODEL - a MATLAB GP-LVM model structure containing the model from
%	   the file.
%	  LABELS - any available labels from the GP-LVM file.
%	 Arguments:
%	  FILENAME - the file name written by the C++ software.
%	
%
%	See also
%	FGPLVMREADFROMFID, FGPLVMCREATE


%	Copyright (c) 2005 Neil D. Lawrence
% 	fgplvmReadFromFile.m CVS version 1.4
% 	fgplvmReadFromFile.m SVN version 29
% 	last update 2007-11-03T14:32:51.000000Z

FID = fopen(fileName);
if FID==-1
  error(['Cannot find file ' fileName])
end
[model, labels] = fgplvmReadFromFID(FID);
fclose(FID);