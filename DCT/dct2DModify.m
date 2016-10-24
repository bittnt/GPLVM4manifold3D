function handle = dct2DModify(handle, vals, varSigma, latentPos, params)
imgSizeX = params{1};
imgSizeY = params{2};
noHarmonics = params{3};
% targetDT = params{4};

dt = dct2DDecompressDescriptor(vals, imgSizeX, imgSizeY, noHarmonics);
% ydiff = targetDT - dt;
% f = sum((ydiff(:).*ydiff(:)));
% [~,f]= pwpLogPosteriorsGradientDCT(params{5}, dt);
% f = sum(f(:));
% test = -0.5*(log(varSigma(1)) + f / varSigma(1) + log(2*pi));
% test = -0.5 * (log(-varSigma(1)) - f / varSigma(1) + log(2*pi));
% test = f;
% test = f * (-1/log(varSigma(1)));
% test = f - 0.5 * log(varSigma(1));

% fprintf('%g %g sig:%g f:%g test:%g\n', latentPos(1), latentPos(2), ...
%     log(varSigma(1)), f, test);
% set(handle, 'CData', jet(img));

% pose = fgplvmPosteriorMeanVar(params{4}, latentPos);
% fprintf('%g \n', round(pose / 10));
fprintf('%g %g\n', latentPos(1), latentPos(2));

set(handle, 'CData', dt > 0);

