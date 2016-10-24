function k = kernDiagGradX(kern, x)

% KERNDIAGGRADX Compute the gradient of the  kernel wrt X.
%
%	Description:
%
%	GX = KERNDIAGGRADX(KERN, X) computes the gradient of the diagonal of
%	the kernel matrix with respect to the elements of the design matrix
%	given in X.
%	 Returns:
%	  GX - the gradients of the diagonal with respect to each element of
%	   X. The returned matrix has the same dimensions as X.
%	 Arguments:
%	  KERN - the kernel structure for which gradients are being
%	   computed.
%	  X - the input data in the form of a design matrix.
%
%	See also
%	KERNDIAGGRADX, KERNGRADX
% 	kernDiagGradX.m CVS version 1.6
% 	kernDiagGradX.m SVN version 1
% 	last update 2008-10-11T19:45:36.000000Z

fhandle = str2func([kern.type 'KernDiagGradX']);
k = fhandle(kern, x);
