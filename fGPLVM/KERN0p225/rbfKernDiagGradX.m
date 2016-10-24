function gX = rbfKernDiagGradX(kern, X)

% RBFKERNDIAGGRADX Gradient of RBF kernel's diagonal with respect to X.
%
%	Description:
%
%	GX = RBFKERNDIAGGRADX(KERN, X) computes the gradient of the diagonal
%	of the radial basis function kernel matrix with respect to the
%	elements of the design matrix given in X.
%	 Returns:
%	  GX - the gradients of the diagonal with respect to each element of
%	   X. The returned matrix has the same dimensions as X.
%	 Arguments:
%	  KERN - the kernel structure for which gradients are being
%	   computed.
%	  X - the input data in the form of a design matrix.
%	
%
%	See also
%	RBFKERNPARAMINIT, KERNDIAGGRADX, RBFKERNGRADX


%	Copyright (c) 2004, 2005, 2006 Neil D. Lawrence
% 	rbfKernDiagGradX.m CVS version 1.6
% 	rbfKernDiagGradX.m SVN version 1
% 	last update 2009-03-17T15:36:52.000000Z

gX = zeros(size(X));

