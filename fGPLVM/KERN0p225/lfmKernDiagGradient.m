
% LFMKERNDIAGGRADIENT Compute the gradient of the LFM kernel's diagonal wrt parameters.
%
%	Description:
%
%	G = LFMKERNDIAGGRADIENT(KERN, X, FACTORS) computes the gradient of
%	functions of the diagonal of the single input motif kernel matrix
%	with respect to the parameters of the kernel. The parameters'
%	gradients are returned in the order given by the lfmKernExtractParam
%	command.
%	 Returns:
%	  G - gradients of the relevant function with respect to each of the
%	   parameters. Ordering should match the ordering given in
%	   lfmKernExtractParam.
%	 Arguments:
%	  KERN - the kernel structure for which the gradients are computed.
%	  X - the input data for which the gradient is being computed.
%	  FACTORS - partial derivatives of the function of interest with
%	   respect to the diagonal elements of the kernel.
%	
%
%	See also
%	LFMKERNPARAMINIT, KERNDIAGGRADIENT, LFMKERNEXTRACTPARAM, LFMKERNGRADIENT


%	Copyright (c) 2007 Neil D. Lawrence
% 	lfmKernDiagGradient.m SVN version 20
% 	last update 2008-06-02T17:25:08.000000Z
  
error('lfmKernDiagGradient not yet implemented.')

