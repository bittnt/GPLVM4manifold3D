function isomapInfo = isomapDeconstruct(model)

% ISOMAPDECONSTRUCT break isomap in pieces for saving.
%
%	Description:
%
%	ISOMAPINFO = ISOMAPDECONSTRUCT(MODEL) takes an isomap model
%	structure and breaks it into component parts for saving.
%	 Returns:
%	  ISOMAPINFO - a structure containing the other information from the
%	   isomap: what the sparse approximation is, what the inducing
%	   variables are.
%	 Arguments:
%	  MODEL - the model that needs to be saved.
%	
%
%	See also
%	ISOMAPRECONSTRUCT


%	Copyright (c) 2009 Neil D. Lawrence
% 	isomapDeconstruct.m SVN version 545
% 	last update 2009-10-08T12:21:13.945981Z

isomapInfo = model;
removeFields = {'Y'};

for i = 1:length(removeFields)
  if isfield(isomapInfo, removeFields{i})
    isomapInfo = rmfield(isomapInfo, removeFields{i});
  end
end

