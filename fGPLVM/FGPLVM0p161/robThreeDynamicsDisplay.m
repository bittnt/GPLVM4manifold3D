function robThreeDynamicsDisplay(model, spaceNum)

% ROBTHREEDYNAMICSDISPLAY Display the robot dynamics model.
%
%	Description:
%	robThreeDynamicsDisplay(model, spaceNum)
%% 	robThreeDynamicsDisplay.m CVS version 1.2
% 	robThreeDynamicsDisplay.m SVN version 29
% 	last update 2007-11-03T14:33:40.000000Z

if nargin > 1
  spacing = repmat(32, 1, spaceNum);
else
  spaceNum = 0;
  spacing = [];
end
spacing = char(spacing);
fprintf(spacing);
fprintf('Third Tailored dynamics model for robot:\n')
fprintf(spacing);
fprintf('  Lambda value: %2.4f\n', model.lambda)
fprintf(spacing);
fprintf('  Sigma value: %2.4f\n', model.sigma2)
