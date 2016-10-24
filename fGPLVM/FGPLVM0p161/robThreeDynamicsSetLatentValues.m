function model = robThreeDynamicsSetLatentValues(model, X)

% ROBTHREEDYNAMICSSETLATENTVALUES Set the latent values inside the model.
%
%	Description:
%	model = robThreeDynamicsSetLatentValues(model, X)
%% 	robThreeDynamicsSetLatentValues.m CVS version 1.2
% 	robThreeDynamicsSetLatentValues.m SVN version 29
% 	last update 2007-11-03T14:32:30.000000Z

model.X = X;
X1 = X(1:end-1, :);
X2 = X(2:end, :);
model.diffX = X2 -X1;
