function model = gpComputeAlphaGPOnly(model, m)

if nargin < 2
    m = model.m;
end

model.alpha = zeros(model.N, model.d);
if ~isfield(model, 'isSpherical') | model.isSpherical
    model.alpha = model.invK_uu*m;
else
    for i = 1:model.d
        ind = gpDataIndices(model, i);
        model.alpha(ind, i) = model.invK_uu{i}* ...
            m(ind, i);
    end
end