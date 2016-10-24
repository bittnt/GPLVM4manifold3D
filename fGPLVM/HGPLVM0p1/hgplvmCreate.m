function model = hgplvmCreate(q, d, Y, options)

% HGPLVMCREATE Creates an HGPLVM model.
%
%	Description:
%
%	MODEL = HGPLVMCREATE(Q, D, Y, OPTIONS) creates a hierarchical GP-LVM
%	model given a data set and an options structure. The options
%	structure contains the details of the hierarchy (see hgplvmOptions).
%	 Returns:
%	  MODEL - the GP-LVM model.
%	 Arguments:
%	  Q - dimensionality of latent space.
%	  D - dimensionality of data space.
%	  Y - the data to be modelled in design matrix format (as many rows
%	   as there are data points).
%	  OPTIONS - options structure as returned from FGPLVMOPTIONS. This
%	   structure determines the type of approximations to be used (if
%	   any).
%	
%
%	See also
%	MODELCREATE, HGPLVMOPTIONS


%	Copyright (c) 2007 Neil D. Lawrence
% 	hgplvmCreate.m version 1.1



model.type = 'hgplvm';
model.optimiser = options.optimiser;
for i = 1:length(options.tree)
  qNode = q;
  if ~isempty(options.tree(i).dataInd)
    dataInd = options.tree(i).dataInd;
  else
    dataInd = 1:size(Y, 1);
  end
  YNode = Y(dataInd, options.tree(i).featureInd);
  for j = 1:length(options.tree(i).children)
    child = options.tree(i).children(j);
    childInd = options.tree(i).childLatentInd{j};
    YNode = [YNode model.node(child).X(dataInd, childInd)];
  end
  dNode = size(YNode, 2);
  optionsNode = options.tree(i).fgplvmOptions;
  model.node(i) = fgplvmCreate(qNode, dNode, YNode, optionsNode);
  % Remove prior, because hierarchy provides it.
  model.node(i).prior = [];
  model.node(i).dynamics = [];
  model.tree(i) = rmfield(options.tree(i), 'fgplvmOptions');
end
model.numParams = 0;
for i = 1:length(model.node)
  model.numParams = model.numParams + model.node(i).numParams;
end