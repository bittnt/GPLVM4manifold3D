function handle = xyzankurVisualise2(pos,fid)

% XYZANKURVISUALISE2
%
%	Description:
%	


%	Copyright (c) 2008 Carl Henrik Ek and Neil Lawrence
% 	xyzankurVisualise2.m SVN version 119
% 	last update 2008-10-21T09:52:55.000000Z


if(nargin<2)
  fid = 1;
end

figure(fid);

joint = xyzankur2joint(pos);
handle{1} = xyzankurDraw(joint);axis equal;view([1 0 0]);
set(gca,'XLim',[-20 20],'YLim',[-20 20],'ZLim',[-5 70]);

figure(fid+2);
joint = xyzankur2joint(pos);
handle{2} = xyzankurDraw(joint);axis equal;view([1 1 1]);
set(gca,'XLim',[-20 20],'YLim',[-20 20],'ZLim',[-5 70]);


return;