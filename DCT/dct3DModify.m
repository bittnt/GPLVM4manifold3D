function handle = dct3DModify(handle, vals, varSigma, latentPos, params)
% imgSizeX = params{1};
% imgSizeY = params{2};
% noHarmonics = params{3};
% meanimg = params{4};
% dct_a = zeros(imgSizeX, imgSizeY);
% dct_a(1:noHarmonics, 1:noHarmonics) = reshape(vals, noHarmonics, noHarmonics);
% img_a = mirt_idctn(dct_a);
% set(handle, 'CData', jet(img_a));
% set(handle, 'CData', jet(img_a+meanimg));
fprintf('%g %g\n', latentPos(1), latentPos(2));