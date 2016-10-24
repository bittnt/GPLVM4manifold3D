function mgaussianNoiseDisplay(noise, spacing)

% MGAUSSIANNOISEDISPLAY Display parameters of the MGAUSSIAN noise.
%
%	Description:
%
%	MGAUSSIANNOISEDISPLAY(NOISE) displays the parameters of the multiple
%	output Gaussian noise and the noise type to the console.
%	 Arguments:
%	  NOISE - the noise to display.
%
%	MGAUSSIANNOISEDISPLAY(NOISE, SPACING)
%	 Arguments:
%	  NOISE - the noise to display.
%	  SPACING - how many spaces to indent the display of the noise by.
%	
%
%	See also
%	MGAUSSIANNOISEPARAMINIT, MODELDISPLAY, NOISEDISPLAY


%	Copyright (c) 2004, 2005 Neil D. Lawrence
% 	mgaussianNoiseDisplay.m CVS version 1.3
% 	mgaussianNoiseDisplay.m SVN version 29
% 	last update 2007-11-03T14:29:07.000000Z


if nargin > 1
  spacing = repmat(32, 1, spacing);
else
  spacing = [];
end
spacing = char(spacing);

for i = 1:noise.numProcess
  fprintf(spacing)
  fprintf('MGaussian bias on process %d: %2.4f\n', i, noise.bias(i))
  fprintf(spacing)
  fprintf('MGaussian variance on process %d: %2.4f\n', i, noise.sigma2(i))
end

