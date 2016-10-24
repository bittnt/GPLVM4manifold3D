function matout = my3DTranspose(matin, siz)
k = parallel.gpu.CUDAKernel('transpose3D_revised_xyz2yzx.ptx', 'transpose3D_revised_xyz2yzx.cu');

BLOCK_DIM = 16;

n1 = siz(1); n2 = siz(2); n3 = siz(3);

Gx = uint32((n1 + BLOCK_DIM-1) / BLOCK_DIM);
Gz = uint32((n3 + BLOCK_DIM-1) / BLOCK_DIM);

max_k1 = floor(sqrt(n2));
for k1=max_k1:-1:1
    k2 = ceil(n2/k1) ;
    if ((k1*k2 - n2) <= 1)
        break;
    end
end

k.ThreadBlockSize = [BLOCK_DIM, BLOCK_DIM, 1];
k.GridSize = double([k2*Gz, k1*Gx]);

eps = 1.e-6;
one_over_Gx = (1.0 + eps)/single(Gx) ;
one_over_Gz = (1.0 + eps)/single(Gz) ;

matout = feval(k, matin, matin, uint32(n1), uint32(n2), uint32(n3), ...
    uint32(Gx), uint32(Gz), single(one_over_Gx), single(one_over_Gz), ...
    uint32(k2));