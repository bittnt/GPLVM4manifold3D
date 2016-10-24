function scaleNoiseDisplay(noise, spacing)

% SCALENOISEDISPLAY Display the parameters of the scaled noise model.
%
%	Description:
%	scaleNoiseDisplay(noise, spacing)
%% 	scaleNoiseDisplay.m CVS version 1.2
% 	scaleNoiseDisplay.m SVN version 29
% 	last update 2007-11-03T14:29:04.000000Z

if nargin > 1
  spacing = repmat(32, 1, spacing);
else
  spacing = [];
end
spacing = char(spacing);
for i = 1:noise.numProcess
  fprintf(spacing)
  fprintf('Bias on process %d: %2.4f\n', i, noise.bias(i))
  fprintf(spacing)
  fprintf('Scale on process %d: %2.4f\n', i, noise.scale(i))
end
