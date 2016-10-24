function pmvuInfo = pmvuDeconstruct(model)

% PMVUDECONSTRUCT break PMVU in pieces for saving.
%
%	Description:
%
%	PMVUINFO = PMVUDECONSTRUCT(MODEL) takes an probabilistic maximum
%	variance unfolding model structure and breaks it into component
%	parts for saving.
%	 Returns:
%	  PMVUINFO - a structure containing the other information from the
%	   probabilistic maximum variance unfolding: what the sparse
%	   approximation is, what the inducing variables are.
%	 Arguments:
%	  MODEL - the model that needs to be saved.
%	
%
%	See also
%	PMVUCREATE, PMVURECONSTRUCT


%	Copyright (c)  Neil D. Lawrence 2009
% 	pmvuDeconstruct.m SVN version 548
% 	last update 2009-10-09T06:08:21.290218Z


  pmvuInfo = model;
  removeFields = {'Y'};
  
  for i = 1:length(removeFields)
    if isfield(pmvuInfo, removeFields{i})
      pmvuInfo = rmfield(pmvuInfo, removeFields{i});
    end
  end
end
