function gpTimeDynamicsDisplay(model, varargin)

% GPTIMEDYNAMICSDISPLAY Display a GP time dynamics model.
%
%	Description:
%
%	GPTIMEDYNAMICSDISPLAY(MODEL, SPACENUM) displays in human readable
%	form the contents of the GP time dynamics model.
%	 Arguments:
%	  MODEL - the model structure to be displaced.
%	  SPACENUM - number of spaces to place before displaying model
%	   structure.
%	
%
%	See also
%	GPDISPLAY, GPDYNAMICSCREATE, MODELDISPLAY.


%	Copyright (c) 2006 Neil D. Lawrence
% 	gpTimeDynamicsDisplay.m CVS version 1.1
% 	gpTimeDynamicsDisplay.m SVN version 29
% 	last update 2007-11-03T14:32:39.000000Z

gpDisplay(model, varargin{:});