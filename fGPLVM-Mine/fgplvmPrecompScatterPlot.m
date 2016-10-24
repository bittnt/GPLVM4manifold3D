function [ax, data] = fgplvmPrecompScatterPlot(model, varsigma)
YLbls = [];
dims = [1, 2];
symbol = getSymbols(1);
ax = [];
x1Min = min(model.X(:, dims(1)));
x1Max = max(model.X(:, dims(1)));
x1Span = x1Max - x1Min;
x1Min = x1Min - 0.05*x1Span;
x1Max = x1Max + 0.05*x1Span;
x1 = linspace(x1Min, x1Max, 150);

x2Min = min(model.X(:, dims(2)));
x2Max = max(model.X(:, dims(2)));
x2Span = x2Max - x2Min;
x2Min = x2Min - 0.05*x2Span;
x2Max = x2Max + 0.05*x2Span;
x2 = linspace(x2Min, x2Max, 150);

[X1, X2] = meshgrid(x1, x2);

posteriorVarDefined = true;

if posteriorVarDefined
    %     d = model.d;
    %     if size(varsigma, 2) == 1
    %         dataMaxProb = -0.5*d*log(varsigma);
    %     else
    %         dataMaxProb = -.5*sum(log(varsigma), 2);
    %         %         dataMaxProb = -sum(varsigma,2)/d;
    %     end
%     dataMaxProb = varsigma;
    
%     varsigma = -0.5*model.d*log(varsigma); %for simple variance 
    
    if isempty(ax)
        figure(1)
        clf
        % Create the plot for the data
        ax = axes('position', [0 0 1 1]);
    else
        axes(ax);
    end
    hold on
    
    C = reshape(varsigma, size(X1));
    
    % Rescale it
    C = C - min(min(C));
%     C = max(max(C)) - C;
    if max(max(C))~=0
      C = C/max(max(C));
      C = round(C*256); %424
      image(x1, x2, C);
    end
    
    data = varsigma;
    
%     varsigma = reshape(varsigma, size(X2));

%     varsigma = max(max(varsigma)) - varsigma;
%     if max(max(varsigma))~=0
%       varsigma = varsigma/max(max(varsigma));
%       varsigma = round(varsigma*63);
%       image(x1, x2, varsigma);
%     end
    
    colormap jet;
end

xLim = [min(x1) max(x1)];
yLim = [min(x2) max(x2)];
set(ax, 'xLim', xLim);
set(ax, 'yLim', yLim);
% if size(model.X, 2) == 3
%   zLim = [min(x3) max(x3)];
%   set(ax, 'zLim', zLim);
% end
set(ax, 'fontname', 'arial');
set(ax, 'fontsize', 20);