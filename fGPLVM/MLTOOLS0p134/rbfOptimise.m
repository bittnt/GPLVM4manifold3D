function model = rbfOptimise(model, X, Y, display, iters);

% RBFOPTIMISE Optimise RBF for given inputs and outputs.
%
%	Description:
%	model = rbfOptimise(model, X, Y, display, iters);
%% 	rbfOptimise.m CVS version 1.2
% 	rbfOptimise.m SVN version 24
% 	last update 2007-03-27T18:20:35.851941Z

if nargin < 4
  display = 1;
  if nargin < 5
    iters = 500;
  end
end

options = optOptions;
options(14) = iters;
options(1) = display;
model = netopt(model, options, X, Y, 'scg');  