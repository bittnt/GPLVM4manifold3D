function model = gpReversibleDynamicsExpandParam(model, params)

% GPREVERSIBLEDYNAMICSEXPANDPARAM Place the parameters vector into the model for GP dynamics.
%
%	Description:
%	model = gpReversibleDynamicsExpandParam(model, params)
%% 	gpReversibleDynamicsExpandParam.m CVS version 1.3
% 	gpReversibleDynamicsExpandParam.m SVN version 29
% 	last update 2007-11-03T14:32:44.000000Z

model = gpDynamicsExpandParam(model, params);
