function model = mvuReconstruct(mvuInfo, y)

% MVURECONSTRUCT Reconstruct an MVU form component parts.
%
%	Description:
%
%	MODEL = MVURECONSTRUCT(MVUINFO, Y) takes component parts of an MVU
%	model and reconstructs the MVU model. The component parts are
%	normally retrieved from a saved file.
%	 Returns:
%	  MODEL - an MVU model structure that combines the component parts.
%	 Arguments:
%	  MVUINFO - the active set and other information stored in a
%	   structure.
%	  Y - the output target training data for the MVU.
%	
%
%	See also
%	MVUDECONSTRUCT, MVUCREATE


%	Copyright (c) 2009 Neil D. Lawrence
% 	mvuReconstruct.m SVN version 545
% 	last update 2009-10-08T12:21:21.323843Z

  model = mvuInfo;
  model.Y = y;
    
end
