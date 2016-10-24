function dct2DDecompressDCTsToFile(dcts, modelParams)
for i=1:size(dcts, 1)
    str = sprintf('images\\out\\starjump_dcts_%04g.png', i);
    I = dct2DDecompressDescriptor(dcts(i,:), modelParams{1}, modelParams{2}, ...
        modelParams{3});
    newI = uint8(zeros(modelParams{1}, modelParams{2}, 3));
    newI(:,:,1) = (I < 0) * 255;
    newI(:,:,2) = (I < 0) * 255;
    newI(:,:,3) = (I < 0) * 255;
    imwrite(newI, str);
    fprintf('Processed point %d ...\n', i);
end