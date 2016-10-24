
% DEMTEMPORALSAMPLEPATHS Show sample paths from temporal dynamics.
%
%	Description:
%	

%	Copyright (c) 2007 Neil D. Lawrence
% 	demTemporalSamplePaths.m version 1.1

randn('seed', 1e5)
rand('seed', 1e5)
t = linspace(1, 100, 20)';
kern = kernCreate(t, {'rbf', 'white'})
kern.comp{2}.variance = 0.00001;
kern.whiteVariance = kern.comp{2}.variance;
kern.comp{1}.inverseWidth = 0.001;

K = kernCompute(kern, t);
numSamps = 5;
syms = getSymbols(numSamps);
clf, hold on
for i = 1:numSamps
  X = gsamp(zeros(size(t)), K, 2)';
  h =plot(X(:, 1), X(:, 2), [syms{i} '-']);
  set(h, 'linewidth', 3, 'markersize', 10);
end
set(gca, 'fontname', 'times')
set(gca, 'fontsize', 18)
hold off
print -depsc ../tex/diagrams/demTemporalSamplePaths.eps
print -dpng ../html/demTemporalSamplePaths.png