function a = my_idct3(a)
persistent ww siz ind isreala ww_gpu q_gpu;

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

% if precompute,
    siz=size(a);
    ndim=ndims(a);
    
    for i=1:ndim,
        n=siz(i); clear tmp;
        
        ww{i} = 2*exp((-1i*pi/(2*n))*(0:n-1)')/sqrt(2*n);
        ww{i}(1) = ww{i}(1)/sqrt(2);
        
        tmp(1:2:n)=(1:ceil(n/2));
        tmp(2:2:n)=(n:-1:ceil(n/2)+1);
        ind{i}=bsxfun(@plus, tmp', 0:n:n*(prod(siz)/n-1));
        
%         ww_gpu{i} = gpuArray(ww{i});
        ww_gpu{i} = ww{i};
        q_gpu{i} = repmat(ww_gpu{i}, 1, size(ind{i},2));
        
        if (siz(i)==1), break; end;
    end
    
% end

a = single(a);
a_gpu = gpuArray(a);
% a_gpu = a;

for i=1:ndim
    a_gpu = reshape(a_gpu, siz(1),[]);
    
    a_gpu = a_gpu .* q_gpu{i};
    a_gpu = fft(a_gpu);
    a_gpu = real(a_gpu);
    a_gpu = a_gpu(ind{i});
    
    a_gpu = reshape(a_gpu, siz);
    
    a_gpu = my3DTranspose(a_gpu, siz);
    
    siz=[siz(2:end) siz(1)];
end

a = gather(a_gpu);