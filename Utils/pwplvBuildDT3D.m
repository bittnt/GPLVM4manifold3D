function dt = pwplvBuildDT3D(volume, mask)
    dt = bwdist(volume);
    dt(mask ~= 1) = -dt(mask ~= 1);
end