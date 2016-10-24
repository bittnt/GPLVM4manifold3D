function model = modelParamInit(model, varargin)

% MODELPARAMINIT Initialise the parameters of the model.
%
%	Description:
%
%	MODEL = MODELPARAMINIT(MODEL, ...) initialises the parameters of the
%	model with some sensible values.
%	 Returns:
%	  MODEL - model with parameters initialised.
%	 Arguments:
%	  MODEL - model for which initialisation will be performed.
%	  ... - optional additional arguments.
%	
%
%	See also
%	MODELCREATE


%	Copyright (c) 2006 Neil D. Lawrence
% 	modelParamInit.m CVS version 1.1
% 	modelParamInit.m SVN version 24
% 	last update 2007-03-27T18:20:32.382429Z

fhandle = str2func([model.type 'ParamInit']);
options = fhandle(model, varargin{:});

