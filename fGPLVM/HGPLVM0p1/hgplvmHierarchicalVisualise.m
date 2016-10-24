function displayAxes = hgplvmHierarchicalVisualise(model, visualiseNodes, ...
                                                  dependencyInfo, margins)

% HGPLVMHIERARCHICALVISUALISE Visualise the manifold.
%
%	Description:
%
%	DISPLAYAXES = HGPLVMHIERARCHICALVISUALISE(MODEL, VISUALISENODES,
%	DEPENDENCYINFO) Produces the main plot containing the subplot
%	hierarchy of latent spaces for all models in visualiseNodes. The
%	main output graph (for the latent spaces) is also produced here.
%	 Returns:
%	  DISPLAYAXES - the axes handle where the visualisation is
%	   displayed.
%	 Arguments:
%	  MODEL - the model to be visualised.
%	  VISUALISENODES - structure containing all the relevant information
%	   for visualisation.
%	  DEPENDENCYINFO - 
%	
%
%	See also
%	HGPLVMCREATE, HGPLVMLATENTSPACEHANDLER, FGPLVMVISUALISE


%	Copyright (c) 2006, 2007 Andrew J. Moore and Neil D. Lawrence
% 	hgplvmHierarchicalVisualise.m version 1.1



% The original idea was to have a visualiseInfo field for each
% visualiseNode. However, if this new field would be added in this function,
% then due to the way Matlab has a copy-on-write strategy to memory, the
% entire visualiseNodes variable would be duplicated (then the variable
% specific to this function would have the visualiseInfo field added).
% Since each visualiseNode contains a model, this duplication would be a
% huge waste of memory. Thus, the visualiseInfo, for now, is kept as a
% seperate entity. The element visualiseInfo(i) corresponds to
% visualiseNodes(i).

global visualiseInfo dependencyVisData

if nargin < 2
    dependencyInfo = [];
end
dependencyVisData = dependencyInfo;
%visualiseInfo = zeros(size(visualiseNodes, 1));


figLatent = figure(1);
%define a main 'canvas' axes for plotting lines joining up subplots
mainAxes = axes('Position', [0 0 1 1], 'Visible', 'Off', 'Xlim', [0 1], 'YLim', [0 1]);
if nargin < 4
  tmargin = 0.03;
  bmargin = 0.03;
  lmargin = 0.03;
  rmargin = 0.25;
else
  lmargin = margins(1);
  rmargin = margins(2);
  tmargin = margins(3);
  bmargin = margins(4);
end
hPadding = 0.02;
vPadding = 0.02;

displayAxes = axes('position', ...
                   [1-rmargin+hPadding bmargin+vPadding ...
                    rmargin-2*hPadding 1-tmargin-bmargin-2*vPadding]);
[plotW, plotH, plotCoords] = calculatePlotPosition;
indAlreadyDrawn = [];
indRoots = treeFindRoots(model.tree);
for i = indRoots
  visualise(i);
end

set(figLatent, 'WindowButtonMotionFcn', {@hgplvmLatentSpaceHandler, ...
                    'move', visualiseNodes});
set(figLatent, 'WindowButtonDownFcn', {@hgplvmLatentSpaceHandler, ...
                    'click', visualiseNodes});
dummyVar = 0;

  function visualise(nodeIndex)
    if ~any(indAlreadyDrawn == nodeIndex)
      visualiseModify = 'skelModifyHierarchical';
      visualiseInfo(nodeIndex).plotAxes = lvmHierarchicalScatterPlot(model.node(nodeIndex), visualiseNodes(nodeIndex).labels);
      set(visualiseInfo(nodeIndex).plotAxes, 'UserData', nodeIndex);
      set(visualiseInfo(nodeIndex).plotAxes, 'Position', [plotCoords(nodeIndex, 1), ...
                          plotCoords(nodeIndex, 2), plotW, plotH]);
      set(visualiseInfo(nodeIndex).plotAxes, 'FontUnits', 'normalized');
      set(visualiseInfo(nodeIndex).plotAxes, 'FontSize', 0.07);
      %hide axes for now to clarify vision
      set(visualiseInfo(nodeIndex).plotAxes, 'XTickLabel', {''});
      set(visualiseInfo(nodeIndex).plotAxes, 'YTickLabel', {''});
      title(visualiseNodes(nodeIndex).name);
    end
    %draw a connecting line to this node's parent.
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
    %draw a connecting line to this node's children.
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
    
    if ~any(indAlreadyDrawn == nodeIndex)
      visualiseInfo(nodeIndex).latentHandle = line(0, 0, 'markersize', 20, ...
                                                   'color', [0 0 0], ...
                                                   'marker', '.', ...
                                                   'visible', 'on', ...
                                                   'erasemode', 'xor');
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
      visualiseInfo(nodeIndex).clicked = 0;
      
      visualiseInfo(nodeIndex).digitAxes = [];
      visualiseInfo(nodeIndex).digitIndex = [];
      pos = get(visualiseInfo(nodeIndex).plotAxes, 'pos');
      radioPos(1) = pos(1);
      radioPos(2) = pos(2) + 0.05*pos(4);
      radioPos(3) = 0.2*pos(3);
      radioPos(4) = 0.05*pos(4);
      visualiseInfo(nodeIndex).dynamicsRadio = ...
          uicontrol('Style', 'radiobutton', ...
                    'String', 'Run Dynamics', ...
                    'units', 'normalized', ...
                    'position', radioPos, ...
                    'Callback', {@hgplvmLatentSpaceHandler, 'toggleDynamics', visualiseNodes, nodeIndex}, ...
                    'value', 0);
      visualiseInfo(nodeIndex).runDynamics = 0;
      
      sliderPos(1) = pos(1);
      sliderPos(2) = pos(2)+0.95*pos(4);
      sliderPos(3) = pos(3);
      sliderPos(4) = 0.05*pos(4);
      visualiseInfo(nodeIndex).dynamicsSlider = ...
          uicontrol('Style', 'slider', ...
                    'String', 'Time', ...
                    'sliderStep', [0.01, 0.1], ...
                    'units', 'normalized', ...
                    'position', sliderPos, ...
                    'callback', {@hgplvmLatentSpaceHandler, ...
                          'dynamicsSliderChange', visualiseNodes, nodeIndex});
      
      visualiseInfo(nodeIndex).model = model.node(nodeIndex);
      visualiseInfo(nodeIndex).tree = model.tree(nodeIndex);
      visualiseInfo(nodeIndex).varargin = {}; %vargin vars such as padding and labels now direct fields of the visualiseNodes structure.
      visualiseInfo(nodeIndex).visualiseModify = str2func(visualiseModify);
      
      if ~isfield(model.node(nodeIndex), 'dynamics') | isempty(model.node(nodeIndex).dynamics)
        set(visualiseInfo(nodeIndex).dynamicsRadio, 'visible', 'off');
        set(visualiseInfo(nodeIndex).dynamicsSlider, 'visible', 'off');
      else
        if ~isfield(model.node(nodeIndex).dynamics, 'dynamicsType') 
          set(visualiseInfo(nodeIndex).dynamicsRadio, 'visible', 'on');
          set(visualiseInfo(nodeIndex).dynamicsSlider, 'visible', 'off');
        else
          switch model.node(nodeIndex).dynamics.dynamicsType
           case 'regressive'
            set(visualiseInfo(nodeIndex).dynamicsRadio, 'visible', 'off');
            set(visualiseInfo(nodeIndex).dynamicsSlider, 'visible', 'on');
            set(visualiseInfo(nodeIndex).dynamicsSlider, ...
                'min', min(model.node(nodeIndex).dynamics.X), ...
                'max', max(model.node(nodeIndex).dynamics.X), ...
                'value', model.node(nodeIndex).dynamics.X(1));
           case 'auto-regressive'
            set(visualiseInfo(nodeIndex).dynamicsRadio, 'visible', 'on');
            set(visualiseInfo(nodeIndex).dynamicsSlider, 'visible', 'off');
          end
        end
      end
      %only plot leaf node subskels as they are the only nodes that
      %contain skel information.
      if (~isempty(visualiseNodes(nodeIndex).subskel))
        visualiseInfo(nodeIndex).visHandle ...
            = plotSubSkel(nodeIndex,...
                          visualiseInfo(nodeIndex).model, ...
                          visualiseNodes(nodeIndex).subskel, ...
                          visualiseNodes(nodeIndex).padding, displayAxes);
      end
      drawnow
      indAlreadyDrawn = [indAlreadyDrawn nodeIndex];
      
      numChildren = length(model.tree(nodeIndex).children);
      for i=1:numChildren        
        width = 1/numChildren;
        pos = get(visualiseInfo(nodeIndex).plotAxes, 'pos');
        startPoint = (i-1)/numChildren;
        radioPos(1) = pos(1) + pos(3)*startPoint;
        radioPos(2) = pos(2);
        radioPos(3) = pos(3)*width;
        radioPos(4) = 0.05*pos(4);
        visualiseInfo(nodeIndex).updateChildrenRadio(i) = ...
            uicontrol('Style', 'radiobutton', ...
                      'String', visualiseNodes(model.tree(nodeIndex).children(i)).name, ...
                      'units', 'normalized', ...
                      'position', radioPos, ...
                      'Callback', {@hgplvmLatentSpaceHandler, 'toggleChildUpdateDynamics', visualiseNodes, nodeIndex, i}, ...
                                 'value', 1, ...
                      'visible', 'on', 'userdata', i);
        visualiseInfo(nodeIndex).tree.updateChild(i) = 1;
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

end





