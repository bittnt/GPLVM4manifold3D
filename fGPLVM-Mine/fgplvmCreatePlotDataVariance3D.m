function [varsigma pts_3d] = fgplvmCreatePlotDataVariance3D(model, pts)
defaultVals = zeros(1, model.q);
dims = [1, 2, 3];

x1Min = min(model.X(:, dims(1)));
x1Max = max(model.X(:, dims(1)));
x1Span = x1Max - x1Min;
x1Min = x1Min - 0.5*x1Span;
x1Max = x1Max + 0.5*x1Span;
x1 = linspace(x1Min, x1Max, 150);

x2Min = min(model.X(:, dims(2)));
x2Max = max(model.X(:, dims(2)));
x2Span = x2Max - x2Min;
x2Min = x2Min - 0.5*x2Span;
x2Max = x2Max + 0.5*x2Span;
x2 = linspace(x2Min, x2Max, 150);

x3Min = min(model.X(:, dims(3)));
x3Max = max(model.X(:, dims(3)));
x3Span = x3Max - x3Min;
x3Min = x3Min - 0.5*x3Span;
x3Max = x3Max + 0.5*x3Span;
x3 = linspace(x3Min, x3Max, 150);

[X1, X2, X3] = meshgrid(x1, x2, x3);
XTest = repmat(defaultVals, numel(X1), 1);
XTest(:, dims(1)) = X1(:);
XTest(:, dims(2)) = X2(:);
XTest(:, dims(3)) = X3(:);

if (nargin == 2)
    varsigma = 0;
else
    varsigma = modelPosteriorVar(model, XTest);
    varsigma = varsigma(:,1);
end

if (nargin == 2)
    pts_3d = zeros(size(pts, 1), 3);
    for i=1:size(pts, 1)
        pts_3d(i, 1) = 150 / (x1Max - x1Min) * (pts(i, 1) - x1Min);
        pts_3d(i, 2) = 150 / (x2Max - x2Min) * (pts(i, 2) - x2Min);
        pts_3d(i, 3) = 150 / (x3Max - x3Min) * (pts(i, 3) - x3Min);
    end
end