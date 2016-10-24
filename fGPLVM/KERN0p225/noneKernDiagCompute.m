function k = noneKernDiagCompute(kern, x)

% NONEKERNDIAGCOMPUTE Compute diagonal of NONE kernel.
%
%	Description:
%
%	K = NONEKERNDIAGCOMPUTE(KERN, X) computes the diagonal of the kernel
%	matrix for the dummy kernel function kernel given a design matrix of
%	inputs.
%	 Returns:
%	  K - a vector containing the diagonal of the kernel matrix computed
%	   at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  X - input data matrix in the form of a design matrix.
%	
%	
%
%	See also
%	NONEKERNPARAMINIT, KERNDIAGCOMPUTE, KERNCREATE, NONEKERNCOMPUTE


%	Copyright (c) 2008 Neil D. Lawrence


%	With modifications by Mauricio A. Alvarez 2009
% 	noneKernDiagCompute.m SVN version 426
% 	last update 2009-07-17T10:58:30.000000Z

  
k = zeros(size(x,1),1);