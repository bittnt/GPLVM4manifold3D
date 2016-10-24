function model = dnetUpdateOutputWeights(model)

% DNETUPDATEOUTPUTWEIGHTS Do an M-step (update parameters) on an Density Network model.
%
%	Description:
%
%	MODEL = DNETUPDATEOUTPUTWEIGHTS(MODEL) updates the parameters of a
%	Density Network model.
%	 Returns:
%	  MODEL - the model with updated parameters.
%	 Arguments:
%	  MODEL - the model which is to be updated.
%	
%
%	See also
%	DNETCREATE, DNETUPDATEBETA


%	Copyright (c) 2008 Neil D. Lawrence
% 	dnetUpdateOutputWeights.m SVN version 24
% 	last update 2008-06-19T16:02:31.088476Z

  if model.basisStored
    G = sparseDiag(sum(model.w, 1)');
    Phi = [model.Phi ones(model.M, 1)];
    A = pdinv(Phi'*G*Phi+model.alpha/model.beta*speye(size(Phi, 2)))*Phi'*model.w'*model.y;
    model.A = A(1:size(model.Phi, 2), :);
    model.b = A(end, :);
    
    model.mapping = modelSetOutputWeights(model.mapping, model.A, model.b);
  end
