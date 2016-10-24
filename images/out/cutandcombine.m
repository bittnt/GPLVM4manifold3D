pts_a_count = 6;
pts_b_count = 5;
pts_c_count = 2;

minX = 1024; minY = 1024; maxX = 0; maxY = 0;

for i=1:pts_a_count
    fileName = sprintf('pts_a/learned_%04d.png', i);
    I = imread(fileName);
    [minX_local maxX_local] = findLims(rgb2gray(I), 1);
    [minY_local maxY_local] = findLims(rgb2gray(I), 2);
    
    minX = min(minX_local, minX); maxX = max(maxX_local, maxX);
    minY = min(minY_local, minY); maxY = max(maxY_local, maxY);
end

for i=1:pts_b_count
    fileName = sprintf('pts_b/learned_%04d.png', i);
    I = imread(fileName);
    [minX_local maxX_local] = findLims(rgb2gray(I), 1);
    [minY_local maxY_local] = findLims(rgb2gray(I), 2);
    
    minX = min(minX_local, minX); maxX = max(maxX_local, maxX);
    minY = min(minY_local, minY); maxY = max(maxY_local, maxY);
end

for i=1:pts_c_count
    fileName = sprintf('pts_c/learned_%04d.png', i);
    I = imread(fileName);
    [minX_local maxX_local] = findLims(rgb2gray(I), 1);
    [minY_local maxY_local] = findLims(rgb2gray(I), 2);
    
    minX = min(minX_local, minX); maxX = max(maxX_local, maxX);
    minY = min(minY_local, minY); maxY = max(maxY_local, maxY);
end

for i=1:pts_a_count
    fileName = sprintf('pts_a/trained_%04d.png', i);
    I = imread(fileName);
    [minX_local maxX_local] = findLims(rgb2gray(I), 1);
    [minY_local maxY_local] = findLims(rgb2gray(I), 2);
    
    minX = min(minX_local, minX); maxX = max(maxX_local, maxX);
    minY = min(minY_local, minY); maxY = max(maxY_local, maxY);
end

% minX = minX - 7; maxX = maxX + 7;
% minY = minY - 7; maxY = maxY + 7;

I_a_learned = cell(pts_a_count, 1);
I_b_learned = cell(pts_b_count, 1);
I_c_learned = cell(pts_c_count, 1);
I_a_trained = cell(pts_a_count, 1);

for i=1:pts_a_count
    fileName = sprintf('pts_a/learned_%04d.png', i);
    I = imread(fileName);
    I_a_learned{i} = I(minX:maxX, minY:maxY, :); 
end

for i=1:pts_b_count
    fileName = sprintf('pts_b/learned_%04d.png', i);
    I = imread(fileName);
    I_b_learned{i} = I(minX:maxX, minY:maxY, :); 
end

for i=1:pts_c_count
    fileName = sprintf('pts_c/learned_%04d.png', i);
    I = imread(fileName);
    I_c_learned{i} = I(minX:maxX, minY:maxY, :); 
end

for i=1:pts_a_count
    fileName = sprintf('pts_a/trained_%04d.png', i);
    I = imread(fileName);
    I_a_trained{i} = I(minX:maxX, minY:maxY, :); 
end

I_a_1 = [];
for i=1:pts_a_count
    fileNameNumber = sprintf('numbers/%04d.png', i);
    Inumber = imread(fileNameNumber);
    Inumber = ~logical(rgb2gray(Inumber));
    
    newSize = [round(((maxX - minX) - size(Inumber, 1)) / 2), 0];
    Inumber = padarray(Inumber, newSize);
    Inumber = ~Inumber;
    
    clear Inumber_3;
    
    Inumber_3(:,:,1) = Inumber * 255;
    Inumber_3(:,:,2) = Inumber * 255;
    Inumber_3(:,:,3) = Inumber * 255;
    
    I_a_small = [I_a_trained{i} I_a_learned{i} Inumber_3];
    I_a_small = padarray(I_a_small, [3 3 0]);
    I_a_small = padarray(I_a_small, [3 3 0], 255);
    
    I_a_1 = [I_a_1 I_a_small];
end

% I_a_2 = [];
% for i=6:pts_a_count
%     fileNameNumber = sprintf('../numbers/%04d.png', i);
%     Inumber = imread(fileNameNumber);
%     Inumber = ~logical(rgb2gray(Inumber));
%     
%     newSize = [round(((maxX - minX) - size(Inumber, 1)) / 2), 0];
%     
%     Inumber = padarray(Inumber, newSize);
%     Inumber = ~Inumber;
%     
%     clear Inumber_3;
%     
%     Inumber_3(:,:,1) = Inumber * 255;
%     Inumber_3(:,:,2) = Inumber * 255;
%     Inumber_3(:,:,3) = Inumber * 255;
%     
%     I_a_small = [I_a_trained{i} Inumber_3 I_a_learned{i}];
%     I_a_small = padarray(I_a_small, [3 3 0]);
%     I_a_small = padarray(I_a_small, [3 3 0], 255);
%     
%     I_a_2 = [I_a_2 I_a_small];
% end

I_b = [];
for i=1:pts_b_count
    fileNameNumber = sprintf('numbers/%04d.png', i + pts_a_count);
    Inumber = imread(fileNameNumber);
    Inumber = ~logical(rgb2gray(Inumber));
    
    newSize = [round(((maxX - minX) - size(Inumber, 1)) / 2), 0];
    Inumber = padarray(Inumber, newSize);
    Inumber = ~Inumber;
    
    clear Inumber_3;
    
    Inumber_3(:,:,1) = Inumber * 255;
    Inumber_3(:,:,2) = Inumber * 255;
    Inumber_3(:,:,3) = Inumber * 255;
    
    I_b_small = [I_b_learned{i} Inumber_3];
%     I_b_small = padarray(I_b_small, [0 11 0], 255, 'pre');
    I_b_small = padarray(I_b_small, [0 5 0], 255, 'post');
    I_b_small = padarray(I_b_small, [3 3 0]);
    I_b_small = padarray(I_b_small, [3 3 0], 255);
    
    I_b = [I_b I_b_small];
end

I_c = [];
for i=1:pts_c_count
    fileNameNumber = sprintf('numbers/%04d.png', i + pts_a_count + pts_b_count);
    Inumber = imread(fileNameNumber);
    Inumber = ~logical(rgb2gray(Inumber));
    
    newSize = [round(((maxX - minX) - size(Inumber, 1)) / 2), 0];
    Inumber = padarray(Inumber, newSize);
    Inumber = ~Inumber;
    
    clear Inumber_3;
    
    Inumber_3(:,:,1) = Inumber * 255;
    Inumber_3(:,:,2) = Inumber * 255;
    Inumber_3(:,:,3) = Inumber * 255;
    
    I_c_small = [I_c_learned{i} Inumber_3];
%     I_c_small = padarray(I_c_small, [0 11 0], 255, 'pre');
    I_c_small = padarray(I_c_small, [0 5 0], 255, 'post');
    I_c_small = padarray(I_c_small, [3 3 0]);
    I_c_small = padarray(I_c_small, [3 3 0], 255);
    
    I_c = [I_c I_c_small];
end

% I_a_2 = padarray(I_a_2, [0, size(I_a_1, 2) - size(I_a_2, 2), 0], 255, 'post');
I_b = padarray(I_b, [0, size(I_a_1, 2) - size(I_b, 2), 0], 255, 'post');
I_c = padarray(I_c, [0, size(I_a_1, 2) - size(I_c, 2), 0], 255, 'post');

text_I_a = imread('text/one.png');
text_I_b = imread('text/two.png');
text_I_c = imread('text/three.png');

text_I_a = padarray(text_I_a, [0, size(I_a_1, 2) - size(text_I_a, 2), 0], 255, 'post');
text_I_b = padarray(text_I_b, [0, size(I_a_1, 2) - size(text_I_b, 2), 0], 255, 'post');
text_I_c = padarray(text_I_c, [0, size(I_a_1, 2) - size(text_I_c, 2), 0], 255, 'post');

text_I_a = padarray(text_I_a, [1, 0, 0], 255, 'pre');
text_I_b = padarray(text_I_b, [23, 0, 0], 255, 'pre');
text_I_c = padarray(text_I_c, [23, 0, 0], 255, 'pre');

text_I_a = padarray(text_I_a, [1, 0, 0], 255, 'post');
text_I_b = padarray(text_I_b, [1, 0, 0], 255, 'post');
text_I_c = padarray(text_I_c, [1, 0, 0], 255, 'post');

I_all = [text_I_a; I_a_1; text_I_b; I_b; text_I_c; I_c];

imwrite(I_all, 'combined_all.png');

% imwrite(I_a, 'combined_a.png');
% imwrite(I_b, 'combined_b.png');
% imwrite(I_c, 'combined_c.png');