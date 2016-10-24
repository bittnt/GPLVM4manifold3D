function modelDisplay(model, varargin)

% MODELDISPLAY Display a text output of a model.
%
%	Description:
%	modelDisplay(model, varargin)
%% 	modelDisplay.m CVS version 1.2
% 	modelDisplay.m SVN version 24
% 	last update 2007-03-27T18:20:35.468897Z

% Check if the model has display code.
if exist([model.type 'Display'])==2
  fhandle = str2func([model.type 'Display']);
  fhandle(model, varargin{:});
end
