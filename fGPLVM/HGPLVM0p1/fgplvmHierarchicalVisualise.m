function fgplvmHierarchicalVisualise(visualiseNodes, dependencyInfo)

% FGPLVMHIERARCHICALVISUALISE Visualise the manifold.
%
%	Description:
%
%	FGPLVMHIERARCHICALVISUALISE(VISUALISENODES) Produces the main plot
%	containing the subplot hierarchy of latent spaces for all models in
%	visualiseNodes. The main output graph (for the latent spaces) is
%	also produced here.
%	 Arguments:
%	  VISUALISENODES - structure containing all the relevant information
%	   for visualisation.


%	Copyright (c) 2006 Andrew Moore
% 	fgplvmHierarchicalVisualise.m version 1.5



% The original idea was to have a visualiseInfo field for each
% visualiseNode. However, if this new field would be added in this function,
% then due to the way Matlab has a copy-on-write strategy to memory, the
% entire visualiseNodes variable would be duplicated (then the variable
% specific to this function would have the visualiseInfo field added).
% Since each visualiseNode contains a model, this duplication would be a
% huge waste of memory. Thus, the visualiseInfo, for now, is kept as a
% seperate entity. The element visualiseInfo(x) corresponds to
% visualiseNodes(x).

global visualiseInfo dependencyVisData

if nargin < 2
    dependencyInfo = [];
end
dependencyVisData = dependencyInfo;
%visualiseInfo = zeros(size(visualiseNodes, 1));


figLatent = figure(1);
%define a main 'canvas' axes for plotting lines joining up subplots
mainAxes = axes('Position', [0 0 1 1], 'Visible', 'Off', 'Xlim', [0 1], 'YLim', [0 1]);
[plotW, plotH, plotCoords] = calculatePlotPosition;
visualise(1);

set(figLatent, 'WindowButtonMotionFcn', {@hierarchicalLatentSpaceHandler, 'move', visualiseNodes});
set(figLatent, 'WindowButtonDownFcn', {@hierarchicalLatentSpaceHandler, 'click', visualiseNodes});
dummyVar = 0;

    function visualise(nodeIndex)
        model = visualiseNodes(nodeIndex).model;
        visualiseModify = 'skelModifyHierarchical';
        visualiseInfo(nodeIndex).plotAxes = lvmHierarchicalScatterPlot(model, visualiseNodes(nodeIndex).labels);
        set(visualiseInfo(nodeIndex).plotAxes, 'UserData', nodeIndex);
        set(visualiseInfo(nodeIndex).plotAxes, 'Position', [plotCoords(nodeIndex, 1), ...
            plotCoords(nodeIndex, 2), plotW, plotH]);
        set(visualiseInfo(nodeIndex).plotAxes, 'FontUnits', 'normalized');
        set(visualiseInfo(nodeIndex).plotAxes, 'FontSize', 0.07);
        %hide axes for now to clarify vision
        set(visualiseInfo(nodeIndex).plotAxes, 'XTickLabel', {''});
        set(visualiseInfo(nodeIndex).plotAxes, 'YTickLabel', {''});
        title(visualiseNodes(nodeIndex).name);
        %draw a connecting line to this node's parent.
        if (~isempty(visualiseNodes(nodeIndex).parent))
            axes(mainAxes);
            parentPos = get(...
                visualiseInfo(visualiseNodes(nodeIndex).parent).plotAxes, 'Position');
            lineX = [parentPos(1) + plotW/2, plotCoords(nodeIndex, 1) + plotW/2];
            lineY = [parentPos(2), plotCoords(nodeIndex, 2) + plotH];
            line(lineX, lineY);
            axes(visualiseInfo(nodeIndex).plotAxes);
        end
        
        visualiseInfo(nodeIndex).latentHandle = line(0, 0, 'markersize', 20, 'color', ...
            [0 0 0], 'marker', '.', 'visible', 'on', 'erasemode', 'xor');
        %visualiseInfo(nodeIndex).visualiseFunction = str2func([visualiseNodes(nodeIndex).subskel.type 'Visualise']);
        visualiseInfo(nodeIndex).visualiseFunction = str2func('skelVisualiseHierarchical');
        
        % Set up the X limits and Y limits of the plot
        xLim = [min(model.X(:, 1)) max(model.X(:, 1))];
        xSpan = xLim(2) - xLim(1);
        xLim(1) = xLim(1) - 0.05*xSpan;
        xLim(2) = xLim(2) + 0.05*xSpan;
        xSpan = xLim(2) - xLim(1);

        yLim = [min(model.X(:, 2)) max(model.X(:, 2))];
        ySpan = yLim(2) - yLim(1);
        yLim(1) = yLim(1) - 0.05*ySpan;
        yLim(2) = yLim(2) + 0.05*ySpan;
        ySpan = yLim(2) - yLim(1);

        set(visualiseInfo(nodeIndex).plotAxes, 'XLim', xLim);
        set(visualiseInfo(nodeIndex).plotAxes, 'YLim', yLim);
        
        visualiseInfo(nodeIndex).clicked = 0;

        visualiseInfo(nodeIndex).digitAxes = [];
        visualiseInfo(nodeIndex).digitIndex = [];

        visualiseInfo(nodeIndex).dynamicsRadio = ...
            uicontrol('Style', 'radiobutton', ...
                      'String', 'Run Dynamics', ...
                      'units', 'normalized', ...
                      'position', [0 0 0.2 0.05], ...
                      'Callback', 'lvmClassVisualise(''toggleDynamics'')', ...
                      'value', 0);
        if ~isfield(model, 'dynamics')
          set(visualiseInfo(nodeIndex).dynamicsRadio, 'visible', 'off');
        end
        visualiseInfo(nodeIndex).runDynamics = 0;
        
        visualiseInfo(nodeIndex).model = model;
        visualiseInfo(nodeIndex).varargin = {}; %vargin vars such as padding and labels now direct fields of the visualiseNodes structure.
        visualiseInfo(nodeIndex).visualiseModify = str2func(visualiseModify);
        
        %only plot leaf node subskels as they are the only nodes that
        %contain skel information.
        if (~isempty(visualiseNodes(nodeIndex).subskel))
            visualiseInfo(nodeIndex).visHandle = plotSubSkel(nodeIndex,...
                visualiseNodes(nodeIndex).model, visualiseNodes(nodeIndex).subskel, visualiseNodes(nodeIndex).padding);
        end
        
        for i=1:length(visualiseNodes(nodeIndex).children)
            visualise(visualiseNodes(nodeIndex).children(i));
        end
        
    end

    %calculates the x and y position for each subplot, along with the width
    %and height the subplots should be. Assume the figure is defined using
    %as relative scale, such that its width and height are always 1.
    function [plotW, plotH, plotCoords] = calculatePlotPosition
        plotCoords = zeros(length(visualiseNodes), 2);
        [levelWidths, maxDepth, nodePositions] = treeGetWidths(visualiseNodes);
        hPadding = 0.05;
        vPadding = 0.05;
        cellW = 1/max(levelWidths);
        cellH = 1/max(maxDepth);
        plotW = cellW - 2*hPadding;
        plotH = cellH - 2*vPadding;
        maxWidth = max(levelWidths);
        for i=1:maxDepth
            plotBottom = 1 - (i*(2*vPadding + plotH) - vPadding);
            for j=1:levelWidths(i)
                plotLeft = (j-1)*(2*hPadding + plotW) + hPadding;
                plotCoords(nodePositions(i, j), 1) = plotLeft;
                plotCoords(nodePositions(i, j), 2) = plotBottom;
            end
        end
    end

end

% figure(2)
% %clf
% 
% if strcmp(visualiseFunction(1:5), 'image') & length(varargin)>0
%   set(gcf, 'menubar', 'none')
%   xPixels = 115;
%   yPixels = 115;
%   set(gcf, 'position', [232 572 xPixels yPixels/varargin{1}(1)*varargin{1}(2)])
%   visualiseInfo(index).visualiseAxes = subplot(1, 1, 1);
%   xWidth = varargin{1}(1)/xPixels;
%   yHeight = varargin{1}(2)/yPixels;
%   set(visualiseInfo(index).visualiseAxes, 'position', [0.5-xWidth/2 0.5-yHeight/2 xWidth yHeight])
% else
%   visualiseInfo(index).visualiseAxes =subplot(1, 1, 1);
% end
% visData = zeros(1,model.d);
% if(strcmp(visualiseFunction(1:5), 'image'))
%   visData(1) = min(min(model.y));
%   visData(end) = max(max(model.y));
% else
%   [void, indMax]= max(sum((model.y.*model.y), 2));
%   visData = model.y(indMax, :);
% end
% visualiseInfo(index).visualiseFunction = str2func(visualiseFunction);
% visHandle = visualiseInfo(index).visualiseFunction(visData, varargin{:});
% set(visHandle, 'erasemode', 'xor')
% colormap gray
% 
% % % Pass the data to visualiseInfo
  

%hold off




