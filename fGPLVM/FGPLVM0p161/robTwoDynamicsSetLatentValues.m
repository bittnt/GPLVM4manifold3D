function model = robTwoDynamicsSetLatentValues(model, X)

% ROBTWODYNAMICSSETLATENTVALUES Set the latent values inside the model.
%
%	Description:
%	model = robTwoDynamicsSetLatentValues(model, X)
%% 	robTwoDynamicsSetLatentValues.m CVS version 1.3
% 	robTwoDynamicsSetLatentValues.m SVN version 29
% 	last update 2007-11-03T14:32:30.000000Z

model = robOneDynamicsSetLatentValues(model, X);
