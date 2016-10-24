function [ax, data] = lvmHierarchicalScatterPlot(model, YLbls);

% LVMHIERARCHICALSCATTERPLOT 2-D scatter plot of the latent points.
%
%	Description:
%
%	[AX, HANDLES] = LVMHIERARCHICALSCATTERPLOT(MODEL, LBLS) plots a
%	hierarchical scatter plot for a hierarchical latent variable model.
%	 Returns:
%	  AX - the axes where the plot is stored.
%	  HANDLES - the handles to the plotted ponts.
%	 Arguments:
%	  MODEL - the model for which the scatter plot is being shown.
%	  LBLS - the labels of the data for the plot (if any).
%	
%
%	See also
%	LVMSCATTERPLOT


%	Copyright (c) 2006 Andrew J. Moore
% 	lvmHierarchicalScatterPlot.m version 1.3


if isempty(YLbls)
  symbol = [];
else
  symbol = getSymbols(size(YLbls,2));
end

x1 = linspace(min(model.X(:, 1))*1.2, max(model.X(:, 1))*1.2, 40);
x2 = linspace(min(model.X(:, 2))*1.2, max(model.X(:, 2))*1.2, 40);
[X1, X2] = meshgrid(x1, x2);
XTest = [X1(:), X2(:)];

fhandle = str2func([model.type 'PosteriorMeanVar']);
if str2num(version('-release'))>13
  [mu, varsigma] = fhandle(model, XTest);
else 
  [mu, varsigma] = feval(fhandle, model, XTest);
end
figure(1)
%clf %andy edited out
% Create the plot for the data
%clf %andy edited out
ax = axes('position', [0.05 0.05 0.9 0.9]); %andy edit (next 2 lines)
%axes(subPlotHandle);
%ax = gca;
hold on

C = log10(reshape(1./varsigma(:, 1), size(X1)));
C = C - min(min(C));
C = C/max(max(C));
C = round(C*63);
image(x1, x2, C);

% [c, h] = contourf(X1, X2, log10(reshape(1./varsigma(:, 1), size(X1))), 128); 
% shading flat
colormap gray;
%colorbar
data = lvmTwoDPlot(model.X, YLbls, symbol);
xLim = [min(XTest(:, 1)) max(XTest(:, 1))];
yLim = [min(XTest(:, 2)) max(XTest(:, 2))];
set(ax, 'xLim', xLim);
set(ax, 'yLim', yLim);

set(ax, 'fontname', 'arial');
set(ax, 'fontsize', 20);

