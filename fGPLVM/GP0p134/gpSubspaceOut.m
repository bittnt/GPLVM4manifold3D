function y = gpSubspaceOut(model,x)

% GPSUBSPACEOUT
%
%	Description:
%	


%	Copyright (c) 2008 Carl Henrik Ek
% 	gpSubspaceOut.m SVN version 105
% 	last update 2008-10-11T19:37:34.000000Z
  
y = NaN.*ones(size(x,1),length(model.dim));
y(:,find(model.dim)) = gpOut(model,x);

return;