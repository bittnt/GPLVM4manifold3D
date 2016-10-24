function model = robThreeDynamicsCreate(q, d, latentVals)

% ROBTHREEDYNAMICSCREATE Create the dynamics model.
%
%	Description:
%	model = robThreeDynamicsCreate(q, d, latentVals)
%% 	robThreeDynamicsCreate.m CVS version 1.2
% 	robThreeDynamicsCreate.m SVN version 29
% 	last update 2007-11-03T14:33:41.000000Z

if(q~=2)
  error('Robot Three Dynamics designed for 2-D latent spaces.');
end
if(d~=q)
  error('Input dimension must equal output dimension');
end
model.lambda = 1;
model.sigma2 = 1/64;
model = robThreeDynamicsSetLatentValues(model, latentVals);

model.type = 'robThreeDynamics';

