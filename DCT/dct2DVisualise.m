function handle = dct2DVisualise(vals, params)
imgSizeX = params{1};
imgSizeY = params{2};
noHarmonics = params{3};
img = dct2DDecompressDescriptor(vals, imgSizeX, imgSizeY, noHarmonics);
% handle = imshow(jet(img));
handle = imshow(img > 0);