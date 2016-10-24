function model = pmvuCreate(inputDim, outputDim, Y, options)

% PMVUCREATE Create a PMVU model.
%
%	Description:
%
%	MODEL = PMVUCREATE(INPUTDIM, OUTPUTDIM, Y, OPTIONS) creates a
%	probabilistic maximum variance unfolding model structure given an
%	options structure.
%	 Returns:
%	  MODEL - the model structure with the default parameters placed in.
%	 Arguments:
%	  INPUTDIM - the input dimension of the model.
%	  OUTPUTDIM - the output dimension of the model.
%	  Y - the data to be modelled in design matrix format (as many rows
%	   as there are data points).
%	  OPTIONS - an options structure that determines the form of the
%	   model.
%	
%
%	See also
%	PMVUOPTIONS, MODELCREATE


%	Copyright (c)  Neil D. Lawrence 2009
% 	pmvuCreate.m SVN version 584
% 	last update 2009-11-06T08:16:00.472619Z

model.type = 'pmvu';

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
model.sigma2 = options.sigma2;
model.kappaTransform = optimiDefaultConstraint('positive');
model = pmvuParamInit(model);
