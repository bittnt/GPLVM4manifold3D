imageNum = 36;

voxelsDepth = 112;
paddingSize = 16;

noHarmonics = 35;

dct3ds_dt = zeros(imageNum, noHarmonics * noHarmonics * noHarmonics);

for modelId = 1:imageNum
    str = sprintf('binvox_clean//%04g.binvox', modelId);
    
    tic;
    
    auroraObject_o = auroraReadBinvox(str);
    voxels_o = logical(auroraObject_o.voxels);
    voxels_s = auroraGetCenteredVoxels(voxels_o, paddingSize);
%     voxels_s = auroraDrawVoxelsForEdit(voxels_s, modelId, true, false);
    ed = pwplvVoxelEdges(voxels_s);
    dt = pwplvBuildDT3D(ed, voxels_s);
    dt = dt / 128;
    mydct = mirt_dctn(dt);
    mydct = mydct(1:noHarmonics, 1:noHarmonics, 1:noHarmonics);
    dct3ds_dt(modelId, :) = mydct(:);
    
    totalTime = toc;
    
    str = sprintf('voxels_s_%04g=voxels_s;', modelId);
    eval(str);
    
    str = sprintf('save(''mats//voxels_s_%04g.mat'',''voxels_s_%04g'');', ...
        modelId, modelId);
    eval(str);
    
    str = sprintf('clear voxels_s_%04g;', modelId);
    eval(str);
    
    fprintf('Finished model %d in %g secs for a total of %d models ... \n', ...
        modelId, totalTime, imageNum);
    
end