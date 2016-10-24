function gX = gaussianKernDiagGradX(kern, X)

% GAUSSIANKERNDIAGGRADX Gradient of gaussian kernel's diagonal with respect to X.
%
%	Description:
%
%	GX = GAUSSIANKERNDIAGGRADX(KERN, X) computes the gradient of the
%	diagonal of the gaussian kernel matrix with respect to the elements
%	of the design matrix given in X.
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
%	GAUSSIANKERNPARAMINIT, KERNDIAGGRADX, GAUSSIANKERNGRADX


%	Copyright (c) 2008 Mauricio A. Alvarez and Neil D. Lawrence
% 	gaussianKernDiagGradX.m SVN version 1
% 	last update 2008-06-01T09:21:05.000000Z
  
gX = zeros(size(X));

