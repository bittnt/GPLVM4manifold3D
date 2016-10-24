function handle = skelVisualiseHierarchical(channels, skel, visIndex, padding)

% SKELVISUALISEHIERARCHICAL For updating a skel representation of 3-D data.
%
%	Description:
%	handle = skelVisualiseHierarchical(channels, skel, visIndex, padding)
%

%	Copyright (c) 2007 Neil D. Lawrence
% 	skelVisualiseHierarchical.m version 1.3


if nargin<4
  padding = 0;
end
channels = [channels zeros(1, padding)];
vals = acclaim2xyzHierarchical(skel, channels, visIndex); %should be skel2xyz for general use.
connect = skelConnectionMatrix(skel);

indices = find(connect);
[I, J] = ind2sub(size(connect), indices);
handle(1) = plot3(vals(:, 1), vals(:, 3), vals(:, 2), '.');
axis ij % make sure the left is on the left.
set(handle(1), 'markersize', 20);
hold on
grid on
for i = 1:length(indices)
  handle(i+1) = line([vals(I(i), 1) vals(J(i), 1)], ...
              [vals(I(i), 3) vals(J(i), 3)], ...
              [vals(I(i), 2) vals(J(i), 2)]);
  set(handle(i+1), 'linewidth', 2);
end
axis equal
xlabel('x')
ylabel('z')
zlabel('y')
axis on