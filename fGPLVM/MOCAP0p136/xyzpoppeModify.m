function handle = xyzpoppeModify(handle,pos)

% XYZPOPPEMODIFY
%
%	Description:
%	


%	Copyright (c) 2008 Carl Henrik Ek and Neil Lawrence
% 	xyzpoppeModify.m SVN version 162
% 	last update 2008-12-03T23:38:39.000000Z


joint = xyzpoppe2joint(pos);

if(iscell(handle))
  for(i = 1:1:length(handle))
    xyzpoppeDraw(joint,handle{i});
  end
else
  xyzpoppeDraw(joint,handle);
end

return