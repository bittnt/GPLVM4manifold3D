function writeModelsPerLatent(latentSpace, folderName, Xin)
Xin = latentSpace.X;
modelParams.noHarmonics = 35;
modelParams.volSize = 128;
for i = 1:size(Xin, 1)
    Xcurrent = Xin(i,:);
    mu = gpPosteriorMeanVar(latentSpace, Xcurrent);
    voxels = pwplv3DDecompressDescriptorFast(mu, modelParams, false, 1);
    
    siz = size(voxels);
    voxels = permute(voxels, [2 1 3]);
    voxels = voxels > 0;
    isosfc = isosurface(voxels, 0.5);
    isosfc.vertices  = (isosfc.vertices-siz(1)/2)/siz(1);
        
    fileName = sprintf('%s/%02d_%04d.stl', folderName, latentSpace.q, i);
    stlwrite(fileName,isosfc.faces,isosfc.vertices);
%     mesh2off(fileName, isosfc.faces, isosfc.vertices);
    
%     fileName = sprintf('%s/%02d_%04d.obj', folderName, latentSpace.q, i);
%     vertface2obj(isosfc.vertices, isosfc.faces, fileName);
    
%     fileName = sprintf('%s/%02d_%04d.txt', folderName, latentSpace.q, i);
%     f = fopen(fileName, 'w+'); 
%     fprintf(f, '%f', single(varsigma(1)));
%     fclose(f);
    
    fprintf('Done %02d %04d ...\n', latentSpace.q, i);
end