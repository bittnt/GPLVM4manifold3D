function robOneDynamicsDisplay(model, spaceNum)

% ROBONEDYNAMICSDISPLAY Display the robot dynamics model.
%
%	Description:
%	robOneDynamicsDisplay(model, spaceNum)
%% 	robOneDynamicsDisplay.m CVS version 1.3
% 	robOneDynamicsDisplay.m SVN version 29
% 	last update 2007-11-03T14:33:41.000000Z

if nargin > 1
  spacing = repmat(32, 1, spaceNum);
else
  spaceNum = 0;
  spacing = [];
end
spacing = char(spacing);
fprintf(spacing);
fprintf('First Tailored dynamics model for robot:\n')
fprintf(spacing);
fprintf('  Length distribution value of a: %2.4f\n', model.a)
fprintf(spacing);
fprintf('  Length distribution value of b: %2.4f\n', model.b)
fprintf(spacing);
fprintf('  Length distribution mix coefficient: %2.4f\n', model.mixR);
fprintf(spacing);
fprintf('  Angle distribution sigma2: %2.4f\n', model.sigma2);
fprintf(spacing);
fprintf('  Angle distribution mix coefficient %2.4f\n', model.mixTheta);
