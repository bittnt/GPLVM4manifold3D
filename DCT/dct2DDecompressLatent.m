function [I, mu] = dct2DDecompressLatent(model, x, params)
imgSizeX = params{1};
imgSizeY = params{2};
noHarmonics = params{3};
[mu ~] = fgplvmPosteriorMeanVar(model,x);
dct_a = zeros(imgSizeX, imgSizeY);
dct_a(1:noHarmonics, 1:noHarmonics) = reshape(mu, noHarmonics, noHarmonics);
I = (mirt_idctn(dct_a));
