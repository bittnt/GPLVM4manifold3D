
% DEMWALKRUN1 Demonstration of hierarchical GP-LVM on walking and running data.
%
%	Description:
%	

%	Copyright (c) 2007 Neil D. Lawrence
% 	demWalkRun1.m version 1.1


% Fix seeds
randn('seed', 1e5);
rand('seed', 1e5);

dataSetName = 'walkRun';
capName = dataSetName;
capName(1) = upper(capName(1));
experimentNo = 1;
dirSep = filesep;
baseDir = datasetsDirectory;

try 
  load([baseDir 'dem' dataSetName]);
catch
  [void, errid] = lasterr;
  if strcmp(errid, 'MATLAB:load:couldNotReadFile');
    
    skel = acclaimReadSkel([baseDir 'mocap' dirSep 'cmu' dirSep '35' dirSep '35.asf']);
    [Y1, skel] = acclaimLoadChannels([baseDir 'mocap' dirSep 'cmu' dirSep '35' dirSep '35_25.amc'], skel);
    Y1(:, [1 3]) = 0;
    Y1 = Y1(1:4:end, :);
    Y1(:, [4:end]) = asind(sind(Y1(:, [4:end])));
    Y1 = Y1(21:41, :);
    [Y2, skel] = acclaimLoadChannels([baseDir 'mocap' dirSep 'cmu' dirSep '35' dirSep '35_01.amc'], skel);
    Y2(:, [1 3]) = 0;
    Y2 = Y2(1:4:end, :);
    Y2(:, [4:end]) = asind(sind(Y2(:, [4:end])));
    Y2 = Y2(14:47, :);
    save([baseDir 'dem' dataSetName], 'Y1', 'Y2', 'skel');
  else
    error(lasterr);
  end
end

%
Y = [Y1; Y2];
seq = [size(Y1, 1), size(Y, 1)];

% Define the hierarchy.
latentDim = 2;
[tree, visualiseNodes, depVisData] = acclaimSplitHierarchy(skel);

for i = 1:8
  visualiseNodes(i).labels = zeros(seq(2), 3);
  visualiseNodes(i).labels(1:seq(1), 1) = 1;
  visualiseNodes(i).labels(seq(1)+1:seq(2), 2) = 1;
end

visualiseNodes(9).name = 'run';
tree(9).dataInd = 1:seq(1);
visualiseNodes(10).labels = zeros(size(Y1, 1), 3);
visualiseNodes(10).labels(:, 1) = 1;

visualiseNodes(10).name = 'walk';
tree(10).dataInd = seq(1)+1:seq(2);
tree(10).parent =[];
tree(10).children = [7, 6, 8];
visualiseNodes(10).model = [];
visualiseNodes(10).labels = zeros(size(Y2, 1), 3);
visualiseNodes(10).labels(:, 2) = 1;
visualiseNodes(10).padding = [];


visualiseNodes(11).padding = [];

for i = 1:length(tree)
  for j = 1:length(tree(i).children)
    tree(i).childLatentInd{j} = 1:latentDim;
  end
end

for i = 1:length(tree)
  tree(i).fgplvmOptions = fgplvmOptions('ftc');
end
options = hgplvmOptions(latentDim, tree);
%options.optimiser = 'conjgrad';
d = size(Y, 2);

model = hgplvmCreate(latentDim, d, Y, options);
for i = 1:length(model.node)
  if isempty(model.tree(i).featureInd)
    origNparams = model.node(i).kern.nParams;
    model.node(i).kern = kernCreate(model.node(i).X, {'rbf', ...
                        'whitefixed'});
    model.node(i).kern.comp{2}.variance = 1e-6;
    model.node(i).kern.whiteVariance = 1e-6;    
    model.node(i).numParams = model.node(i).numParams - origNparams ...
        + model.node(i).kern.nParams;
  end
end
model.numParams = 0;
for i = 1:length(model.node)
  model.numParams = model.numParams + model.node(i).numParams;
end

% Normalise leaf nodes
leafInd = treeFindLeaves(model.tree);
for i = leafInd
  model.node(i).scale = sqrt(var(model.node(i).y));
  % DOn't rescale things that don't vary.
  ind = find(abs(model.node(i).scale)<1e-4);
  model.node(i).scale(ind) = 1;
  model.node(i).m = gpComputeM(model.node(i));
end

% Add dynamics to root nodes.
rootInd = treeFindRoots(model.tree);
optionsDyn = gpOptions('ftc');
for i = rootInd;
  t = linspace(0, 2*pi, size(model.node(i).X, 1)+1)';  
  t = t(1:end-1, 1);
  kern = kernCreate(t, {'rbfperiodic', 'white'});
  kern.comp{2}.variance = 1e-5;
  kern.whiteVariance = kern.comp{2}.variance;
  kern.comp{1}.inverseWidth = 1;
  kern.comp{1}.variance = 1;
  optionsDyn.kern = kern;
  model.node(i) = fgplvmAddDynamics(model.node(i), 'gpTime', optionsDyn, t, 0, 0);
end
  
% Optimise the model.
iters = 1000;
display = 1;

model = hgplvmOptimise(model, display, iters);

% Save the results.
save(['dem' capName num2str(experimentNo) '.mat'], 'model', ...
     'visualiseNodes', 'depVisData');
close all
colordef white
%hgplvmHierarchicalVisualise(model, visualiseNodes, depVisData);

