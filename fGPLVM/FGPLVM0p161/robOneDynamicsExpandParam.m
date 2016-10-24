function model = robOneDynamicsExpandParam(model, params)

% ROBONEDYNAMICSEXPANDPARAM Place the parameters vector into the model for first robot dynamics.
%
%	Description:
%	model = robOneDynamicsExpandParam(model, params)
%% 	robOneDynamicsExpandParam.m CVS version 1.3
% 	robOneDynamicsExpandParam.m SVN version 29
% 	last update 2007-11-03T14:33:41.000000Z

if length(params)>0
  error(['There should be no placing of parameters in Robot One ' ...
         'Dynamics']);
end
return;