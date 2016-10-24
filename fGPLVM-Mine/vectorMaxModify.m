function handle = vectorMaxModify(handle, vals, latentPos, params)
% [pks, locs] = findpeaks(vals, 'MinPeakHeight', (max(vals) - min(vals))/2+min(vals));
[~,ii] = max(vals);
efdHcount = params{1};
nopoints = params{2};
efds = params{3};
img = zeros(480, 640);
fa = reshape(squeeze(efds(ii,:)), 4, efdHcount);
ufa = rEfourier(fa, efdHcount, nopoints);
img = cpDrawCFull([ufa(:,1) ufa(:,2)], img);
set(handle, 'CData', img);