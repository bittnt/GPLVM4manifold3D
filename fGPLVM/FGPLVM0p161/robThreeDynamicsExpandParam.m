function model = robThreeDynamicsExpandParam(model, params)

% ROBTHREEDYNAMICSEXPANDPARAM Place the parameters vector into the model for first robot dynamics.
%
%	Description:
%	model = robThreeDynamicsExpandParam(model, params)
%% 	robThreeDynamicsExpandParam.m CVS version 1.2
% 	robThreeDynamicsExpandParam.m SVN version 29
% 	last update 2007-11-03T14:33:40.000000Z

if length(params)>0
  error(['There should be no placing of parameters in Robot Three ' ...
         'Dynamics']);
end
return;