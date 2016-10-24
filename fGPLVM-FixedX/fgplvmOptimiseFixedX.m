function model = fgplvmOptimiseFixedX(model, display, iters)

if nargin < 3
    iters = 1000;
    if nargin < 2
        display = 1;
    end
end

params = fgplvmExtractParamFixedX(model);

options = optOptions;
if display
    options(1) = 1;
    if length(params) <= 100
        options(9) = 0;
    end
end
options(14) = iters;

if isfield(model, 'optimiser')
    optim = str2func(model.optimiser);
else
    optim = str2func('scg');
end

params = optim('fgplvmObjectiveFixedX', params,  options, ...
    'fgplvmGradientFixedX', model);

model = fgplvmExpandParamFixedX(model, params);
