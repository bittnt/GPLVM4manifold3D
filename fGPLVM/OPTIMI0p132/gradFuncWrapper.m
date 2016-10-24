function [f, g] = gradFuncWrapper(x, func, grad, varargin)

% GRADFUNCWRAPPER Wrapper function to enable use of Carl Rasmussen's minimze function.
%
%	Description:
%	[f, g] = gradFuncWrapper(x, func, grad, varargin)
%

%	Copyright (c) 2007 Neil D. Lawrence
% 	gradFuncWrapper.m version 1.1


func = str2func(func);
grad = str2func(grad);
f = func(x', varargin{:});

if nargout > 1
  g = grad(x', varargin{:})';
end
