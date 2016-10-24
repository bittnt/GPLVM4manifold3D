
% DEMVOWELSISOMAP Model the vowels data with a 2-D FGPLVM using RBF kernel.
%
%	Description:
%	% 	demVowelsIsomap.m CVS version 1.2
% 	demVowelsIsomap.m SVN version 29
% 	last update 2007-11-03T14:33:05.000000Z

% Fix seeds
randn('seed', 1e5);
rand('seed', 1e5);

dataSetName = 'vowels';
experimentNo = 1;
ind
% load data
[Y, lbls] = lvmLoadData(dataSetName);
ind = randperm(size(Y,1));
model.X = isomapEmbed(Y, 2);

save('demVowelsIsomap', 'model');

figure,
hold on

ax = gca;
lvmTwoDPlot(model.X, lbls, getSymbols(size(lbls, 2)));
xLim = [min(model.X(:, 1)) max(model.X(:, 1))]*1.1;
yLim = [min(model.X(:, 2)) max(model.X(:, 2))]*1.1;
set(ax, 'xLim', xLim);
set(ax, 'yLim', yLim);

set(ax, 'fontname', 'arial');
set(ax, 'fontsize', 20);

errors = fgplvmNearestNeighbour(model, lbls);

