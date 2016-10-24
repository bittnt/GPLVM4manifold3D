function cmpndNoiseDisplay(noise, varargin)

% CMPNDNOISEDISPLAY Display parameters of the CMPND noise.
%
%	Description:
%
%	CMPNDNOISEDISPLAY(NOISE) displays the parameters of the compound
%	noise and the noise type to the console.
%	 Arguments:
%	  NOISE - the noise to display.
%
%	CMPNDNOISEDISPLAY(NOISE, SPACING)
%	 Arguments:
%	  NOISE - the noise to display.
%	  SPACING - how many spaces to indent the display of the noise by.
%	
%
%	See also
%	CMPNDNOISEPARAMINIT, MODELDISPLAY, NOISEDISPLAY


%	Copyright (c) 2004, 2005 Neil D. Lawrence
% 	cmpndNoiseDisplay.m CVS version 1.3
% 	cmpndNoiseDisplay.m SVN version 29
% 	last update 2007-11-03T14:29:08.000000Z


for i = 1:length(noise.comp)
  noiseDisplay(noise.comp{i}, varargin{:});
end