function f = fgplvmObjectiveFixedX(params, model)

model = fgplvmExpandParamFixedX(model, params);
f = - fgplvmLogLikelihoodFixedX(model);
