function [isosfc, n] = dct3DCreateIsosfc(voxels)
%voxels = voxels > 0;
% voxels = smooth3(voxels, 'box', 7);
isosfc = isosurface(voxels, 0);
n = isonormals(voxels,isosfc.vertices);