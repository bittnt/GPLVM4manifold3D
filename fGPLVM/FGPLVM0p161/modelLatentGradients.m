function g = modelLatentGradients(model)

% MODELLATENTGRADIENTS Gradients of the latent variables for dynamics models in the GPLVM.
%
%	Description:
%	g = modelLatentGradients(model)
%% 	modelLatentGradients.m CVS version 1.3
% 	modelLatentGradients.m SVN version 29
% 	last update 2007-11-03T14:32:33.000000Z

fhandle = str2func([model.type 'LatentGradients']);
g = fhandle(model);