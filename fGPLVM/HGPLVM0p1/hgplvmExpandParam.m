function model = hgplvmExpandParam(model, params)

% HGPLVMEXPANDPARAM Expand a parameter vector into an HGPLVM model.
%
%	Description:
%
%	HGPLVMEXPANDPARAM(MODEL, PARAMS) takes a hierarchical GP-LVM
%	structure and a vector of parameters, and fills the structure with
%	the given parameters. Also performs any necessary precomputation for
%	likelihood and gradient computations, so can be computationally
%	intensive to call.
%	 Arguments:
%	  MODEL - the HGPLVM structure to put the parameters in.
%	  PARAMS - parameter vector containing the parameters to put in the
%	   HGPLVM structure.
%	
%
%	See also
%	HGPLVMCREATE, HGPLVMEXTRACTPARAM, MODELEXPANDPARAM


%	Copyright (c) 2007 Neil D. Lawrence
% 	hgplvmExpandParam.m version 1.1


endVal = 0;
for i = 1:length(model.node)
  startVal = endVal + 1;
  endVal = endVal + model.node(i).numParams;
  model.node(i) = fgplvmExpandParam(model.node(i), params(startVal:endVal));
  endVal2 = length(model.tree(i).featureInd);
  % Update the 'target values' for this node's parents.
  if ~isempty(model.tree(i).dataInd)
    dataInd = model.tree(i).dataInd;
  else
    dataInd = [];
  end
  for j = 1:length(model.tree(i).children)
      childInd = model.tree(i).childLatentInd{j};
      child = model.tree(i).children(j);
      startVal2 = endVal2 + 1;
      endVal2 = endVal2 + length(childInd);
      if ~isempty(dataInd)
        model.node(i).y(:, startVal2:endVal2) = ...
            [model.node(child).X(dataInd, childInd)];
      else
        model.node(i).y(:, startVal2:endVal2) = ...
            [model.node(child).X(:, childInd)];
      end        
      % y has changed ... so we need to update m.
      model.node(i).m = gpComputeM(model.node(i));
    end
  end
end
