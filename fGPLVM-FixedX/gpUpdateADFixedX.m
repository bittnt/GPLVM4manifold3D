function model = gpUpdateADFixedX(model, ~)

if ~isfield(model, 'S')
    if ~isfield(model, 'isSpherical') | model.isSpherical
        for i = 1:model.d
            model.innerProducts(1, i) = model.m(:, i)'*model.invK_uu...
                *model.m(:, i);
        end
    else
        for i = 1:model.d
            ind = gpDataIndices(model, i);
            model.innerProducts(1, i) = model.m(ind, i)'*model.invK_uu{i}...
                *model.m(ind, i);
        end
    end
end