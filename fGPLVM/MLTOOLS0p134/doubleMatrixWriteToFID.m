function doubleMatrixWriteToFID(val, FID)

% DOUBLEMATRIXWRITETOFID Writes a double matrix to an FID.
%
%	Description:
%
%	DOUBLEMATRIXWRITETOFID(VAL, FID) writes a double matrix to a stream.
%	 Arguments:
%	  VAL - matrix to place in file.
%	  FID - stream to write to.
%	
%
%	See also
%	DOUBLEMATRIXREADFROMFID, MATRIXWRITETOFID


%	Copyright (c) 2008 Neil D. Lawrence
% 	doubleMatrixWriteToFID.m SVN version 24
% 	last update 2008-07-12T08:02:54.508681Z
  
writeVersionToFID(FID, 0.2);
writeStringToFID(FID, 'baseType', 'matrix');
writeStringToFID(FID, 'type', 'doubleMatrix');
writeIntToFID(FID, 'numRows', size(val, 1));
writeIntToFID(FID, 'numCols', size(val, 2));
for i = 1:size(val, 1)
  for j = 1:size(val, 2)-1
    fprintf(FID, '%1.17e ', val(i, j));
  end
  fprintf(FID, '%1.17e\n', val(i, end));
end
  
