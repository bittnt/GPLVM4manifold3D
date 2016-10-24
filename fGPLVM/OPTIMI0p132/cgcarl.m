function [x, options, flog, pointlog] = cgcarl(f, x, options, gradf, varargin)

% CGCARL Wrapper for Carl Rasmussen's conjugate gradient implemntation.
%
%	Description:
%	[x, options, flog, pointlog] = cgcarl(f, x, options, gradf, varargin)
%

%	Copyright (c) 2007 Neil D. Lawrence
% 	cgcarl.m version 1.1



length = options(14);
x = minimize(x', 'gradFuncWrapper', length, f, gradf, varargin{:})';










