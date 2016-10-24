
% DEMOILLLE3 Demonstrate LLE on the oil data.
%
%	Description:
%	% 	demOilLle3.m SVN version 99
% 	last update 2008-10-05T23:10:16.785064Z

[Y, lbls] = lvmLoadData('oil');

options = lleOptions(16, 2);
model = lleCreate(2, size(Y, 2), Y, options);
model = lleOptimise(model);

lvmScatterPlot(model, lbls);

if exist('printDiagram') & printDiagram
  lvmPrintPlot(model, lbls, 'Oil', 3);
end

errors = lvmNearestNeighbour(model, lbls);
