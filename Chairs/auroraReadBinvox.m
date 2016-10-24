function auroraObject = auroraReadBinvox(fileName)
f = fopen(fileName);
done = false;
auroraObject = struct;

while (~done)
    line = fgetl(f);
    if (strcmp(line(1:4), 'data'))
        done = true;
    else
        if (strcmp(line(1:3), 'dim'))
            out = sscanf(line, 'dim %d %d %d');
            auroraObject.depth = out(1);
            auroraObject.height = out(2);
            auroraObject.width = out(3);
        else
            if (strcmp(line(1:2), 'tr'))
                out = sscanf(line, 'translate %f %f %f');
                auroraObject.translate = out;
            else
                if (strcmp(line(1:2), 'sc'))
                    out = sscanf(line, 'scale %f');
                    auroraObject.scale = out;
%                 else
%                     disp('File error');
%                     return
                end
            end
        end
    end
end

voxels = zeros(auroraObject.width * auroraObject.height * auroraObject.depth, 1);

endIndex = 1;
index = 1;
noVoxels = 0;
sizeVoxel = auroraObject.width * auroraObject.height * auroraObject.depth;

while (endIndex < sizeVoxel)
    value = fread(f, 1);
    count = fread(f, 1);
    
    endIndex = index + count;
    if (endIndex > sizeVoxel) 
        break;
    end

    voxels(index:endIndex) = value;
    
    if (value > 0)
        noVoxels = noVoxels + count;
    end
    
    index = endIndex;
end

auroraObject.voxels = reshape(voxels, ...
    [auroraObject.width, auroraObject.height, auroraObject.depth]);

fclose(f);