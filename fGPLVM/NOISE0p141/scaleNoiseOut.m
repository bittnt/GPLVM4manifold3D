function y = scaleNoiseOut(noise, mu, varSigma)

% SCALENOISEOUT A simple noise model that scales and centres the data.
%
%	Description:
%	y = scaleNoiseOut(noise, mu, varSigma)
%% 	scaleNoiseOut.m CVS version 1.1
% 	scaleNoiseOut.m SVN version 29
% 	last update 2007-11-03T14:29:04.000000Z

y = zeros(size(mu));
for i = 1:size(mu, 2)
  y(:, i) = noise.bias(i) + mu(:, i)*noise.scale(i);
end


