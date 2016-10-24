
% DEMSTOOL1 Demonstration of hierarchical GP-LVM on walking and running data.
%
%	Description:
%	

%	Copyright (c) 2007 Neil D. Lawrence
% 	demStool1.m version 

% Fix seeds
randn('seed', 1e5);
rand('seed', 1e5);

dataSetName = 'stool';
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
    
    skelA = acclaimReadSkel([baseDir 'mocap' dirSep 'cmu' dirSep '22' dirSep '22.asf']);
    [YA, skelA] = acclaimLoadChannels([baseDir 'mocap' dirSep 'cmu' dirSep '22' dirSep '22_20.amc'], skelA);
    YA = YA(1:4:end, :);
    YA = YA(50:end-10, :);
    %    YA(:, [4:end]) = asind(sind(YA(:, [4:end])));
    skelB = acclaimReadSkel([baseDir 'mocap' dirSep 'cmu' dirSep '23' dirSep '23.asf']);
    [YB, skelB] = acclaimLoadChannels([baseDir 'mocap' dirSep 'cmu' dirSep '23' dirSep '23_20.amc'], skelB);
    YB = YB(1:4:end, :);
    YB = YB(50:end-10, :);
    %    YB(:, [4:end]) = asind(sind(YB(:, [4:end])));
    save([baseDir 'dem' dataSetName], 'YA', 'YB', 'skelA', 'skelB');
  else
    error(lasterr);
  end
end

%
Y = [YA YB];

% Define the hierarchy.
latentDim = 2;

visualiseNodes(3).name = 'Threaten';
tree(3).children = [1, 2];
tree(3).parent = [];
visualiseNodes(3).model = [];
tree(3).featureInd = [];
tree(3).dataInd = 1:size(Y, 1);
visualiseNodes(3).labels = [];

visualiseNodes(2).name = 'Subject B';
tree(2).children = [];
tree(2).parent = [];
visualiseNodes(2).model = [];
visualiseNodes(2).subskel = skelB;
tree(2).featureInd = [63:124];
tree(2).dataInd = 1:size(Y, 1);
visualiseNodes(2).labels = [];

visualiseNodes(1).name = 'Subject A';
tree(1).children = [];
tree(1).parent = [];
visualiseNodes(1).model = [];
visualiseNodes(1).subskel = skelA;
tree(1).featureInd = [1:62];
tree(1).dataInd = 1:size(Y, 1);
tree = treeFindParents(tree);
visualiseNodes(1).labels = [];

for i = 1:length(tree)
  for j = 1:length(tree(i).children)
    tree(i).childLatentInd{j} = 1:latentDim;
  end
end

for i = 1:length(tree)
  tree(i).fgplvmOptions = fgplvmOptions('ftc');
end
options = hgplvmOptions(latentDim, tree);

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
  t = (1:size(model.node(i).X, 1))';  
  kern = kernCreate(t, {'rbf', 'white'});
  kern.comp{2}.variance = 1e-5;
  kern.whiteVariance = kern.comp{2}.variance;
  kern.comp{1}.inverseWidth = 5e-2;
  kern.comp{1}.variance = 1;
  optionsDyn.kern = kern;
  model.node(i) = fgplvmAddDynamics(model.node(i), 'gpTime', optionsDyn, t, 0, 0);
end
  
% Optimise the model.
iters = 100;
display = 1;

model = hgplvmOptimise(model, display, iters);

% Save the results.
save(['dem' capName num2str(experimentNo) '.mat'], 'model', ...
     'visualiseNodes');
close all
colordef white
%hgplvmHierarchicalVisualise(model, visualiseNodes, depVisData);