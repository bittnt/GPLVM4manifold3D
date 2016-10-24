
% DEMHIGHFIVEPRINTPLOT Print high five results to svg file.
%
%	Description:
%	

%	Copyright (c) 2007 Neil D. Lawrence
% 	demHighFivePrintPlot.m version 1.1


dataSetName = 'highFive';
capName = dataSetName;
capName(1) = upper(capName(1));
experimentNo = 1;

pointDisplay(1).node = 3;
pointDisplay(1).t = 85;
pointDisplay(2).node = 3;
pointDisplay(2).t = 114;
pointDisplay(3).node = 3;
pointDisplay(3).t = 127;
pointDisplay(4).node = 3;
pointDisplay(4).t = 141;
pointDisplay(5).node = 3;
pointDisplay(5).t = 155;
pointDisplay(6).node = 3;
pointDisplay(6).t = 170;
pointDisplay(7).node = 3;
pointDisplay(7).t = 190;
pointDisplay(8).node = 3;
pointDisplay(8).t = 215;
pointDisplay(1).label = 'A';
pointDisplay(1).fontSize = 10;
pointDisplay(2).label = 'B';
pointDisplay(2).fontSize = 10;
pointDisplay(3).label = 'C';
pointDisplay(3).fontSize = 10;
pointDisplay(4).label = 'D';
pointDisplay(4).fontSize = 10;
pointDisplay(5).label = 'E';
pointDisplay(5).fontSize = 10;
pointDisplay(6).label = 'F';
pointDisplay(6).fontSize = 10;
pointDisplay(7).label = 'G';
pointDisplay(7).fontSize = 10;
pointDisplay(8).label = 'H';
pointDisplay(8).fontSize = 10;
pointDisplay(7).label = 'G';
pointDisplay(7).fontSize = 10;
pointDisplay(8).label = 'H';
pointDisplay(8).fontSize = 10;
numDisplay = length(pointDisplay);
bmargin = 0.4;
displayAxes = hgplvmHierarchicalPrintPlot(model, visualiseNodes, [], ...
                                     capName, experimentNo, ...
                                          pointDisplay, [0.1 0.1 ...
                    0.03 bmargin]);

numCol =4;
numRow = 2;
i = 0;
for row = numRow:-1:1
  for col = 1:numCol
    i = i+1;
    ax = displayAxes(i);
    tar = get(ax, 'cameratarget');
    pos = get(ax, 'cameraposition');
    newPos = tar + (rotationMatrix(0, -pi/8, pi/2)*(pos - tar)')';
    %    if row == 2
    %      newPos = tar + (rotationMatrix(0, 0, (col-1)*(pi/10))* ...
    %                      (newPos-tar)')';
    %    else
    %      newPos = tar + (rotationMatrix(0, 0, 4+(col-1)*(pi/10))* ...
    %                      (newPos-tar)')';
    %    end
    newPos = tar + (rotationMatrix(0, 0, 7/10*pi)*(newPos-tar)')';
    set(ax, 'cameraposition', newPos)
    set(ax, 'xlim', [-20 25]);
    set(ax, 'ylim', [-15 8])
    set(ax, 'visible', 'off')
    set(ax, 'position', [(col-1)/numCol (row-1)*bmargin/numRow 1/numCol bmargin/numRow])
  end
end


fileName = ['dem' capName num2str(experimentNo)];
plot2svg(['../tex/diagrams/' fileName '.svg']);