function gParam = gpLogLikeGradientsFixedX(model)

gK = model.invK_uu * model.m * model.m' * model.invK_uu - ...
    model.d * model.invK_uu;
gParam = kernGradient(model.kern, model.X, gK);