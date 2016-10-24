function joint = xyzhumaneva2joint(pos,transf)

% XYZHUMANEVA2JOINT
%
%	Description:
%	


%	Copyright (c) 2008 Carl Henrik Ek and Neil Lawrence
% 	xyzhumaneva2joint.m SVN version 119
% 	last update 2008-10-21T09:52:55.000000Z

% pos = pos';
% joint(:,1) = pos(1:3:end);
% joint(:,2) = pos(2:3:end);
% joint(:,3) = pos(3:3:end);

joint = reshape(pos, 20, 3);

if(exist('transf','var'))
  joint = joint - repmat(transf.center,size(joint,1),1);
  M = rotationMatrix(transf.x,transf.y,transf.z);
  joint = joint*M;
  joint = joint + repmat(transf.center,size(joint,1),1);
end

return