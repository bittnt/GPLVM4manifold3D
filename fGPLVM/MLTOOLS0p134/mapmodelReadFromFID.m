function model = mapmodelReadFromFID(FID, varargin)

% MAPMODELREADFROMFID Load from a FID produced by C++ code.
%
%	Description:
%
%	MODEL = MAPMODELREADFROMFID(FID) loads in from a file stream the
%	data format produced by C++ code.
%	 Returns:
%	  MODEL - the model loaded in from the file.
%	 Arguments:
%	  FID - the file ID from where the data is loaded.
%	
%
%	See also
%	MODELREADFROMFID


%	Copyright (c) 2008 Neil D. Lawrence
% 	mapmodelReadFromFID.m SVN version 24
% 	last update 2008-07-12T08:02:54.605653Z

modelType = readStringFromFID(FID, 'type');
feval = str2func([modelType 'ReadFromFID']);
model = feval(FID, varargin{:});
