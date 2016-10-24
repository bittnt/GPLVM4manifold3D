#ifndef MY_CUDA_BLOCK_DIM
#define MY_CUDA_BLOCK_DIM 16
#endif

__global__ void  transpose3D_revised_xyz2yzx( float *odata, float *idata, 
    unsigned int n1, unsigned int n2, unsigned int n3, 
    unsigned int Gx, unsigned int Gz, 
    float one_over_Gx, float one_over_Gz, unsigned int k2 )
{
    __shared__ float block[MY_CUDA_BLOCK_DIM][MY_CUDA_BLOCK_DIM+1];

    float tmp1 ;
    unsigned int s1, s2, t1, t2 ;
    unsigned int xIndex, yIndex, zIndex ;
    unsigned int index_in, index_out ;
	
    tmp1 = __uint2float_rz( blockIdx.x ) ;
    tmp1 = floorf( tmp1 * one_over_Gz ) ;
    s1 = __float2uint_rz( tmp1 ) ; 
    t1 = blockIdx.x - Gz*s1 ;
 	
    tmp1 = __uint2float_rz( blockIdx.y ) ;
    tmp1 = floorf( tmp1 * one_over_Gx ) ;
    s2 = __float2uint_rz( tmp1 ) ; 
    t2 = blockIdx.y - Gx*s2 ;
 
    yIndex = s2*k2 + s1 ;
 
    zIndex = t1 * MY_CUDA_BLOCK_DIM + threadIdx.x ;
    xIndex = t2 * MY_CUDA_BLOCK_DIM + threadIdx.y ;

    if ( (yIndex < n2) && (xIndex < n1) && (zIndex < n3)  ){
        index_in = (xIndex * n2 + yIndex) * n3 + zIndex ; 
        block[threadIdx.y][threadIdx.x] = idata[index_in];
    }
    __syncthreads();

    xIndex = t2 * MY_CUDA_BLOCK_DIM + threadIdx.x ;
    zIndex = t1 * MY_CUDA_BLOCK_DIM + threadIdx.y ;
 	
    if ( (yIndex < n2) && (xIndex < n1) && (zIndex < n3)  ){
        index_out = (yIndex * n3 + zIndex) * n1 + xIndex ; 
        odata[index_out] = block[threadIdx.x][threadIdx.y] ;
    } 	
 
}