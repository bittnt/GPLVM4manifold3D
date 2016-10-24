function g = orderedGradX(X, Y, model, prior)

% ORDEREDGRADX Gradient wrt x of log-likelihood for Ordered categorical model.
%
%	Description:
%	g = orderedGradX(X, Y, model, prior)
%% 	orderedGradX.m CVS version 1.2
% 	orderedGradX.m SVN version 29
% 	last update 2007-11-03T14:29:07.000000Z



if size(X, 1) > 1
  error('This function only takes one data-point');
end