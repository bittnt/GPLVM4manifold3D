function gX = ggXgaussianKernGradX(ggKern, gaussianKern, X, X2)

% GGXGAUSSIANKERNGRADX Compute gradient between the GG and GAUSSIAN
%
%	Description:
%	kernels wrt the input locations
%
%	G = GGXGAUSSIANKERNGRADX(KERN, X1, X2) computes the gradient between
%	the GG and GAUSSIAN kernels with respect to the input positions
%	where both the row positions and column positions are provided
%	separately.
%	 Returns:
%	  G - the returned gradients. The gradients are returned in a matrix
%	   which is numData2 x numInputs x numData1. Where numData1 is the
%	   number of data points in X1, numData2 is the number of data points
%	   in X2 and numInputs is the number of input dimensions in X.
%	 Arguments:
%	  KERN - kernel structure for which gradients are being computed.
%	  X1 - row locations against which gradients are being computed.
%	  X2 - column locations against which gradients are being computed.
%	
%	
%
%	See also
%	GAUSSIANKERNPARAMINIT, KERNGRADX, GAUSSIANKERNDIAGGRADX


%	Copyright (c) 2008 Mauricio A. Alvarez and Neil D. Lawrence


%	With modifications by Mauricio A. Alvarez 2009.
% 	ggXgaussianKernGradX.m SVN version 426
% 	last update 2009-07-17T10:58:29.000000Z

if nargin < 3,    
    X2 = X;
else
    U = X;
    X = X2;
    X2 = U;
end


[K, Kbase, Pqrinv, Prinv, P] = ggXgaussianKernCompute(ggKern, ....
    gaussianKern, X2, X);

if ggKern.isArd
    PX = X*diag(P);
    PX2 = X2*diag(P);
else
    PX = P*X;
    PX2 = P*X2;
end

gX = zeros(size(X2, 1), size(X2, 2), size(X, 1));
for i = 1:size(X, 1);
  gX(:, :, i) = gaussianKernGradXpoint(K(:,i), PX(i, :), PX2);
end


function gX = gaussianKernGradXpoint(gaussianPart, x, X2)

% GAUSSIANKERNGRADXPOINT Gradient with respect to one point of x.

gX = zeros(size(X2));
for i = 1:size(x, 2)
  gX(:, i) = (X2(:, i) - x(i)).*gaussianPart;
end

