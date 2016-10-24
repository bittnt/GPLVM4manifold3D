__global__ void copyFFTtoDCT(float *out, float *in)
{
	unsigned int lineId, lineSize, valSrcId, valDstId;
	
	lineId = 2 * blockIdx.x;
	valSrcId = threadIdx.x;
	lineSize = blockDim.x;
	
	if (valSrcId % 2 == 0)
	{ valDstId = valSrcId - floor(valSrcId/2.0f); }
	else
	{ valDstId = lineSize - floor(valSrcId/2.0f) - 1; }
	
	//out[lineId * lineSize + valSrcId] = lineId * lineSize + valDstId;
	out[lineId * lineSize + valSrcId] = in[lineId * lineSize + valDstId];
	
	if (valSrcId % 2 == 0)
	{ valDstId = lineSize + valSrcId - floor(valSrcId/2.0f); }
	else
	{ valDstId = lineSize + lineSize - floor(valSrcId/2.0f) - 1; }
	
	//out[lineId * lineSize + valSrcId + lineSize] = lineId * lineSize + valDstId;
	out[lineId * lineSize + valSrcId + lineSize] = in[lineId * lineSize + valDstId];
}