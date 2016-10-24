function auroraDrawVoxels(voxels, start, stop, sliceAid, outid)
for sliceId=start:stop
    if (sliceAid == 1)
        slice(:,:) = voxels(sliceId, :, :);
    else
        if (sliceAid == 2)
            slice(:,:) = voxels(:, sliceId, :);
        else
            slice(:,:) = voxels(:, :, sliceId);
        end
    end
    
    out = zeros(size(slice, 1), size(slice, 2), 3);
    out(:,:,1) = (slice > 0) * 255;
    out(:,:,2) = (slice > 0) * 255;
    out(:,:,3) = (slice > 0) * 255;
    
    str = sprintf('slices//%04g//%02g_%04d.png', outid, sliceAid, sliceId);
    
    imwrite(out, str);
    
    fprintf('Drawing %d...\n', sliceId);
end
