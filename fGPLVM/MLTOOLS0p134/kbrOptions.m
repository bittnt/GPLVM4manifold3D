function options = kbrOptions(X)

% KBROPTIONS Create a default options structure for the KBR model.
%
%	Description:
%
%	OPTIONS = KBROPTIONS(X) creates a default options structure for the
%	kernel based regression model structure.
%	 Returns:
%	  OPTIONS - the default options structure.
%	 Arguments:
%	  X - the input data for the kernel regression.
%	
%
%	See also
%	KBRCREATE, MODELOPTIONS


%	Copyright (c) 2005, 2006 Neil D. Lawrence
% 	kbrOptions.m CVS version 1.3
% 	kbrOptions.m SVN version 24
% 	last update 2007-05-23T10:14:16.752033Z

options.kern = 'rbf';
options.X = X;
