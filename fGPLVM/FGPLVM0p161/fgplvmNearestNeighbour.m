function err = fgplvmNearestNeighbour(model, lbls)

% FGPLVMNEARESTNEIGHBOUR Give the number of errors in latent space for 1 nearest neighbour.
%
%	Description:
%	err = fgplvmNearestNeighbour(model, lbls)
%% 	fgplvmNearestNeighbour.m CVS version 1.3
% 	fgplvmNearestNeighbour.m SVN version 29
% 	last update 2007-11-03T14:32:57.000000Z

d = dist2(model.X, model.X);
for i = 1:size(model.X, 1); 
  d(i, i) = inf; 
end

for i= 1:size(lbls, 1); 
  lbls2(i, :) =  find(lbls(i, :));
end
[void, ind] = min(d);
err = size(model.X, 1) - sum(lbls2(ind) == lbls2);
