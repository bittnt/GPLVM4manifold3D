
% HGPLVMTEST Test the HGPLVM implementation.
%
%	Description:
%	

%	Copyright (c) 2007 Neil D. Lawrence
% 	hgplvmTest.m version 1.1


Y = randn(10, 6);
q = 2;
featureIndGroups = {[1 2 3], [4 5 6]};%, [7 8 9], [10 11 12]};
nodeStructure = {[1 2]};%, [3 4], [5 6]};
options = hgplvmOptions(q, featureIndGroups, nodeStructure);
for i = 1:length(options.tree)
  options.tree(i).fgplvmOptions.back = 'mlp';
  options.tree(i).fgplvmOptions.backOptions = mlpOptions(2);
end

model = hgplvmCreate(2, 12, Y, options);


initParams = hgplvmExtractParam(model);
% this creates some nasty parameters.
initParams = randn(size(initParams));%./(100*randn(size(initParams)));
% This forces kernel computation.
model = hgplvmExpandParam(model, initParams);
gradientCheck(initParams, ...
              'hgplvmObjective', ...
              'hgplvmGradient', ...
              model);
