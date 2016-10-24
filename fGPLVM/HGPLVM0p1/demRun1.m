
% DEMRUN1 Show visualisation of the run.
%
%	Description:
%	

%	Copyright (c) 2007 Neil D. Lawrence
% 	demRun1.m version 1.1


load data_35_20_run.mat
load data_35_dependencies.mat
colordef white
fgplvmHierarchicalVisualise(visualiseNodesData, dependencies);