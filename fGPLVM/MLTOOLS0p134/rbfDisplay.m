function rbfDisplay(model, spacing)

% RBFDISPLAY Display an RBF network.
%
%	Description:
%	rbfDisplay(model, spacing)
%% 	rbfDisplay.m CVS version 1.2
% 	rbfDisplay.m SVN version 24
% 	last update 2007-03-27T18:20:35.792252Z

if nargin > 1
  spacing = repmat(32, 1, spacing);
else
  spacing = [];
end
spacing = char(spacing);
fprintf(spacing);
fprintf('Radial Basis Function network model:\n')
fprintf(spacing);
fprintf('  Input units: %d\n', model.inputDim);
fprintf(spacing);
fprintf('  Output units: %d\n', model.outputDim);
fprintf(spacing);
fprintf('  Hidden units: %d\n', model.nhidden);
fprintf(spacing);
fprintf('  Number of parameters: %d\n', model.numParams);
fprintf(spacing);
fprintf(['  Activation function: ' model.actfn '\n']);
fprintf(['  Output function: ' model.outfn '\n']);

