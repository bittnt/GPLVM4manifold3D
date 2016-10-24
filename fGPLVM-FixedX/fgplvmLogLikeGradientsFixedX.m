function [g, gParam] = fgplvmLogLikeGradientsFixedX(model)

gParam = gpLogLikeGradientsFixedX(model);
g = gParam;