function fileKernDisplay(kern, spacing)

% FILEKERNDISPLAY Display parameters of the FILE kernel.
%
%	Description:
%
%	FILEKERNDISPLAY(KERN) displays the parameters of the stored file
%	kernel and the kernel type to the console.
%	 Arguments:
%	  KERN - the kernel to display.
%
%	FILEKERNDISPLAY(KERN, SPACING)
%	 Arguments:
%	  KERN - the kernel to display.
%	  SPACING - how many spaces to indent the display of the kernel by.
%	
%
%	See also
%	FILEKERNPARAMINIT, MODELDISPLAY, KERNDISPLAY


%	Copyright (c) 2005, 2006 Neil D. Lawrence
% 	fileKernDisplay.m CVS version 1.3
% 	fileKernDisplay.m SVN version 1
% 	last update 2006-10-25T10:53:00.000000Z

if nargin > 1
  spacing = repmat(32, 1, spacing);
else
  spacing = [];
end
spacing = char(spacing);
fprintf(spacing);
fprintf('File Kernel Variance: %2.4f\n', kern.variance)
