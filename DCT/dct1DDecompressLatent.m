function [I, mu] = dct1DDecompressLatent(model, x, params)
noPoints = params{1};
noHarmonics = params{2};
mu = fgplvmPosteriorMeanVar(model,x) / 100;
I = dct1DDecompressDescriptor(mu, noPoints, noHarmonics);
