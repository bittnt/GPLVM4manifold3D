function model = robOneDynamicsSetLatentValues(model, X)

% ROBONEDYNAMICSSETLATENTVALUES Set the latent values inside the model.
%
%	Description:
%	model = robOneDynamicsSetLatentValues(model, X)
%% 	robOneDynamicsSetLatentValues.m CVS version 1.3
% 	robOneDynamicsSetLatentValues.m SVN version 29
% 	last update 2007-11-03T14:33:41.000000Z

model.X = X;
X1 = X(1:end-1, :);
X2 = X(2:end, :);
diffX = X2 -X1;
model.r = sqrt(sum((diffX).^2, 2));
if any(model.r==0)
  model.r = model.r + eps;
end
model.theta = asin(diffX(:, 1)./model.r);
