function kernDisplay(kern, varargin)

% KERNDISPLAY Display the parameters of the kernel.
%
%	Description:
%
%	KERNDISPLAY(KERN) displays the parameters of the kernel and the
%	kernel type to the console.
%	 Arguments:
%	  KERN - the kernel to display.
%
%	KERNDISPLAY(KERN, SPACING)
%	 Arguments:
%	  KERN - the kernel to display.
%	  SPACING - how many spaces to indent the display of the kernel by.
%	
%
%	See also
%	% SEEALSO MODELDISPLAY


%	Copyright (c) 2006, 2005, 2004 % COPYRIGHT Neil D. Lawrence
% 	kernDisplay.m CVS version 1.7
% 	kernDisplay.m SVN version 1
% 	last update 2006-10-25T10:53:00.000000Z

fhandle = str2func([kern.type 'KernDisplay']);
fhandle(kern, varargin{:});