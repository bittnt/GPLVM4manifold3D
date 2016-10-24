function skelModifyHierarchical(handle, channels, skel, visIndex, padding)

% SKELMODIFYHIERARCHICAL Helper code for visualisation of skel data.
%
%	Description:
%	skelModifyHierarchical(handle, channels, skel, visIndex, padding)
%

%	Copyright (c) 2007 Neil D. Lawrence
% 	skelModifyHierarchical.m version 1.3



if nargin<4
  padding = 0;
end
channels = [channels zeros(1, padding)];
vals = acclaim2xyzHierarchical(skel, channels, visIndex);
connect = skelConnectionMatrix(skel);

indices = find(connect);
[I, J] = ind2sub(size(connect), indices);


set(handle(1), 'Xdata', vals(:, 1), 'Ydata', vals(:, 3), 'Zdata', ...
                 vals(:, 2));
  
for i = 1:length(indices)
  set(handle(i+1), 'Xdata', [vals(I(i), 1) vals(J(i), 1)], ...
            'Ydata', [vals(I(i), 3) vals(J(i), 3)], ...
            'Zdata', [vals(I(i), 2) vals(J(i), 2)]);
end


function [vals, connect] = wrapAround(vals, lim, connect);


quot = lim(2) - lim(1);
vals = rem(vals, quot)+lim(1);
nVals = floor(vals/quot);
for i = 1:size(connect, 1)
  for j = find(connect(i, :))
    if nVals(i) ~= nVals(j)
      connect(i, j) = 0;
    end
  end
end
