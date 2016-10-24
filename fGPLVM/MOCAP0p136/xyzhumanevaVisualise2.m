function handle = xyzhumanevaVisualise2(pos,fid)

% XYZHUMANEVAVISUALISE2
%
%	Description:
%	


%	Copyright (c) 2008 Carl Henrik Ek and Neil Lawrence
% 	xyzhumanevaVisualise2.m SVN version 119
% 	last update 2008-10-21T09:52:55.000000Z


if(nargin<2)
  fid = 2;
end

figure(fid);

% determine parametrization
if(max(max(abs(pos)))<100)
  type = 'jon';
else
  type = 'raquel';
end

joint = xyzhumaneva2joint(pos);
handle{1} = xyzhumanevaDraw(joint);axis equal;view([1 0 0]);
switch type
 case 'raquel'
  set(gca,'XLim',[-300 300],'YLim',[-300 300],'ZLim',[-800 800]);
 case 'jon'
  set(gca,'XLim',[-0.35 0.35],'YLim',[-0.35 0.35],'ZLim',[-1 0.3]);
end

figure(fid+2);
handle{2} = xyzhumanevaDraw(joint);axis equal;view([1 1 1]);
switch type
 case 'raquel'
  set(gca,'XLim',[-300 300],'YLim',[-300 300],'ZLim',[-800 800]);
 case 'jon'
  set(gca,'XLim',[-0.35 0.35],'YLim',[-0.35 0.35],'ZLim',[-1 0.3]);
end

return