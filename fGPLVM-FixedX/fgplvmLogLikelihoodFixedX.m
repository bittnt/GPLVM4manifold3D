function ll = fgplvmLogLikelihoodFixedX(model)

ll = 0;
for i = 1:size(model.m, 2)
    if ~isfield(model, 'isSpherical') | model.isSpherical
        ll = ll -.5*model.logDetK_uu- .5*model.m(:, i)'*model.invK_uu*model.m(:, i);
    else
        if model.isMissingData
            m = model.m(model.indexPresent{i}, i);
        else
            m = model.m(:, i);
        end
        ll = ll - .5*model.logDetK_uu(i) - .5*m'*model.invK_uu{i}*m;
    end
end

ll = ll * 2;