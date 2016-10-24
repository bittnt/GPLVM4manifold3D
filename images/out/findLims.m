function [start, stop, sizelims] = findLims(voxels, dimension)
switch (dimension)
    case 1
        start = 1; stop = size(voxels, 1);
        for i=1:size(voxels, dimension);
                        if (~isempty(voxels(voxels(i,:) ~= 255)))
%             if (sum(voxels(i,:)) > 0)
                start = i;
                break;
            end
        end
        for i=size(voxels, dimension):-1:1
                        if (~isempty(voxels(voxels(i,:) ~= 255)))
%             if (sum(voxels(i,:)) > 0)
                stop = i;
                break;
            end
        end
    case 2
        start = 1; stop = size(voxels, 2);
        for i=1:size(voxels, dimension);
                        if (~isempty(voxels(voxels(:,i) ~= 255)))
%             if (sum(voxels(:,i)) > 0)
                start = i;
                break;
            end
        end
        for i=size(voxels, dimension):-1:1
                        if (~isempty(voxels(voxels(:,i) ~= 255)))
%             if (sum(voxels(:,i)) > 0)
                stop = i;
                break;
            end
        end
end
sizelims = stop - start;