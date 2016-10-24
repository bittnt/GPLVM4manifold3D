
% DEMWALKRUNPRINTPLOT Print the results from the walk/run experiment.
%
%	Description:
%	

%	Copyright (c) 2007 Neil D. Lawrence
% 	demWalkRunPrintPlot.m version 1.1


dataSetName = 'walkRun';
capName = dataSetName;
capName(1) = upper(capName(1));
experimentNo = 1;


phase1 = 0;
phase2 = pi;
pointDisplay(1).node = 9;
pointDisplay(1).t = 0+phase1;
pointDisplay(2).node = 9;
pointDisplay(2).t = 2*pi/3 +phase1;
pointDisplay(3).node = 9;
pointDisplay(3).t = 4*pi/3+phase1;

pointDisplay(4).node = 10;
pointDisplay(4).t = 0 + phase2;
pointDisplay(5).node = 10;
pointDisplay(5).t = 2*pi/3 +phase2;
pointDisplay(6).node = 10;
pointDisplay(6).t = 4*pi/3 + phase2;
pointDisplay(1).label = 'A';
pointDisplay(2).label = 'B';
pointDisplay(3).label = 'C';
pointDisplay(4).label = 'D';
pointDisplay(5).label = 'E';
pointDisplay(6).label = 'F';
pointDisplay(1).fontSize = 12;
pointDisplay(2).fontSize = 12;
pointDisplay(3).fontSize = 12;
pointDisplay(4).fontSize = 12;
pointDisplay(5).fontSize = 12;
pointDisplay(6).fontSize = 12;
numDisplay = length(pointDisplay);
bmargin =0.2;
displayAxes = hgplvmHierarchicalPrintPlot(model, visualiseNodes, depVisData, ...
                                     capName, experimentNo, pointDisplay, [0.03 0.03 ...
                    0.03 bmargin]);

for i = 1:length(displayAxes)
  set(displayAxes(i), 'xlim', [-5 5])
  set(displayAxes(i), 'ylim', [-5 5])
  set(displayAxes(i), 'zlim', [0 30])
end
fileName = ['dem' capName num2str(experimentNo)];
plot2svg(['../tex/diagrams/' fileName '.svg']);
