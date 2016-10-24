function ed = pwplvVoxedEdge(voxels)
volSize = size(voxels, 1);
ed = zeros(volSize, volSize, volSize);
for i=1:volSize
    ed(i,:,:) = squeeze(ed(i,:,:)) | edge(squeeze(voxels(i,:,:)));
end
for i=1:volSize
    ed(:,i,:) = squeeze(ed(:,i,:)) | edge(squeeze(voxels(:,i,:)));
end
for i=1:volSize
    ed(:,:,i) = squeeze(ed(:,:,i)) | edge(squeeze(voxels(:,:,i)));
end
for i=1:volSize
    ed(i,:,:) = squeeze(ed(i,:,:)) | edge(squeeze(voxels(i,:,:)));
end
for i=1:volSize
    ed(:,i,:) = squeeze(ed(:,i,:)) | edge(squeeze(voxels(:,i,:)));
end
for i=1:volSize
    ed(:,:,i) = squeeze(ed(:,:,i)) | edge(squeeze(voxels(:,:,i)));
end