function ppcaInfo = ppcaDeconstruct(model)

% PPCADECONSTRUCT break PPCA in pieces for saving.
%
%	Description:
%
%	PPCAINFO = PPCADECONSTRUCT(MODEL) takes an PPCA model structure and
%	breaks it into component parts for saving.
%	 Returns:
%	  PPCAINFO - a structure containing the other information from the
%	   PPCA: what the sparse approximation is, what the inducing
%	   variables are.
%	 Arguments:
%	  MODEL - the model that needs to be saved.
%	
%
%	See also
%	PPCARECONSTRUCT


%	Copyright (c) 2009 Neil D. Lawrence
% 	ppcaDeconstruct.m SVN version 545
% 	last update 2009-10-06T11:20:46.389750Z

ppcaInfo = model;
removeFields = {'y'};

for i = 1:length(removeFields)
  if isfield(ppcaInfo, removeFields{i})
    ppcaInfo = rmfield(ppcaInfo, removeFields{i});
  end
end

