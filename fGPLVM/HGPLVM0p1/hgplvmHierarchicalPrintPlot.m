function displayAxes = hgplvmHierarchicalPrintPlot(model, visualiseNodes, dependencyInfo, ...
                                     capName, experimentNo, pointDisplay, ...
                                                  margins)

% HGPLVMHIERARCHICALPRINTPLOT Print latent space for learnt model.
%
%	Description:
%
%	HGPLVMHIERARCHICALPRINTPLOT(MODEL, LBLS, CAPNAME, EXPERIMENTNO)
%	prints a latent space repsresentation for an HGPLVM model.
%	 Arguments:
%	  MODEL - the model to use for plotting the latent space.
%	  LBLS - any lables that are available for plotting.
%	  CAPNAME - the name of the saved plots.
%	  EXPERIMENTNO - the experiment number to assign to the files.
%	
%
%	See also
%	LVMSCATTERPLOT


%	Copyright (c) 2006 Neil D. Lawrence
% 	hgplvmHierarchicalPrintPlot.m version 1.1


global visualiseInfo dependencyVisData

dependencyVisData = dependencyInfo;
%visualiseInfo = zeros(size(visualiseNodes, 1));


figLatent = figure(1);
set(figLatent, 'paperposition', [0 0 8.5 11])
pos = get(figLatent, 'position');
pos(4) = pos(3)*11/8.5;
set(figLatent, 'position', pos);
%define a main 'canvas' axes for plotting lines joining up subplots
mainAxes = axes('Position', [0 0 1 1], 'Visible', 'Off', 'Xlim', [0 1], 'YLim', [0 1]);
if nargin < 4
  tmargin = 0.03;
  bmargin = 0.2;
  lmargin = 0.03;
  rmargin = 0.03;
else
  lmargin = margins(1);
  rmargin = margins(2);
  tmargin = margins(3);
  bmargin = margins(4);
end
hPadding = 0.02;
vPadding = 0.04;
numDisplay = length(pointDisplay);
pwidth =(1 - rmargin - lmargin)/numDisplay;
for i = 1:numDisplay
  displayAxes(i) = axes('position', ...
                        [rmargin + (i-1)*pwidth 0 ...
                      pwidth bmargin]);
end
[plotW, plotH, plotCoords] = calculatePlotPosition;
indAlreadyDrawn = 0;
indRoots = treeFindRoots(model.tree);
poseDisplay = cell(length(model.node), numDisplay);
for j = indRoots
  visualise(j);
end
for j = 1:numDisplay
  set(displayAxes(j), 'visible', 'off');
  displayPoint(j)
  axes(displayAxes(j));
  xlim = get(gca, 'xlim');
  ylim = get(gca, 'ylim');
  zlim = get(gca, 'zlim');
  tempTitle = title(pointDisplay(j).label);
  pos = get(tempTitle, 'pos');
  displayTitle(j) = text(xlim(1), ...
                         ylim(1), ...
                         zlim(2), ...
                         pointDisplay(j).label);
  extent = get(displayTitle(j), 'extent');
  zspan = zlim(2) - zlim(1);
  pos(3) = zlim(2) + zspan*0.1;
  set(displayTitle(j), 'position', pos)
%  pos = get(displayTitle(j), 'position');
%  extent = get(displayTitle(j), 'extent');
%  pos(1) = pos(1) - 0.5*extent(3);
  set(displayTitle(j), 'position', pos);
  axes(displayAxes(j));
end
dummyVar = 0;

% fileName = ['dem' capName num2str(experimentNo)];
% print('-depsc', ['../tex/diagrams/' fileName])
% print('-deps', ['../tex/diagrams/' fileName 'NoColour'])

% % make smaller for PNG plot.
% pos = get(gcf, 'paperposition')
% origpos = pos;
% pos(3) = pos(3)/2;
% pos(4) = pos(4)/2;
% set(gcf, 'paperposition', pos);
% fontsize = get(gca, 'fontsize');
% set(gca, 'fontsize', fontsize/2);
% lineWidth = get(gca, 'lineWidth');
% set(gca, 'lineWidth', lineWidth*2);
% print('-dpng', ['../html/' fileName])
% set(gcf, 'paperposition', origpos);

% figure
% clf
% ax = axes('position', [0.05 0.05 0.9 0.9]);
% hold on
% %lvmTwoDPlot(model.X, lbls, getSymbols(size(lbls, 2)));
% %xLim = [min(model.X(:, 1)) max(model.X(:, 1))]*1.1;
% %yLim = [min(model.X(:, 2)) max(model.X(:, 2))]*1.1;
% %set(ax, 'xLim', xLim);
% %set(ax, 'yLim', yLim);

% set(ax, 'fontname', 'arial');
% set(ax, 'fontsize', 20);
% print('-depsc', ['../tex/diagrams/' fileName 'NoGray'])
% print('-deps', ['../tex/diagrams/' fileName 'NoGrayNoColour'])

function visualise(nodeIndex)


 if ~any(indAlreadyDrawn == nodeIndex)
   visualiseModify = 'skelModifyHierarchical';
   visualiseInfo(nodeIndex).plotAxes = lvmLocalScatterPlot(model.node(nodeIndex), ...
                                                     visualiseNodes(nodeIndex).labels);
   
   set(visualiseInfo(nodeIndex).plotAxes, 'box', 'on')
 end
  
%   %lvmHierarchicalScatterPlot, );
%   set(visualiseInfo(nodeIndex).plotAxes, 'UserData', nodeIndex);
set(visualiseInfo(nodeIndex).plotAxes, 'Position', [plotCoords(nodeIndex, 1), ...
                    plotCoords(nodeIndex, 2), plotW, plotH]);
       set(visualiseInfo(nodeIndex).plotAxes, 'FontUnits', 'normalized');
       set(visualiseInfo(nodeIndex).plotAxes, 'FontSize', 0.07);
%       %hide axes for now to clarify vision
%       set(visualiseInfo(nodeIndex).plotAxes, 'XTickLabel', {''});
%       set(visualiseInfo(nodeIndex).plotAxes, 'YTickLabel', {''});
%     end
%     %draw a connecting line to this node's parent.
     if ~isempty(model.tree(nodeIndex).parent)
       for i = 1:length(model.tree(nodeIndex).parent)
         parent = model.tree(nodeIndex).parent(i);
         if any(indAlreadyDrawn==parent)
           axes(mainAxes);
           parentPos = get(...
               visualiseInfo(model.tree(nodeIndex).parent).plotAxes, 'Position');
           lineX = [parentPos(1) + plotW/2, plotCoords(nodeIndex, 1) + plotW/2];
           lineY = [parentPos(2), plotCoords(nodeIndex, 2) + plotH];
           line(lineX, lineY);
           axes(visualiseInfo(nodeIndex).plotAxes);
         end
       end
     end
%     %draw a connecting line to this node's children.
     if ~isempty(model.tree(nodeIndex).children)
       for i = 1:length(model.tree(nodeIndex).children)
         child = model.tree(nodeIndex).children(i);
         if any(indAlreadyDrawn==child)
           axes(mainAxes);
           childPos = get(...
               visualiseInfo(child).plotAxes, 'Position');
           lineX = [childPos(1) + plotW/2, plotCoords(nodeIndex, 1) + plotW/2];
           lineY = [childPos(2)+childPos(4), plotCoords(nodeIndex, 2)];
           line(lineX, lineY);
           axes(visualiseInfo(nodeIndex).plotAxes);
         end
       end
     end
     title(visualiseNodes(nodeIndex).name);
%     axes(visualiseInfo(nodeIndex).plotAxes);
    
     if ~any(indAlreadyDrawn == nodeIndex)
       %visualiseInfo(nodeIndex).visualiseFunction = str2func([visualiseNodes(nodeIndex).subskel.type 'Visualise']);
       visualiseInfo(nodeIndex).visualiseFunction = str2func('skelVisualiseHierarchical');
     
       % Set up the X limits and Y limits of the plot
       xLim = [min(model.node(nodeIndex).X(:, 1)) max(model.node(nodeIndex).X(:, 1))];
       xSpan = xLim(2) - xLim(1);
       xLim(1) = xLim(1) - 0.1*xSpan;
       xLim(2) = xLim(2) + 0.1*xSpan;
       xSpan = xLim(2) - xLim(1);
     
       yLim = [min(model.node(nodeIndex).X(:, 2)) max(model.node(nodeIndex).X(:, 2))];
       ySpan = yLim(2) - yLim(1);
       yLim(1) = yLim(1) - 0.1*ySpan;
       yLim(2) = yLim(2) + 0.1*ySpan;
       ySpan = yLim(2) - yLim(1);
      
       set(visualiseInfo(nodeIndex).plotAxes, 'XLim', xLim);
       set(visualiseInfo(nodeIndex).plotAxes, 'YLim', yLim);
%       visualiseInfo(nodeIndex).clicked = 0;
      
%       visualiseInfo(nodeIndex).digitAxes = [];
%       visualiseInfo(nodeIndex).digitIndex = [];
       visualiseInfo(nodeIndex).model = model.node(nodeIndex);
       visualiseInfo(nodeIndex).tree = model.tree(nodeIndex);
%       visualiseInfo(nodeIndex).varargin = {}; %vargin vars such as padding and labels now direct fields of the visualiseNodes structure.
       visualiseInfo(nodeIndex).visualiseModify = str2func(visualiseModify);
      
%       %only plot leaf node subskels as they are the only nodes that
%       %contain skel information.
       if (~isempty(visualiseNodes(nodeIndex).subskel))
         for j = 1:numDisplay
           poseDisplay{nodeIndex, j} ...
             = plotSubSkel(nodeIndex,...
                           visualiseInfo(nodeIndex).model, ...
                           visualiseNodes(nodeIndex).subskel, ...
                           visualiseNodes(nodeIndex).padding, ...
                           displayAxes(j));
           
         end
       end
       drawnow
       indAlreadyDrawn = [indAlreadyDrawn nodeIndex];
      
       numChildren = length(model.tree(nodeIndex).children);
       for i=1:numChildren        
         visualise(model.tree(nodeIndex).children(i));        
       end
     end
    
   end
    
  %calculates the x and y position for each subplot, along with the width
  %and height the subplots should be. Assume the figure is defined using
  %as relative scale, such that its width and height are always 1.
function [plotW, plotH, plotCoords] = calculatePlotPosition
  plotCoords = zeros(length(model.tree), 2);
    [levelWidths, maxDepth, nodePositions] = treeGetWidths(model.tree);
    cellW = (1-lmargin - rmargin)/max(levelWidths);
    cellH = (1-tmargin-bmargin)/max(maxDepth);
    plotW = cellW - 2*hPadding;
    plotH = cellH - 2*vPadding;
    maxWidth = max(levelWidths);
    for i=1:maxDepth
      plotBottom = 1 - (i*(2*vPadding + plotH) - vPadding)-tmargin;
      plotAddPadding = 0.5*(1-lmargin-rmargin-cellW*levelWidths(i));
      for j=1:levelWidths(i)
        plotLeft = (j-1)*(2*hPadding + plotW) + hPadding +lmargin + ...
            plotAddPadding;
        plotCoords(nodePositions(i, j), 1) = plotLeft;
        plotCoords(nodePositions(i, j), 2) = plotBottom;
      end
    end
  end



  function [ax, data] = lvmLocalScatterPlot(model, YLbls);

    % HGPLVM

    if isempty(YLbls)
      symbol = [];
    else
      symbol = getSymbols(size(YLbls,2));
    end
    
    ax = axes('position', [0.05 0.05 0.9 0.9]); %andy edit (next 2 lines)
    hold on
    
    data = lvmTwoDPlot(model.X, YLbls, symbol);
    xLim = [min(model.X(:, 1)) max(model.X(:, 1))]*1.2;
    yLim = [min(model.X(:, 2)) max(model.X(:, 2))]*1.2;
    set(ax, 'xLim', xLim);
    set(ax, 'yLim', yLim);
    
    set(ax, 'fontname', 'arial');
    set(ax, 'fontsize', 20);
    

  end

  function displayPoint(pointNo)
    t = pointDisplay(pointNo).t;
    X = modelOut(visualiseInfo(pointDisplay(pointNo).node).model.dynamics, t);
    x = X(1);
    y = X(2);
    updateVisualisation(pointDisplay(pointNo).node, x, y, pointNo);
    
  end
  function updateVisualisation(nodeIndex, coordX, coordY, pointNo)
    axes(visualiseInfo(nodeIndex).plotAxes)
    line(coordX, coordY, 'markersize', 10, 'marker', '.', 'color', ...
         [0 0 0]);
    xspan = get(gca, 'xlim');
    xspan = xspan(2) -xspan(1);
    text(coordX+0.05*xspan, coordY, pointDisplay(pointNo).label, ...
         'fontsize', pointDisplay(pointNo).fontSize);
    [mu, varsigma] = getDataPoints(coordX, coordY, visualiseInfo(nodeIndex));
    visualiseInfo(nodeIndex).latentPos=[coordX, coordY];
    Y = mu;
    
    %update any dependents
    for i = length(dependencyVisData):-1:1
      if nodeIndex == dependencyVisData(i).masterNodeIndex
        for j = 1:length(dependencyVisData(i).dependents)
          depNodeIndex = dependencyVisData(i).dependents(j);
          if ~isempty(visualiseInfo(depNodeIndex).latentPos)
            updateVisualisation(depNodeIndex, visualiseInfo(depNodeIndex).latentPos(1), ...
                                visualiseInfo(depNodeIndex).latentPos(2), ...
                                pointNo);
          end
        end
      end
    end
                        
        
    nodeChildren = visualiseInfo(nodeIndex).tree.children;
    if (length(nodeChildren) > 0)
      %mu should be of length 2*numChildren (2 coords per
      %latent space)
      for i = 1:length(nodeChildren)
        muX = mu(2*i - 1);
        muY = mu(2*i);
        updateVisualisation(nodeChildren(i), muX, muY, pointNo);
      end
    else
      visualiseInfo(nodeIndex).visualiseModify(poseDisplay{nodeIndex, pointNo}, ...
                                               Y, visualiseNodes(nodeIndex).subskel, nodeIndex, visualiseNodes(nodeIndex).padding);
      set(poseDisplay{nodeIndex, pointNo}, 'markersize', 5)
    end
    
  end
  function [mu, sigma] = getDataPoints(x, y, visualiseInfo)
    fhandle = str2func([visualiseInfo.model.type 'PosteriorMeanVar']);
    [mu, sigma] = fhandle(visualiseInfo.model, [x y]);
    if isfield(visualiseInfo.model, 'noise')
      Y = noiseOut(visualiseInfo.model.noise, mu, varsigma);
    else
      Y = mu;
    end
  end

end