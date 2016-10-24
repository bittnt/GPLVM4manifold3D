function [voxels voxelsParams] = pwplv3DDecompressDescriptorFast(dct_compact, modelParams, computeDerivative, voxelReturnType)
% modelParams3D.volSize = modelParams{1};
% modelParams3D.noHarmonics = modelParams{2};
modelParams3D = modelParams;
noHarmonics = modelParams3D.noHarmonics;
volSize = modelParams3D.volSize;
dct_compact = reshape(squeeze(dct_compact), noHarmonics, noHarmonics, noHarmonics);
voxels = single(zeros(volSize, volSize, volSize));
voxels(1:noHarmonics, 1:noHarmonics, 1:noHarmonics) = ...
    dct_compact(1:noHarmonics, 1:noHarmonics, 1:noHarmonics);

persistent siz isreala q_gpu;

if (nargin == 0) || isempty(voxels) ,
    error('Insufficient input');
end

isreala=isreal(voxels);
ndim=ndims(voxels);

precompute=0;
if  ~exist('siz','var'),
    precompute=1;
elseif abs(numel(siz)-ndims(voxels))>0
    precompute=1;
elseif sum(abs(siz-size(voxels)),2)>0,
    precompute=1;
elseif isreala~=isreal(voxels),
    precompute=1;
end

if precompute,
    siz=size(voxels);
    ndim=ndims(voxels);
    
    i = 1;
    %     for i=1:ndim,
    n=siz(i); clear tmp;
    
    ww{i} = 2*exp((-1i*pi/(2*n))*(0:n-1)')/sqrt(2*n);
    ww{i}(1) = ww{i}(1)/sqrt(2);
    
    q = single(repmat(ww{i}, 1, size(0:n:n*(prod(siz)/n-1),2)));
    %         q_gpu{i} = gpuArray(q);
    q_gpu = gpuArray(q);
    
    %         if (siz(i)==1), break; end;
    %     end
    
end

voxels_gpu = gpuArray(voxels);

for i=1:ndim
    voxels_gpu = reshape(voxels_gpu, siz(1),[]);
    
    voxels_gpu = voxels_gpu .* q_gpu;
    voxels_gpu = fft(voxels_gpu);
    voxels_gpu = real(voxels_gpu);
    
    voxels_gpu = reshape(voxels_gpu, 1, []);
    voxels_gpu = myCopyFFTtoDCT(voxels_gpu, [siz(1) siz(2)*siz(3)]);
    
    voxels_gpu = reshape(voxels_gpu, siz);
    
    voxels_gpu = my3DTranspose(voxels_gpu, siz);
    
    siz=[siz(2:end) siz(1)];
end

voxels_gpu = voxels_gpu * modelParams3D.volSize;

% voxels_gpu = voxels_gpu + 1.5;

switch(voxelReturnType)
    case 1
        voxels = gather(voxels_gpu);
    case 2
%         pts_idx_compact_gpu = single(find(voxels_gpu > -20));
%         voxels = gather(voxels_gpu(pts_idx_compact_gpu));
        voxels = voxels_gpu;
    case 3
        voxels = 0;
end

if (nargout >= 2)
    pts_idx_compact_gpu = single(find(voxels_gpu > -20));
    voxelsParams.pts_idx_compact = gather(pts_idx_compact_gpu);
    voxelsParams.pts_idx_compact_gpu = pts_idx_compact_gpu;
    
    [pts_idx_norm_x_gpu pts_idx_norm_y_gpu pts_idx_norm_z_gpu] = ind2sub(siz, pts_idx_compact_gpu);
    
    pts_vals_gpu = exp((voxels_gpu(pts_idx_compact_gpu)-5) * 0.75);
%     pts_vals_gpu = exp((voxels_gpu(pts_idx_compact_gpu)-2) * 0.85);
%     pts_vals_gpu = exp((voxels_gpu(pts_idx_compact_gpu)));
    pts_vals_gpu = pts_vals_gpu ./ (1+pts_vals_gpu);
    
    voxelsParams.pts_vals = gather(pts_vals_gpu);
    voxelsParams.pts_vals_gpu = pts_vals_gpu;
    
    voxelsParams.pts_idx_norm = single(ones(size(voxelsParams.pts_idx_compact,1), 4));
    
    voxelsParams.pts_idx_norm(:,1:3) = ...
        (gather([pts_idx_norm_x_gpu pts_idx_norm_y_gpu pts_idx_norm_z_gpu])-siz(1)/2)/siz(1);
    
    if (computeDerivative)
        voxelsParams.d_voxels_compact = single(ones(size(voxelsParams.pts_idx_compact,1), 4));
        
        g_gpu = voxels_gpu;%gpuArray(single(zeros(size(voxels_gpu))));
        
        g_gpu(1,:,:) = (voxels_gpu(2,:,:) - voxels_gpu(1,:,:));
        g_gpu(size(voxels_gpu,1),:,:) = (voxels_gpu(size(voxels_gpu,1),:,:) - voxels_gpu(size(voxels_gpu,1)-1,:,:));
        g_gpu(2:size(voxels_gpu,1)-1,:,:) = (voxels_gpu(3:size(voxels_gpu,1),:,:)-voxels_gpu(1:size(voxels_gpu,1)-2,:,:)) * 0.5;
        voxelsParams.d_voxels_compact(:,1) = gather(g_gpu(pts_idx_compact_gpu));
        
        g_gpu(:,1,:) = (voxels_gpu(:,2,:) - voxels_gpu(:,1,:));
        g_gpu(:,size(voxels_gpu,2),:) = (voxels_gpu(:,size(voxels_gpu,2),:) - voxels_gpu(:,size(voxels_gpu,2)-1,:));
        g_gpu(:,2:size(voxels_gpu,2)-1,:) = (voxels_gpu(:,3:size(voxels_gpu,2),:)-voxels_gpu(:,1:size(voxels_gpu,2)-2,:)) * 0.5;
        voxelsParams.d_voxels_compact(:,2) = gather(g_gpu(pts_idx_compact_gpu));
        
        g_gpu(:,:,1) = (voxels_gpu(:,:,2) - voxels_gpu(:,:,1));
        g_gpu(:,:,size(voxels_gpu,3)) = (voxels_gpu(:,:,size(voxels_gpu,3)) - voxels_gpu(:,:,size(voxels_gpu,3)-1));
        g_gpu(:,:,2:size(voxels_gpu,3)-1) = (voxels_gpu(:,:,3:size(voxels_gpu,3))-voxels_gpu(:,:,1:size(voxels_gpu,3)-2)) * 0.5;
        voxelsParams.d_voxels_compact(:,3) = gather(g_gpu(pts_idx_compact_gpu));
    end
end