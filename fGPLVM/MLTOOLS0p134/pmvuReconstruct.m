function model = pmvuReconstruct(pmvuInfo, y)

% PMVURECONSTRUCT Reconstruct an probabilistic maximum variance unfolding from component parts.
%
%	Description:
%
%	MODEL = PMVURECONSTRUCT(PMVUINFO, Y) takes component parts of an
%	probabilistic maximum variance unfolding model and reconstructs the
%	probabilistic maximum variance unfolding model. The component parts
%	are normally retrieved from a saved file.
%	 Returns:
%	  MODEL - an probabilistic maximum variance unfolding model
%	   structure that combines the component parts.
%	 Arguments:
%	  PMVUINFO - the active set and other information stored in a
%	   structure.
%	  Y - the output target training data for the probabilistic maximum
%	   variance unfolding.
%	
%
%	See also
%	PMVUCREATE, PMVURECONSTRUCT


%	Copyright (c)  Neil D. Lawrence 2009
% 	pmvuReconstruct.m SVN version 548
% 	last update 2009-10-09T06:08:21.477190Z

  model = pmvuInfo;
  model.Y = y;
  
end