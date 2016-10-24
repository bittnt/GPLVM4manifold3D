function model = modelSetLatentValues(model, varargin)

% MODELSETLATENTVALUES Set the latent variables for dynamics models in the GPLVM.
%
%	Description:
%	model = modelSetLatentValues(model, varargin)
%% 	modelSetLatentValues.m CVS version 1.3
% 	modelSetLatentValues.m SVN version 29
% 	last update 2007-11-03T14:32:33.000000Z
fhandle = str2func([model.type 'SetLatentValues']);
model = fhandle(model, varargin{:});