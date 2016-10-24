function kern = rbfKernParamInit(kern)

% RBFKERNPARAMINIT RBF kernel parameter initialisation.
%
%	Description:
%	The radial basis function kernel (RBF) is sometimes also known as
%	the squared exponential kernel. It is a very smooth non-linear
%	kernel and is a popular choice for generic use.
%	
%	k(x_i, x_j) = sigma2 * exp(-gamma/2 *(x_i - x_j)'*(x_i - x_j))
%	
%	The parameters are sigma2, the process variance (kern.variance)
%	and gamma, the inverse width (kern.inverseWidth). The inverse
%	width controls how wide the basis functions are, the larger
%	gamma, the smaller the basis functions are.
%	
%	There is also an automatic relevance determination version of
%	this kernel provided.
%	
%	
%
%	KERN = RBFKERNPARAMINIT(KERN) initialises the radial basis function
%	kernel structure with some default parameters.
%	 Returns:
%	  KERN - the kernel structure with the default parameters placed in.
%	 Arguments:
%	  KERN - the kernel structure which requires initialisation.
%	
%
%	See also
%	RBFARDKERNPARAMINIT, KERNCREATE, KERNPARAMINIT


%	Copyright (c) 2004, 2005, 2006 Neil D. Lawrence
% 	rbfKernParamInit.m CVS version 1.6
% 	rbfKernParamInit.m SVN version 316
% 	last update 2009-03-17T14:27:28.000000Z


kern.inverseWidth = 1;
kern.variance = 1;
kern.nParams = 2;

% Constrains parameters positive for optimisation.
kern.transforms.index = [1 2];
kern.transforms.type = optimiDefaultConstraint('positive');
kern.isStationary = true;
kern.isNormalised = false;
