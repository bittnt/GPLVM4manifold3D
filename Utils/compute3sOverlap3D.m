volume = pwplv3DDecompressDescriptorFast(dct3ds_dt(70,:), modelParams3D, false, 1);
for i=0:359
    str = sprintf('images/in/3d/poses/pose_stop_%04d.txt', i);
    file = fopen(str);
    pose = fscanf(file, '%f', 8);
    fclose(file);
    
    [mu ~] = fgplvmPosteriorMeanVar(modelCarsDCT3D_2D,pose(7:8)');
    volume_3s = pwplv3DDecompressDescriptorFast(mu, modelParams3D, false, 1);
    
    volume_3s(volume_3s > 0) = 1;
    volume_3s(volume_3s < 0) = 0;
    
    volume(volume > 0) = 1;
    volume(volume < 0) = 0;
    
    diff = abs(volume - volume_3s); reun = volume + volume_3s;
    diff_count = size(find(diff > 0), 1);
    reun_count = size(find(reun > 0), 1);

    res_3d_no_vol(i+1) = (reun_count-diff_count) / reun_count;
    
    fprintf('Processed angles %d ...\n', i);
end