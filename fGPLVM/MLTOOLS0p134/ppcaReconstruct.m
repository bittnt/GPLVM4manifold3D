function model = ppcaReconstruct(ppcaInfo, y)

% PPCARECONSTRUCT Reconstruct an PPCA form component parts.
%
%	Description:
%
%	MODEL = PPCARECONSTRUCT(PPCAINFO, Y) takes component parts of an
%	PPCA model and reconstructs the PPCA model. The component parts are
%	normally retrieved from a saved file.
%	 Returns:
%	  MODEL - an PPCA model structure that combines the component parts.
%	 Arguments:
%	  PPCAINFO - the active set and other information stored in a
%	   structure.
%	  Y - the output target training data for the PPCA.
%	
%
%	See also
%	PPCADECONSTRUCT, PPCACREATE


%	Copyright (c) 2009 Neil D. Lawrence
% 	ppcaReconstruct.m SVN version 545
% 	last update 2009-10-08T12:21:21.454762Z

  model = ppcaInfo;
  model.y = y;
    
end
