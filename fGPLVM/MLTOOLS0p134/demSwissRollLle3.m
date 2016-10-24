
% DEMSWISSROLLLLE3 Demonstrate LLE on the oil data.
%
%	Description:
%	% 	demSwissRollLle3.m SVN version 560
% 	last update 2009-10-27T18:36:22.713212Z

[Y, lbls] = lvmLoadData('swissRoll');

options = lleOptions(16);
model = lleCreate(2, size(Y, 2), Y, options);
model = lleOptimise(model, 2);

lvmScatterPlotColor(model, model.Y(:, 2));

if exist('printDiagram') & printDiagram
  lvmPrintPlot(model, model.Y(:, 2), 'SwissRoll', 3, true);
end
