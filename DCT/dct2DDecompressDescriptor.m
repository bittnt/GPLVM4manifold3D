function img = dct2DDecompressDescriptor(descritor, imgSizeX, imgSizeY, noHarmonics)
dct_a = zeros(imgSizeX, imgSizeY);
dct_a(1:noHarmonics, 1:noHarmonics) = reshape(descritor, noHarmonics, noHarmonics);
img = mirt_idctn(dct_a);
% img = pwplvIDCT2(dct_a, img, noHarmonics);