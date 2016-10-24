function handle = xyzhumanevaModify2(handle,pos)

% XYZHUMANEVAMODIFY2
%
%	Description:
%	


%	Copyright (c) 2008 Carl Henrik Ek and Neil Lawrence
% 	xyzhumanevaModify2.m SVN version 119
% 	last update 2008-10-21T09:52:55.000000Z


joint = xyzhumaneva2joint(pos);
xyzhumanevaDraw(joint,handle{1});
xyzhumanevaDraw(joint,handle{2});

return