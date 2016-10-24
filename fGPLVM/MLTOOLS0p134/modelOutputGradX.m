function g = modelOutputGradX(model, X)

% MODELOUTPUTGRADX Compute derivatives with respect to model inputs of model outputs.
%
%	Description:
%
%	G = MODELOUTPUTGRADX(MODEL, X) gives the gradients of the outputs
%	from the model with respect to the inputs.
%	 Returns:
%	  G - gradients of the model output with respect to the model
%	   parameters for the given input locations.
%	 Arguments:
%	  MODEL - the model structure for which gradients are computed.
%	  X - input locations where gradients are to be computed.
%	
%
%	See also
%	MODELCREATE, MODELOUTPUTGRAD, MODELLOGLIKELIHOOD, MODELLOGLIKEGRADIENTS


%	Copyright (c) 2006 Neil D. Lawrence
% 	modelOutputGradX.m CVS version 1.1
% 	modelOutputGradX.m SVN version 24
% 	last update 2007-03-27T18:20:32.364430Z

fhandle = str2func([model.type 'OutputGradX']);
g = fhandle(model, X);

