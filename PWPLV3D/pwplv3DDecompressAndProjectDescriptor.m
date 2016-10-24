function [a projection dprojection] = pwplv3DDecompressAndProjectDescriptor(dct_compact, modelParams3D, testParams, dt, dt_proj)
noHarmonics = modelParams3D.noHarmonics;
volSize = modelParams3D.volSize;
dct_compact = reshape(squeeze(dct_compact), noHarmonics, noHarmonics, noHarmonics);
a = single(zeros(volSize, volSize, volSize));
a(1:noHarmonics, 1:noHarmonics, 1:noHarmonics) = ...
    dct_compact(1:noHarmonics, 1:noHarmonics, 1:noHarmonics);

persistent siz isreala q_gpu;

if (nargin == 0) || isempty(a) ,
    error('Insufficient input');
end

isreala=isreal(a);
ndim=ndims(a);

transpose=0;
if (ndim==2) && (size(a,1)==1)
    transpose=1; a=a';
end

precompute=0;
if  ~exist('siz','var'),
    precompute=1;
elseif abs(numel(siz)-ndims(a))>0
    precompute=1;
elseif sum(abs(siz-size(a)),2)>0,
    precompute=1;
elseif isreala~=isreal(a),
    precompute=1;
end

if precompute,
    siz=size(a);
    ndim=ndims(a);
    
    for i=1:ndim,
        n=siz(i); clear tmp;
        
        ww{i} = 2*exp((-1i*pi/(2*n))*(0:n-1)')/sqrt(2*n);
        ww{i}(1) = ww{i}(1)/sqrt(2);
        
        q = repmat(ww{i}, 1, size(0:n:n*(prod(siz)/n-1),2));
        q_gpu{i} = gpuArray(q);
        
        if (siz(i)==1), break; end;
    end
    
end

a_gpu = gpuArray(a);

for i=1:ndim
    a_gpu = reshape(a_gpu, siz(1),[]);
    
    a_gpu = a_gpu .* q_gpu{i};
    a_gpu = real(fft(a_gpu));
    
    a_gpu = reshape(a_gpu, 1, []);
    a_gpu = myCopyFFTtoDCT(a_gpu, [siz(1) siz(2)*siz(3)]);
   
    a_gpu = reshape(a_gpu, siz);
    
    a_gpu = my3DTranspose(a_gpu, siz);
    
    siz=[siz(2:end) siz(1)];
end

a_gpu = a_gpu * modelParams3D.volSize;

projection_gpu = arrayfun(@pwplv3dComputeLogOdds, a_gpu);
projection_gpu = 1-exp(sum(projection_gpu, testParams.targetDim));

if (nargout == 3)
    dt_gpu = gpuArray(dt);
    dt_proj_gpu = gpuArray(dt_proj);
    sum_a_gpu = sum(exp(dt_gpu)./(1+exp(dt_gpu)) .* a_gpu, testParams.targetDim);
    dprojection_gpu = (1 - dt_proj_gpu) .* sum_a_gpu;
    dprojection = real(gather(dprojection_gpu));
end

projection = gather(projection_gpu);
a = gather(a_gpu);