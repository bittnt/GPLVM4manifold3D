function rbfinfwhiteKernDisplay(kern, spacing)

% RBFINFWHITEKERNDISPLAY Display parameters of the RBF-WHITE kernel (with
%
%	Description:
%	integration limits between minus infinity and infinity).
%
%	RBFINFWHITEKERNDISPLAY(KERN) displays the parameters of the
%	RBF-WHITE kernel and the kernel type to the console.
%	 Arguments:
%	  KERN - the kernel to display.
%
%	RBFINFWHITEKERNDISPLAY(KERN, SPACING)
%	 Arguments:
%	  KERN - the kernel to display.
%	  SPACING - how many spaces to indent the display of the kernel by.
%	
%
%	See also
%	RBFINFWHITEKERNPARAMINIT, MODELDISPLAY, KERNDISPLAY


%	Copyright (c) 2009 David Luengo
% 	rbfinfwhiteKernDisplay.m SVN version 362
% 	last update 2009-06-02T22:01:41.000000Z

if nargin > 1
  spacing = repmat(32, 1, spacing);
else
  spacing = [];
end
spacing = char(spacing);
fprintf(spacing);
fprintf('RBF-INF-WHITE inverse width: %2.4f (length scale %2.4f)\n', ...
        kern.inverseWidth, 1/sqrt(kern.inverseWidth));
fprintf(spacing);
fprintf('RBF-INF-WHITE variance: %2.4f\n', kern.variance)
