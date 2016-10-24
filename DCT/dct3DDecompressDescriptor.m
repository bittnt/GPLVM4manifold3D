function voxels = dct3DDecompressDescriptor(dct, modelParams3D)
noHarmonics = modelParams3D.noHarmonics;
volSize = modelParams3D.volSize;
dct = reshape(squeeze(dct), noHarmonics, noHarmonics, noHarmonics);
dctnew = zeros(volSize, volSize, volSize);
dctnew(1:noHarmonics, 1:noHarmonics, 1:noHarmonics) = ...
    dct(1:noHarmonics, 1:noHarmonics, 1:noHarmonics);
voxels = mirt_idctn(dctnew) * modelParams3D.volSize;
% voxels = mirt_idctn(dctnew) * modelParams3D.volSize;
