function gpDynamicsDisplay(model, varargin)

% GPDYNAMICSDISPLAY Display a GP dynamics model.
%
%	Description:
%
%	GPDYNAMICSDISPLAY(MODEL, SPACENUM) displays in human readable form
%	the contents of the GP dynamics model.
%	 Arguments:
%	  MODEL - the model structure to be displaced.
%	  SPACENUM - number of spaces to place before displaying model
%	   structure.
%	
%
%	See also
%	GPDISPLAY, GPDYNAMICSCREATE, MODELDISPLAY.


%	Copyright (c) 2006 Neil D. Lawrence
% 	gpDynamicsDisplay.m CVS version 1.4
% 	gpDynamicsDisplay.m SVN version 29
% 	last update 2007-11-03T14:32:47.000000Z

gpDisplay(model, varargin{:});