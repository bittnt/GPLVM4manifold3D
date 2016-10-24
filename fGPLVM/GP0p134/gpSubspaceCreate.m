function model = gpSubspaceCreate(q,d,X,y,options,dim)

% GPSUBSPACECREATE
%
%	Description:
%	


%	Copyright (c) 2008 Carl Henrik Ek
% 	gpSubspaceCreate.m SVN version 105
% 	last update 2008-10-11T19:37:34.000000Z
  
model = gpCreate(q,d,X,y,options);
model.dim = dim;
model.type = 'gpSubspace';

return;