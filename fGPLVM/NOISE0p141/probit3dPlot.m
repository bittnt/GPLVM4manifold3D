function probit3dPlot(noise, plotType, CX, CY, CZ, CZVar, varargin)

% PROBIT3DPLOT Draw a 3D or contour plot for the probit.
%
%	Description:
%	probit3dPlot(noise, plotType, CX, CY, CZ, CZVar, varargin)
%% 	probit3dPlot.m CVS version 1.3
% 	probit3dPlot.m SVN version 29
% 	last update 2007-11-03T14:29:07.000000Z

CZ = CZ + model.noise.bias;
fhandle = str2func(plotType);
fhandle(CX, CY, CZ, varargin{:});

