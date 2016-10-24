function options = optOptions;

% OPTOPTIONS Give optimisation options for NETLAB.
%
%	Description:
%	options = optOptions;
%

%	Copyright (c) 2007 Neil D. Lawrence
% 	optOptions.m version 1.2


if exist('foptions')
  options = foptions;
else
  options = zeros(1, 18);
  options(2) = 1e-6;
  options(3) = 1e-4;
  options(4) = 1e-6;
  options(16) = 1e-8;
  options(17) = 0.1;
end
