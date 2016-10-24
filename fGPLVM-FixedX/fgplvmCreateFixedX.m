function model = fgplvmCreateFixedX(Y, oldModel, options)
d = size(Y, 2);

model = gpCreateFixedX(oldModel.q, d, oldModel.X, Y, oldModel, options);

initParams = gpExtractParamFixedX(model);
model.numParams = length(initParams);
model = gpExpandParamFixedX(model, initParams);
