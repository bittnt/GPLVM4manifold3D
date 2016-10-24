function gX = gibbsperiodicKernDiagGradX(kern, X)

% GIBBSPERIODICKERNDIAGGRADX Gradient of GIBBSPERIODIC kernel's diagonal with respect to X.
%
%	Description:
%
%	GX = GIBBSPERIODICKERNDIAGGRADX(KERN, X) computes the gradient of
%	the diagonal of the Gibbs-kernel derived periodic kernel matrix with
%	respect to the elements of the design matrix given in X.
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
%	GIBBSPERIODICKERNPARAMINIT, KERNDIAGGRADX, GIBBSPERIODICKERNGRADX


%	Copyright (c) 2007 Neil D. Lawrence
% 	gibbsperiodicKernDiagGradX.m CVS version 1.1
% 	gibbsperiodicKernDiagGradX.m SVN version 1
% 	last update 2008-10-11T19:45:36.000000Z

gX = zeros(size(X));


