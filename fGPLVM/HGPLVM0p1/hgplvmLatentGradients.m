function gX = hgplvmLatentGradients(model);

% HGPLVMLATENTGRADIENTS Gradients of the latent positions given parent GP-LVMs.
%
%	Description:
%
%	GX = HGPLVMLATENTGRADIENTS(MODEL) Compute the gradients of the log
%	likelihood of the hierarchical GP-LVM modea Gaussian with respect to
%	the latent points in the GP-LVM model.
%	 Returns:
%	  GX - the gradients with respect to latent points.
%	 Arguments:
%	  MODEL - the GP model for which log likelihood is to be computed.
%	
%
%	See also
%	HGPLVMCREATE, HGPLVMLOGLIKELIHOOD


%	Copyright (c) 2007 Neil D. Lawrence
% 	hgplvmLatentGradients.m version 1.1

  
for j = 1:length(model.node)
  if isempty(model.tree(j).dataInd)
    gX{j} = zeros(size(model.node(j).X));
  else
    gX{j} = zeros(length(model.tree(j).dataInd), size(model.node(j).X, 2));
  end
end

for k = 1:length(model.node)
  dataInd = model.tree(k).dataInd;
  if isempty(dataInd)
    dataInd = 1:size(model.node(k).m, 1);
  end
  endPreviousFeatures = length(model.tree(k).featureInd);

  for l = 1:length(model.tree(k).children)
    child = model.tree(k).children(l);
    childInd = model.tree(k).childLatentInd{l}; 
  
    % Deal with the fact that X appears in the *target* for the dynamics.
    switch model.node(k).approx
     case 'ftc'
      counter = endPreviousFeatures;
      for i = childInd
        counter = counter + 1;
        gX{child}(dataInd, i) = gX{child}(dataInd, i) ...
            - 1/model.node(k).scale(counter)*model.node(k).invK_uu...
            *model.node(k).m(:, counter);
      end
      
     case 'dtc'
      % Deterministic training conditional.
      AinvK_uf = pdinv((1/model.node(k).beta)*model.node(k).K_uu  ...
                       + model.node(k).K_uf*model.node(k).K_uf') ...
          *model.node(k).K_uf;
      counter = endPreviousFeatures;
      for i = 1:childInd
        counter = counter + 1;
        gX{child}(dataInd, i) = gX{child}(dataInd, i) ...
            - 1/model.node(k).scale(counter)*model.node(k).beta*model.node(k).X(:, i) ...
            + 1/model.node(k).scale(counter)*model.node(k).beta*model.node(k).K_uf' ...
            *(AinvK_uf*model.node(k).m(:, counter));
      end
      
     case 'fitc'
      % Fully independent training conditional.
      K_ufDinv = model.node(k).K_uf*model.node(k).Dinv;;
      AinvK_ufDinv = model.node(k).Ainv*K_ufDinv;
      counter = endPreviousFeatures;
      for i = 1:childInd
        counter = counter + 1;
        gX{child}(dataInd, i) = gX{child}(dataInd, i) ...
            -model.node(k).beta/model.node(k).scale(counter)*sparseDiag(1./model.node(k).diagD)*model.node(k).m(:, counter) ...
            + model.node(k).beta/model.node(k).scale(counter)*K_ufDinv'*AinvK_ufDinv*model.node(k).m(:, counter);
      end
      
     case 'pitc'
      % Partially independent training conditional.
      startVal = 1;
      for i = 1:length(model.node(k).blockEnd)
        endVal = model.node(k).blockEnd(i);
        ind = startVal:endVal;
        gXbase(:, ind) =  model.node(k).K_uf(:, ind)*model.node(k).Dinv{i};
        startVal = endVal + 1;
      end  
      startVal = 1;
      i = 1;
      while i <= length(model.node(k).blockEnd)
        endVal = model.node(k).blockEnd(i);
        ind = startVal:endVal;
        K_ufDinv = model.node(k).K_uf(:, ind)*model.node(k).Dinv{i};
        AinvK_ufDinv = model.node(k).Ainv*K_ufDinv;
        counter = endPreviousFeatures;
        for j = 1:childInd 
          counter = counter + 1;
          gX{child}(dataInd, j) = gX{child}(dataInd, j) - model.node(k).beta/model.node(k).scale(counter)*model.node(k).Dinv{i}*model.node(k).m(ind, j);
          gX{child}(dataInd(ind), j) = gX{child}(dataInd(ind), j) + model.node(k).beta/ ...
              model.node(k).scale(counter)*gXbase'*AinvK_ufDinv*model.node(k).m(ind, counter);
          
        end
        startVal = endVal + 1;
        i = i + 1;
      end
    end % ends approximation cases
    endPreviousFeatures = endPreviousFeatures + length(childInd);
  end
end

