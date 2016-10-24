
% DEMSWISSROLLFULLLLE4 Demonstrate LLE on the oil data.
%
%	Description:
%	% 	demSwissRollFullLle4.m SVN version 97
% 	last update 2008-10-05T23:10:16.238906Z

[Y, lbls] = lvmLoadData('swissRollFull');

options = lleOptions(32, 2);
model = lleCreate(2, size(Y, 2), Y, options);
model = lleOptimise(model);

lvmScatterPlotColor(model, model.Y(:, 2));

if exist('printDiagram') & printDiagram
  lvmPrintPlot(model, model.Y(:, 2), 'SwissRollFull', 4, true);
end
