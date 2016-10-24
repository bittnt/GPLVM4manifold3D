function img = dct1DDecompressDescriptor(descritor, noPoints, noHarmonics)
dct_a = zeros(noPoints, 1);
dct_a(1:noHarmonics) = descritor;
img = mirt_idctn(dct_a);
% img = pwplvIDCT2(dct_a, img, noHarmonics);