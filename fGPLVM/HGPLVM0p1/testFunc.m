function testFunc(action)

% TESTFUNC Handler for mouse events on the latetn space axes.
%
%	Description:
%
%	TESTFUNC(ACTION) handles mouse events on the latent space axes.
%	 Arguments:
%	  ACTION - 'click' or 'move'.


%	Copyright (c) 2006 Andrew Moore
% 	testFunc.m version 1.2


% Handler for mouse events on the latent space axes.  The UserData parameter
%of the CurrentAxes that has received the mouse event refers to a
%VisualiseInfo structure containing the related skeleton data.


global visualiseInfo
%check this has been called from a valid axes (one where there is a defined
%UserData).
axesIndex = get(gca, 'UserData');
if ~isempty(axesIndex)
    switch action
        case 'click'
            point  = get(gca, 'CurrentPoint');
            x = point(1, 1);
            y = point(1, 2);
            xlim = get(gca, 'XLim');
            ylim = get(gca, 'YLim');
            if (x > xlim(1) && x < xlim(2) && y > ylim(1) && y < ylim(2))
                visualiseInfo(axesIndex).latentPos = [x, y];
                visualiseInfo(axesIndex).clicked = ~visualiseInfo(axesIndex).clicked;
                if isfield(visualiseInfo(axesIndex).model, 'dynamics') & ~isempty(visualiseInfo(axesIndex).model.dynamics)
                    if visualiseInfo(axesIndex).runDynamics
                        visualiseInfo(axesIndex).dynamicsRunning = 1;
                        fhandle = str2func([visualiseInfo(axesIndex).model.type 'DynamicsRun']);
                        feval(fhandle);
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
            if (x > xlim(1) && x < xlim(2) && y > ylim(1) && y < ylim(2) &&...
                    visualiseInfo(axesIndex).clicked && ~visualiseInfo(axesIndex).runDynamics)
                set(visualiseInfo(axesIndex).latentHandle, 'xdata', x, 'ydata', y);
                fhandle = str2func([visualiseInfo(axesIndex).model.type 'PosteriorMeanVar']);
                [mu, varsigma] = getDataPoints(x, y, visualiseInfo(axesIndex));
                Y = mu;
                %Andy hack, when moving in the 3rd latent space (both legs), adjust
                %the poision in the child latent spaces (right leg, left leg)
                
                %should really adjust the positions for all child spaces.
                %Question of how deep to descend the heirarchy. 1 level?
                %all levels?
                if (axesIndex == 3)
                    set(visualiseInfo(1).latentHandle, 'xdata', mu(1), 'ydata', mu(2));
                    set(visualiseInfo(2).latentHandle, 'xdata', mu(3), 'ydata', mu(4));
                    visualiseInfo(1).latentPos=[mu(1), mu(2)];
                    visualiseInfo(2).latentPos=[mu(3), mu(4)];
                    [Y1, var1] = getDataPoints(mu(1), mu(2), visualiseInfo(1));
                    [Y2, var2] = getDataPoints(mu(3), mu(4), visualiseInfo(2));
                    visualiseInfo(1).visualiseModify(visualiseInfo(1).visHandle, ...
                                              Y1, visualiseInfo(1).varargin{:});                     
                    visualiseInfo(2).visualiseModify(visualiseInfo(2).visHandle, ...
                                              Y2, visualiseInfo(2).varargin{:});
                else
                    visualiseInfo(axesIndex).visualiseModify(visualiseInfo(axesIndex).visHandle, ...
                                              Y, visualiseInfo(axesIndex).varargin{:});
                    visualiseInfo(axesIndex).latentPos=[x, y];
                end
            end
    end
else
    error('No UserData property defined for this axis. The UserData property should contain an index to the visualiseInfo for this structure.');
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