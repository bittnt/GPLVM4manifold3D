function [voxels_o, limsX, limsY, limsZ] = auroraGetCenteredVoxels(voxels_s, bandSize)
depth_s = size(voxels_s, 1);
depth_o = depth_s+bandSize;
voxels_o = zeros(depth_o, depth_o, depth_o);

[srcStartX, srcStopX, sizeLimsX] = auroraFindLims(voxels_s, 1);
[srcStartY, srcStopY, sizeLimsY] = auroraFindLims(voxels_s, 2);
[srcStartZ, srcStopZ, sizeLimsZ] = auroraFindLims(voxels_s, 3);

dstStartX = ceil((depth_o - sizeLimsX) / 2);
dstStartY = ceil((depth_o - sizeLimsY) / 2);
dstStartZ = ceil((depth_o - sizeLimsZ) / 2);

dstStopX = dstStartX + sizeLimsX;
dstStopY = dstStartY + sizeLimsY;
dstStopZ = dstStartZ + sizeLimsZ;

voxels_o(dstStartX:dstStopX, dstStartY:dstStopY, dstStartZ:dstStopZ) = ...
    voxels_s(srcStartX:srcStopX, srcStartY:srcStopY, srcStartZ:srcStopZ);

limsX = [dstStartX dstStopX];
limsY = [dstStartY dstStopY];
limsZ = [dstStartZ dstStopZ];