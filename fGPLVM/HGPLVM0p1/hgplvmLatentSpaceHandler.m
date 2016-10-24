function hgplvmLatentSpaceHandler(src, eventdata, action, visualiseNodes, ...
                                  axesIndex, childIndex)

% HGPLVMLATENTSPACEHANDLER Event handler for the HGPLVM latent space.
%
%	Description:
%
%	HGPLVMLATENTSPACEHANDLER(SRC, MODEL, ACTION, VISUALISENODES) Handler
%	for mouse events on the latent space axes.  The UserData parameter
%	of the CurrentAxes that has received the mouse event refers to a
%	visualiseInfo structure containing the related skeleton data.
%	 Arguments:
%	  SRC - 
%	  MODEL - 
%	  ACTION - The mouse action, 'click' or 'move'.
%	  VISUALISENODES - contains the skeleton and display info, and is
%	   passed in.% COPYRIGHT : Andrew J. Moore and Neil D. Lawrence,
%	   2006, 2007
%
%	See also
%	HGPLVMVISUALISE


%	Copyright (c) 2007 Neil D. Lawrence
% 	hgplvmLatentSpaceHandler.m version 1.1


%visualiseInfo contains the plot, and is global.


global visualiseInfo dependencyVisData
persistent oldt
%check this has been called from a valid axes (one where there is a defined
%UserData).
if any(strcmp(action, {'click', 'move'}))
  if gcf ~= src %check that the latent window is actually the current figure.
    return;
  end
end
if nargin < 5 | isempty(axesIndex)
  axesIndex = get(gca, 'UserData');
  if axesIndex == 0
    % This is the display axes.
    return
  end
else
  axes(visualiseInfo(axesIndex).plotAxes)
end

if ~isempty(axesIndex)
  switch action
   case 'toggleChildUpdateDynamics'
    visualiseInfo(axesIndex).tree.updateChild(childIndex) = get(visualiseInfo(axesIndex).updateChildrenRadio(childIndex), 'value');
    disp([childIndex, axesIndex])
   case 'toggleDynamics'
    visualiseInfo(axesIndex).runDynamics = ~visualiseInfo(axesIndex).runDynamics;
    set(visualiseInfo(axesIndex).dynamicsRadio, 'value', ...
                      visualiseInfo(axesIndex).runDynamics);
    
   case 'dynamicsSliderChange'
    t = get(visualiseInfo(axesIndex).dynamicsSlider, 'value');
    X = modelOut(visualiseInfo(axesIndex).model.dynamics, t);
    x = X(1);
    y = X(2);
    updateVisualisation(axesIndex, x, y);
    
   case 'click'
    point  = get(gca, 'CurrentPoint');
    x = point(1, 1);
    y = point(1, 2);
    xlim = get(gca, 'XLim');
    ylim = get(gca, 'YLim');
    if (x > xlim(1) && x < xlim(2) && y > ylim(1) && y < ylim(2))
      visualiseInfo(axesIndex).latentPos = [x y];
      visualiseInfo(axesIndex).clicked = ~visualiseInfo(axesIndex).clicked;
      if isfield(visualiseInfo(axesIndex).model, 'dynamics') & ~isempty(visualiseInfo(axesIndex).model.dynamics)
        if visualiseInfo(axesIndex).runDynamics
          visualiseInfo(axesIndex).dynamicsRunning = 1;
          hgplvmLatentSpaceHandler(src, eventdata, ...
                                   'runDynamics', visualiseNodes, axesIndex);
          visualiseInfo(axesIndex).dynamicsRunning = 0;
        end
      else
        visualiseInfo(axesIndex).dynamicsRunning = 0;
      end
    end
    
   case 'move'
    point  = get(gca, 'CurrentPoint');
    x = point(1, 1);
    y = point(1, 2);
    xlim = get(gca, 'XLim');
    ylim = get(gca, 'YLim');
    if(x > xlim(1) & x < xlim(2) ...
       & y > ylim(1) & y < ylim(2) ...
       & visualiseInfo(axesIndex).clicked ...
       & ~visualiseInfo(axesIndex).runDynamics)
      updateVisualisation(axesIndex, x, y);
    end
    
   case 'runDynamics'
    while visualiseInfo(axesIndex).clicked & visualiseInfo(axesIndex).runDynamics
      visualiseInfo(axesIndex).latentPos = modelSamp(visualiseInfo(axesIndex).model.dynamics, ...
                                                     visualiseInfo(axesIndex).latentPos);
      x = visualiseInfo(axesIndex).latentPos(1);
      y = visualiseInfo(axesIndex).latentPos(2);
      updateVisualisation(axesIndex, x, y);
      pause(0.0001)
    end
   otherwise 
    warning('Unknown call back requested')
  end
else
  warning('No UserData property defined for this axis. The UserData property should contain an index to the visualiseInfo for this structure.');
end

  %Given latent points x and y, return expected data points and variance
  function [mu, sigma] = getDataPoints(x, y, visualiseInfo)
    fhandle = str2func([visualiseInfo.model.type 'PosteriorMeanVar']);
    [mu, sigma] = fhandle(visualiseInfo.model, [x y]);
    if isfield(visualiseInfo.model, 'noise')
      Y = noiseOut(visualiseInfo.model.noise, mu, varsigma);
    else
      Y = mu;
    end
  end

  %Updates the visualisation given the latent coordinates of the current node
  %(indicated by the axes the operation was performed on). Recursively works
  %through the hierarchy.  Remember, only leaf nodes represent a mapping to
  %data space.  
  function updateVisualisation(nodeIndex, coordX, coordY)
    [mu, varsigma] = getDataPoints(coordX, coordY, visualiseInfo(nodeIndex));
    visualiseInfo(nodeIndex).latentPos=[coordX, coordY];
    set(visualiseInfo(nodeIndex).latentHandle, 'xdata', coordX, 'ydata', coordY);
    Y = mu;
    
    %update any dependents
    for i = length(dependencyVisData):-1:1
      if nodeIndex == dependencyVisData(i).masterNodeIndex
        for j = 1:length(dependencyVisData(i).dependents)
          depNodeIndex = dependencyVisData(i).dependents(j);
          if ~isempty(visualiseInfo(depNodeIndex).latentPos)
            updateVisualisation(depNodeIndex, visualiseInfo(depNodeIndex).latentPos(1), ...
                                visualiseInfo(depNodeIndex).latentPos(2));
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
        if visualiseInfo(nodeIndex).tree.updateChild(i)
          updateVisualisation(nodeChildren(i), muX, muY);
        end
      end
    else
      visualiseInfo(nodeIndex).visualiseModify(visualiseInfo(nodeIndex).visHandle, ...
                                               Y, visualiseNodes(nodeIndex).subskel, nodeIndex, visualiseNodes(nodeIndex).padding);
    end
    
  end
  
end
