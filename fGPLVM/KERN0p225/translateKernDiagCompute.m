function k = translateKernDiagCompute(kern, x)

% TRANSLATEKERNDIAGCOMPUTE Compute diagonal of TRANSLATE kernel.
%
%	Description:
%
%	K = TRANSLATEKERNDIAGCOMPUTE(KERN, X) computes the diagonal of the
%	kernel matrix for the input space translation kernel given a design
%	matrix of inputs.
%	 Returns:
%	  K - a vector containing the diagonal of the kernel matrix computed
%	   at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  X - input data matrix in the form of a design matrix.
%	cmpndKernDiagCompute, translateKernCompute
%	
%
%	See also
%	TRANSLATEKERNPARAMINIT, KERNDIAGCOMPUTE, KERNCREATE, 


%	Copyright (c) 2007 Neil D. Lawrence
% 	translateKernDiagCompute.m CVS version 1.1
% 	translateKernDiagCompute.m SVN version 1
% 	last update 2008-10-11T19:45:37.000000Z

x = x - repmat(kern.centre, size(x, 1), 1);
k = cmpndKernDiagCompute(kern, x);