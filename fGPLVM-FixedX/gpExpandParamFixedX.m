function model = gpExpandParamFixedX(model, params)
startVal = 1;
endVal = model.kern.nParams;
model.kern = kernExpandParam(model.kern, params(startVal:endVal));

model = gpUpdateKernelsFixedX(model, model.X, model.X_u);

% Update the vector 'alpha' for computing posterior mean.
if isfield(model, 'alpha')
  model = gpComputeAlphaFixedX(model);
end
