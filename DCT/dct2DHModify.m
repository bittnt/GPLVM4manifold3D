function handle = dct2DHModify(handle, vals, varSigma, latentPos, params)
imgSizeX = params{1};
imgSizeY = params{2};
noHarmonics = params{3};
higherModel = params{4};

vals = vals/10;

[mu ~] = fgplvmPosteriorMeanVar(higherModel,vals);

dt = dct2DDecompressDescriptor(mu, imgSizeX, imgSizeY, noHarmonics);

% set(handle, 'CData', jet(img));
set(handle, 'CData', dt > 0);

