function params = hgplvmExtractParam(model)

% HGPLVMEXTRACTPARAM Extract a parameter vector from an HGPLVM model.
%
%	Description:
%
%	PARAMS = HGPLVMEXTRACTPARAM(MODEL) extracts a parameter vector from
%	a given hierarchical GP-LVM structure.
%	 Returns:
%	  PARAMS - the parameter vector extracted from the model.
%	 Arguments:
%	  MODEL - the model from which parameters are to be extracted.
%	
%
%	See also
%	HGPLVMCREATE, HGPLVMEXPANDPARAM, MODELEXTRACTPARAM


%	Copyright (c) 2007 Neil D. Lawrence
% 	hgplvmExtractParam.m version 1.1


params = zeros(1, model.numParams);
endVal = 0;
for i = 1:length(model.node)
  startVal = endVal + 1;
  endVal = endVal + model.node(i).numParams;
  params(startVal:endVal) = fgplvmExtractParam(model.node(i));
end
