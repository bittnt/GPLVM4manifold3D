function [g_dx_gpu, g_dy_gpu, g_dz_gpu] = gradient3d(f_gpu)
% f_gpu = gpuArray(f);

g_dx_gpu = (single(zeros(size(f_gpu))));
g_dx_gpu(1,:,:) = (f_gpu(2,:,:) - f_gpu(1,:,:));
g_dx_gpu(size(f_gpu,1),:,:) = (f_gpu(size(f_gpu,1),:,:) - f_gpu(size(f_gpu,1)-1,:,:));
g_dx_gpu(2:size(f_gpu,1)-1,:,:) = (f_gpu(3:size(f_gpu,1),:,:)-f_gpu(1:size(f_gpu,1)-2,:,:)) * 0.5;

g_dy_gpu = (single(zeros(size(f_gpu))));
g_dy_gpu(:,1,:) = (f_gpu(:,2,:) - f_gpu(:,1,:));
g_dy_gpu(:,size(f_gpu,2),:) = (f_gpu(:,size(f_gpu,2),:) - f_gpu(:,size(f_gpu,2)-1,:));
g_dy_gpu(:,2:size(f_gpu,2)-1,:) = (f_gpu(:,3:size(f_gpu,2),:)-f_gpu(:,1:size(f_gpu,2)-2,:)) * 0.5;

g_dz_gpu = (single(zeros(size(f_gpu))));
g_dz_gpu(:,:,1) = (f_gpu(:,:,2) - f_gpu(:,:,1));
g_dz_gpu(:,:,size(f_gpu,3)) = (f_gpu(:,:,size(f_gpu,3)) - f_gpu(:,:,size(f_gpu,3)-1));
g_dz_gpu(:,:,2:size(f_gpu,3)-1) = (f_gpu(:,:,3:size(f_gpu,3))-f_gpu(:,:,1:size(f_gpu,3)-2)) * 0.5;

% g_dx = gather(g_dx_gpu);
% g_dy = gather(g_dy_gpu);
% g_dz = gather(g_dz_gpu);