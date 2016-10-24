
% MULTIKERNDIAGGRADIENT Compute the gradient of the MULTI kernel's diagonal wrt parameters.
%
%	Description:
%
%	G = MULTIKERNDIAGGRADIENT(KERN, X, FACTORS) computes the gradient of
%	functions of the diagonal of the multiple output block kernel matrix
%	with respect to the parameters of the kernel. The parameters'
%	gradients are returned in the order given by the
%	multiKernExtractParam command.
%	 Returns:
%	  G - gradients of the relevant function with respect to each of the
%	   parameters. Ordering should match the ordering given in
%	   multiKernExtractParam.
%	 Arguments:
%	  KERN - the kernel structure for which the gradients are computed.
%	  X - the input data for which the gradient is being computed.
%	  FACTORS - partial derivatives of the function of interest with
%	   respect to the diagonal elements of the kernel.
%
%	See also
%	MULTIKERNPARAMINIT, KERNDIAGGRADIENT, MULTIKERNEXTRACTPARAM, MULTIKERNGRADIENT
% 	multiKernDiagGradient.m CVS version 1.1
% 	multiKernDiagGradient.m SVN version 1
% 	last update 2006-10-25T10:53:00.000000Z

