function [mapping, dnetInfo] = dnetDeconstruct(model)

% DNETDECONSTRUCT break DNET in pieces for saving.
%
%	Description:
%
%	[MAPPING, DNETINFO] = DNETDECONSTRUCT(MODEL) takes an DNET model
%	structure and breaks it into component parts for saving.
%	 Returns:
%	  MAPPING - the mapping component of the DNET model.
%	  DNETINFO - a structure containing the other information from the
%	   DNET: what the sparse approximation is, what the inducing
%	   variables are.
%	 Arguments:
%	  MODEL - the model that needs to be saved.
%	
%
%	See also
%	DNETRECONSTRUCT


%	Copyright (c) 2009 Neil D. Lawrence
% 	dnetDeconstruct.m SVN version 545
% 	last update 2009-10-06T11:20:46.365293Z

mapping = model.mapping;
dnetInfo = model;
removeFields = {'mapping', 'A',  'b', 'Phi', 'y', 'w', 'X'};

for i = 1:length(removeFields)
  if isfield(dnetInfo, removeFields{i})
    dnetInfo = rmfield(dnetInfo, removeFields{i});
  end
end

