function k = whitefixedKernDiagCompute(kern, x)

% WHITEFIXEDKERNDIAGCOMPUTE Compute diagonal of WHITEFIXED kernel.
%
%	Description:
%
%	K = WHITEFIXEDKERNDIAGCOMPUTE(KERN, X) computes the diagonal of the
%	kernel matrix for the fixed parameter white noise kernel given a
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
%	WHITEFIXEDKERNPARAMINIT, KERNDIAGCOMPUTE, KERNCREATE, WHITEFIXEDKERNCOMPUTE


%	Copyright (c) 2006 Nathaniel J. King
% 	whitefixedKernDiagCompute.m CVS version 1.5
% 	whitefixedKernDiagCompute.m SVN version 1
% 	last update 2006-10-25T10:53:01.000000Z


k = whiteKernDiagCompute(kern, x);