function model = pmvuParamInit(model)

% PMVUPARAMINIT PMVU model parameter initialisation.
%
%	Description:
%
%	MODEL = PMVUPARAMINIT(MODEL) initialises the probabilistic maximum
%	variance unfolding model structure with some default parameters.
%	 Returns:
%	  MODEL - the model structure with the default parameters placed in.
%	 Arguments:
%	  MODEL - the model structure which requires initialisation.
%	
%
%	See also
%	PMVUCREATE, MODELCREATE, MODELPARAMINIT


%	Copyright (c)  Neil D. Lawrence 2009
% 	pmvuParamInit.m SVN version 548
% 	last update 2009-10-09T06:08:21.465085Z

[model.indices, model.D2] = findNeighbours(model.Y, model.k);
model.kappa = ones(model.N, model.k);
model.gamma = 1e-4;
model.traceY = sum(sum(model.Y.*model.Y));
params = pmvuExtractParam(model);
model = pmvuExpandParam(model, params);