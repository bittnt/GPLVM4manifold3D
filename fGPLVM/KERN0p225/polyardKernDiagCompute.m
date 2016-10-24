function k = polyardKernDiagCompute(kern, x)

% POLYARDKERNDIAGCOMPUTE Compute diagonal of POLYARD kernel.
%
%	Description:
%
%	K = POLYARDKERNDIAGCOMPUTE(KERN, X) computes the diagonal of the
%	kernel matrix for the automatic relevance determination polynomial
%	kernel given a design matrix of inputs.
%	 Returns:
%	  K - a vector containing the diagonal of the kernel matrix computed
%	   at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  X - input data matrix in the form of a design matrix.
%	
%
%	See also
%	POLYARDKERNPARAMINIT, KERNDIAGCOMPUTE, KERNCREATE, POLYARDKERNCOMPUTE


%	Copyright (c) 2005, 2006 Neil D. Lawrence
% 	polyardKernDiagCompute.m CVS version 1.2
% 	polyardKernDiagCompute.m SVN version 1
% 	last update 2006-10-25T10:53:00.000000Z


scales = sparse(diag(sqrt(kern.inputScales)));
x = x*scales;
arg = sum(x.*x, 2)*kern.weightVariance + kern.biasVariance;
k = kern.variance*arg.^kern.degree;
