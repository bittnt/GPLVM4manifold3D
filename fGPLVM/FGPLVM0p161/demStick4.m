
% DEMSTICK4 Model the stick man using an RBF kernel and 3-D latent space.
%
%	Description:
%	% 	demStick4.m CVS version 1.3
% 	demStick4.m SVN version 29
% 	last update 2007-11-03T14:33:20.000000Z

% Fix seeds
randn('seed', 1e5);
rand('seed', 1e5);

dataSetName = 'stick';
experimentNo = 4;

% load data
[Y, lbls] = lvmLoadData(dataSetName);

% Set up model
% Train using the full training conditional (i.e. no approximation.)
options = fgplvmOptions('ftc');
latentDim = 3;

d = size(Y, 2);
model = fgplvmCreate(latentDim, d, Y, options);

% Optimise the model.
iters = 1000;
display = 1;

model = fgplvmOptimise(model, display, iters);
scatter3(model.X(:, 1), model.X(:, 2), model.X(:, 3), 'rx');
% Save the results.
capName = dataSetName;;
capName(1) = upper(capName(1));
save(['dem' capName num2str(experimentNo) '.mat'], 'model');


