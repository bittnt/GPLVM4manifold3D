
% DEMSILHOUETTEPLOTTRUE Plot the true poses for the silhouette data.
%
%	Description:
%	% 	demSilhouettePlotTrue.m SVN version 327
% 	last update 2008-12-02T10:27:12.000000Z
dataSetName = 'silhouette';

% load data
[X, y, XTest, yTest] = mapLoadData(dataSetName);

counter = 0;
if printDiagram
  fileBase = ['dem' capName 'GpTrue'];
  for i = ind
    counter = counter + 1;
    figure
    handle = xyzankurVisualise(yTest(i,:), 1);
    printPlot([fileBase '_' num2str(counter)], '../tex/diagrams', '../html') 
  end
end
