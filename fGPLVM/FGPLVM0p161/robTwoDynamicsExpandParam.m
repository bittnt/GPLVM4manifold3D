function model = robTwoDynamicsExpandParam(model, params)

% ROBTWODYNAMICSEXPANDPARAM Place the parameters vector into the model for first robot dynamics.
%
%	Description:
%	model = robTwoDynamicsExpandParam(model, params)
%% 	robTwoDynamicsExpandParam.m CVS version 1.3
% 	robTwoDynamicsExpandParam.m SVN version 29
% 	last update 2007-11-03T14:32:30.000000Z

if length(params)>0
  error(['There should be no placing of parameters in Robot Two ' ...
         'Dynamics']);
end
return;