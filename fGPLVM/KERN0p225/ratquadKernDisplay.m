function ratquadKernDisplay(kern, spacing)

% RATQUADKERNDISPLAY Display parameters of the RATQUAD kernel.
%
%	Description:
%
%	RATQUADKERNDISPLAY(KERN) displays the parameters of the rational
%	quadratic kernel and the kernel type to the console.
%	 Arguments:
%	  KERN - the kernel to display.
%
%	RATQUADKERNDISPLAY(KERN, SPACING)
%	 Arguments:
%	  KERN - the kernel to display.
%	  SPACING - how many spaces to indent the display of the kernel by.
%	
%
%	See also
%	RATQUADKERNPARAMINIT, MODELDISPLAY, KERNDISPLAY


%	Copyright (c) 2006 Neil D. Lawrence
% 	ratquadKernDisplay.m CVS version 1.1
% 	ratquadKernDisplay.m SVN version 1
% 	last update 2008-10-11T19:45:36.000000Z

if nargin > 1
  spacing = repmat(32, 1, spacing);
else
  spacing = [];
end
spacing = char(spacing);
fprintf(spacing);
fprintf('Rational quadratic length scale: %2.4f\n', ...
        kern.lengthScale);
fprintf(spacing);
fprintf('Rational quadratic alpha: %2.4f\n', kern.alpha)
fprintf(spacing);
fprintf('Rational quadratic variance: %2.4f\n', kern.variance)
