function voxels = auroraDrawVoxelsForEdit(voxels, i, write, flipme)

for sliceId = 1:size(voxels,1)
    slice(:,:) = voxels(:, :, sliceId);
    if (flipme)
        slice = flipdim(slice, 1);
    end
    voxels(:, :, sliceId) = slice;
end

if (write)
    str = sprintf('slices//side//%04g_side.png', i);
    p = sum(voxels, 3); p = squeeze(p) > 0;
    imwrite(p, str);
    
    str = sprintf('slices//top//%04g_top.png', i);
    p = sum(voxels, 1); p = squeeze(p) > 0;
    imwrite(p, str);
    
    str = sprintf('slices//behind//%04g_behind.png', i);
    p = sum(voxels, 2); p = squeeze(p) > 0;
    imwrite(p, str);    
end
