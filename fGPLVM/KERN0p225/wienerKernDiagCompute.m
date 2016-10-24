function k = wienerKernDiagCompute(kern, x)

% WIENERKERNDIAGCOMPUTE Compute diagonal of WIENER kernel.
%
%	Description:
%
%	K = WIENERKERNDIAGCOMPUTE(KERN, X) computes the diagonal of the
%	kernel matrix for the wiener kernel given a design matrix of inputs.
%	 Returns:
%	  K - a vector containing the diagonal of the kernel matrix computed
%	   at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  X - input data matrix in the form of a design matrix.
%	
%
%	See also
%	WIENERKERNPARAMINIT, KERNDIAGCOMPUTE, KERNCREATE, WIENERKERNCOMPUTE


%	Copyright (c) 2009 Neil D. Lawrence
% 	wienerKernDiagCompute.m SVN version 265
% 	last update 2009-03-08T08:54:28.000000Z

k = kern.variance*x;