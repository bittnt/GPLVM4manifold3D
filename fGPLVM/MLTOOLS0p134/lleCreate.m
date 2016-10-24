function model = lleCreate(inputDim, outputDim, Y, options)

% LLECREATE Locally linear embedding model.
%
%	Description:
%
%	MODEL = LLECREATE(LATENTDIMENSION, OUTPUTDIM, Y, OPTIONS) creates a
%	structure for a locally linear embedding.
%	 Returns:
%	  MODEL - model structure containing LLE model.
%	 Arguments:
%	  LATENTDIMENSION - dimension of latent space.
%	  OUTPUTDIM - dimension of data.
%	  Y - the data to be modelled in design matrix format (as many rows
%	   as there are data points).
%	  OPTIONS - options structure as returned by lleOptions.
%	
%
%	See also
%	LLEOPTIONS, MODELCREATE


%	Copyright (c) 2008, 2009 Neil D. Lawrence
% 	lleCreate.m SVN version 498
% 	last update 2009-09-01T10:53:52.794621Z


model.type = 'lle';

if size(Y, 2) ~= outputDim
  error(['Input matrix Y does not have dimension ' num2str(d)]);
end
model.isNormalised = options.isNormalised;
model.regulariser = options.regulariser;
model.k = options.numNeighbours;
model.Y = Y;
model.d = outputDim;
model.q = inputDim;
model.N = size(Y, 1);