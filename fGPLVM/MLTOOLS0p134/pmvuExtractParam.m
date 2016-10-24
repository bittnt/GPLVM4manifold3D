function [params, names] = pmvuExtractParam(model)

% PMVUEXTRACTPARAM Extract parameters from the PMVU model structure.
%
%	Description:
%
%	PARAM = PMVUEXTRACTPARAM(MODEL) extracts parameters from the
%	probabilistic maximum variance unfolding model structure into a
%	vector of parameters for optimisation.
%	 Returns:
%	  PARAM - vector of parameters extracted from the model.
%	 Arguments:
%	  MODEL - the model structure containing the parameters to be
%	   extracted.
%
%	[PARAM, NAMES] = PMVUEXTRACTPARAM(MODEL) extracts parameters and
%	parameter names from the probabilistic maximum variance unfolding
%	model structure.
%	 Returns:
%	  PARAM - vector of parameters extracted from the model.
%	  NAMES - cell array of strings containing names for each parameter.
%	 Arguments:
%	  MODEL - the model structure containing the parameters to be
%	   extracted.
%	
%	
%
%	See also
%	% SEEALSO PMVUCREATE, PMVUEXPANDPARAM, MODELEXTRACTPARAM, SCG, CONJGRAD


%	Copyright (c)  Neil D. Lawrence 2009
% 	pmvuExtractParam.m SVN version 548
% 	last update 2009-10-09T06:08:21.412057Z

  params = model.kappa(:)';
  fhandle = str2func([model.kappaTransform 'Transform']);
  params = fhandle(params, 'xtoa');

  counter = 0;
  for j = 1:size(model.kappa, 2)
    for i = 1:size(model.kappa, 1)
      counter = counter + 1;
      names{counter} = ['Spring ' num2str(i) ' to ' num2str(model.indices(i, j))] ;
    end
  end
end
