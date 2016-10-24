function model = gpUpdateKernelsFixedX(model, X, ~)

model.K_uu = kernCompute(model.kern, X);

if ~isfield(model, 'isSpherical') | model.isSpherical
    [model.invK_uu, U] = pdinv(model.K_uu);
    model.logDetK_uu = logdet(model.K_uu, U);
end

model = gpUpdateADFixedX(model, X);  
