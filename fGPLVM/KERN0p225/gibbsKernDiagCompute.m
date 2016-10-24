function k = gibbsKernDiagCompute(kern, x)

% GIBBSKERNDIAGCOMPUTE Compute diagonal of GIBBS kernel.
%
%	Description:
%
%	K = GIBBSKERNDIAGCOMPUTE(KERN, X) computes the diagonal of the
%	kernel matrix for the Mark Gibbs's non-stationary kernel given a
%	design matrix of inputs.
%	 Returns:
%	  K - a vector containing the diagonal of the kernel matrix computed
%	   at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  X - input data matrix in the form of a design matrix.
%	
%
%	See also
%	GIBBSKERNPARAMINIT, KERNDIAGCOMPUTE, KERNCREATE, GIBBSKERNCOMPUTE


%	Copyright (c) 2006 Neil D. Lawrence
% 	gibbsKernDiagCompute.m CVS version 1.1
% 	gibbsKernDiagCompute.m SVN version 1
% 	last update 2008-10-11T19:45:36.000000Z

k = repmat(kern.variance, size(x, 1), 1);
