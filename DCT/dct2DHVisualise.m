function handle = dct2DHVisualise(vals, params)
imgSizeX = params{1};
imgSizeY = params{2};
noHarmonics = params{3};
higherModel = params{4};

vals = vals/10;

[mu ~] = fgplvmPosteriorMeanVar(higherModel,vals);

dt = dct2DDecompressDescriptor(mu, imgSizeX, imgSizeY, noHarmonics);

% handle = imshow(jet(dt));
handle = imshow(dt > 0);