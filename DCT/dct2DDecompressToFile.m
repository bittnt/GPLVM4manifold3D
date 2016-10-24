function dct2DDecompressToFile(model, params)
for i=1:size(model.X, 1)
    str = sprintf('images\\out\\outgplvm_%04g.png', i);
    I = dct2DDecompressLatent(model, model.X(i,:), params);
    imwrite(I > 0, str);
    fprintf('Processed point %d ...\n', i);
end