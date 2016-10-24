function matout = myCopyFFTtoDCT(matin, siz)
k = parallel.gpu.CUDAKernel('copyFFTtoDCT.ptx', 'copyFFTtoDCT.cu');

k.ThreadBlockSize = siz(1);
k.GridSize = siz(2)/2;
k.SharedMemorySize = 0;

matout = feval(k, matin, matin);