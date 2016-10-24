function model = robOneDynamicsCreate(q, d, latentVals)

% ROBONEDYNAMICSCREATE Create the dynamics model.
%
%	Description:
%	model = robOneDynamicsCreate(q, d, latentVals)
%% 	robOneDynamicsCreate.m CVS version 1.3
% 	robOneDynamicsCreate.m SVN version 29
% 	last update 2007-11-03T14:32:31.000000Z

if(q~=2)
  error('Robot One Dynamics designed for 2-D latent spaces.');
end
if(d~=q)
  error('Input dimension must equal output dimension');
end
model.a = 20;
model.sigma2 = (pi/16).^2;
model.mixTheta = 0.8;
model.mixR = 0.5;

model = robOneDynamicsSetLatentValues(model, latentVals);

% set b (the scale of the gamma distributions) so that a/b is the average jump.
aveR = mean(model.r);
model.b = model.a/aveR;
model.type = 'robOneDynamics';

