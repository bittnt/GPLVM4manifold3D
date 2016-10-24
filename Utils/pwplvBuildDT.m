function [dt dtLocs] = pwplvBuildDT(image, mask)

if (nargin == 1)
    [dt dtLocs] = bwdist_old(image);
    mask = logical(imfill(image, 'holes'));
%     dt(mask == 1) = -dt(mask == 1);
    dt(mask ~= 1) = -dt(mask ~= 1);
else
    [dt dtLocs] = bwdist_old(image);
%     dt(mask == 1) = -dt(mask == 1);
    dt(mask ~= 1) = -dt(mask ~= 1);
end

% dt = dt * -1;