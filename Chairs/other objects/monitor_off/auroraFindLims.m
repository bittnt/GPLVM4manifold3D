function [start, stop, sizelims] = auroraFindLims(voxels, dimension)
start = 0; stop = 0;
switch (dimension)
    case 1
        for i=1:size(voxels, dimension);
            if (~isempty(voxels(voxels(i,:,:) ~= 0)))
                start = i;
                break;
            end
        end
        for i=size(voxels, dimension):-1:1
            if (~isempty(voxels(voxels(i,:,:) ~= 0)))
                stop = i;
                break;
            end
        end
    case 2
        for i=1:size(voxels, dimension);
            if (~isempty(voxels(voxels(:,i,:) ~= 0)))
                start = i;
                break;
            end
        end
        for i=size(voxels, dimension):-1:1
            if (~isempty(voxels(voxels(:,i,:) ~= 0)))
                stop = i;
                break;
            end
        end
    case 3
        for i=1:size(voxels, dimension);
            if (~isempty(voxels(voxels(:,:,i) ~= 0)))
                start = i;
                break;
            end
        end
        for i=size(voxels, dimension):-1:1
            if (~isempty(voxels(voxels(:,:,i) ~= 0)))
                stop = i;
                break;
            end
        end
end
sizelims = stop - start;