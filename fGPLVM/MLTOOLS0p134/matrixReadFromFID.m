function X = matrixReadFromFID(FID, varargin)

% MATRIXREADFROMFID Read a matrix from an FID.
%
%	Description:
%
%	X = MATRIXREADFROMFID(FID) reads a matrix from an FID.
%	 Returns:
%	  X - the returned matrix read from the file.
%	 Arguments:
%	  FID - the file ID to read the matrix from.
%	
%
%	See also
%	MODELREADFROMFID, DOUBLEMATRIXREADFROMFID


%	Copyright (c) 2008 Neil D. Lawrence
% 	matrixReadFromFID.m SVN version 24
% 	last update 2008-03-26T00:43:33.269219Z

modelType = readStringFromFID(FID, 'type');
feval = str2func([modelType 'ReadFromFID']);
X = feval(FID, varargin{:});
