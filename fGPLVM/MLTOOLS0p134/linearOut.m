function Y = linearOut(model, X);

% LINEAROUT Obtain the output of the linear model.
%
%	Description:
%
%	Y = LINEAROUT(MODEL, X) gives the output of a linear model.
%	 Returns:
%	  Y - the output.
%	 Arguments:
%	  MODEL - the model for which the output is required.
%	  X - the input data for which the output is required.
%	
%
%	See also
%	MODELOUT, LINEARCREATE


%	Copyright (c) 2006, 2007 Neil D. Lawrence
% 	linearOut.m CVS version 1.2
% 	linearOut.m SVN version 161
% 	last update 2008-12-01T08:46:37.136249Z

numData = size(X, 1);
Y = X*model.W + ones(numData, 1)*model.b;
