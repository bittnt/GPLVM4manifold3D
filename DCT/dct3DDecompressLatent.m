function [voxels, isosfc] = dct3DDecompressLatent(model, x, params)
[mu ~] = fgplvmPosteriorMeanVar(model,x);
voxels = dct3DDecompressDescriptor(mu, params);
% isosfc = isosurface(voxels);