function componentKernWriteParamsToFID(kern, FID)

% COMPONENTKERNWRITEPARAMSTOFID Write a component based kernel to a stream.
%
%	Description:
%
%	COMPONENTKERNWRITEPARAMSTOFID(KERN, FID) writes the components from
%	a component kernel to a stream.
%	 Arguments:
%	  KERN - the base kernel the components come from.
%	  FID - the output file stream to write to.
%	
%
%	See also
%	MODELWRITETOFID, KERNWRITETOFID


%	Copyright (c) 2008 Neil D. Lawrence
% 	componentKernWriteParamsToFID.m SVN version 1
% 	last update 2008-03-29T14:10:54.000000Z

writeIntToFID(FID, 'inputDim', kern.inputDimension);
writeIntToFID(FID, 'numParams', kern.nParams);
writeIntToFID(FID, 'numKerns', length(kern.comp));

for i=1:length(kern.comp)
  kernWriteToFID(kern.comp{i}, FID);
end

