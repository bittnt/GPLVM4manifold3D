function noiseDisplay(noise, varargin)

% NOISEDISPLAY Display the parameters of the noise model.
%
%	Description:
%
%	NOISEDISPLAY(NOISE, SPACING) display the type of noise model and any
%	associated parameters.
%	 Arguments:
%	  NOISE - noise model to display.
%	  SPACING - any spacing to place before the noise model.
%	
%
%	See also
%	% SEEALSO MODELDISPLAY


%	Copyright (c) 2005 Neil D. Lawrence
% 	noiseDisplay.m CVS version 1.6
% 	noiseDisplay.m SVN version 29
% 	last update 2007-11-03T14:29:08.000000Z

fhandle = str2func([noise.type 'NoiseDisplay']);
fhandle(noise, varargin{:});