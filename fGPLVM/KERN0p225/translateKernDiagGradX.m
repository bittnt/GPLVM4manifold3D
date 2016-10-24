function gX = translateKernDiagGradX(kern, X)

% TRANSLATEKERNDIAGGRADX Gradient of TRANSLATE kernel's diagonal with respect to X.
%
%	Description:
%
%	GX = TRANSLATEKERNDIAGGRADX(KERN, X) computes the gradient of the
%	diagonal of the input space translation kernel matrix with respect
%	to the elements of the design matrix given in X.
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
%	TRANSLATEKERNPARAMINIT, KERNDIAGGRADX, CMPNDKERNDIAGGRADX, TRANSLATEKERNGRADX


%	Copyright (c) 2007 Neil D. Lawrence
% 	translateKernDiagGradX.m CVS version 1.1
% 	translateKernDiagGradX.m SVN version 1
% 	last update 2007-05-22T23:17:31.000000Z


X = X - repmat(kern.centre, size(X, 1), 1);
gX = cmpndKernDiagGradX(kern, X);
