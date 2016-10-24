function g = fgplvmGradientFixedX(params, model)

model = fgplvmExpandParamFixedX(model, params);
g = - fgplvmLogLikeGradientsFixedX(model);
