function h = ncnmNoise3dPlot(noise, plotType, CX, CY, CZ, CZVar, varargin)

% NCNMNOISE3DPLOT Draw a 3D or contour plot for the NCNM noise model.
%
%	Description:
%	h = ncnmNoise3dPlot(noise, plotType, CX, CY, CZ, CZVar, varargin)
%% 	ncnmNoise3dPlot.m CVS version 1.1
% 	ncnmNoise3dPlot.m SVN version 29
% 	last update 2007-11-03T14:29:07.000000Z

if nargout > 0
  h = feval(plotType, CX, CY, CZ, varargin{:});
else
  feval(plotType, CX, CY, CZ, varargin{:});
end

