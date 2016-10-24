function [params, names] = kbrExtractParam(model,dim);

% KBREXTRACTPARAM Extract parameters from the KBR model structure.
%
%	Description:
%
%	PARAM = KBREXTRACTPARAM(MODEL) extracts parameters from the kernel
%	based regression model structure into a vector of parameters for
%	optimisation.
%	 Returns:
%	  PARAM - vector of parameters extracted from the model.
%	 Arguments:
%	  MODEL - the model structure containing the parameters to be
%	   extracted.
%	DESC extracts parameters and parameter names from the kernel based regression model structure.
%	ARG model : the model structure containing the parameters to be
%	extracted.
%	RETURN param : vector of parameters extracted from the model.
%	RETURN names : cell array of strings containing names for each parameter.
%	
%	
%	
%	
%	
%
%	See also
%	KBRCREATE, KBREXPANDPARAM, MODELEXTRACTPARAM, SCG, CONJGRAD


%	Copyright (c) 2005, 2006, 2008 Neil D. Lawrence


%	With modifications by Carl Henrik Ek 2007
% 	kbrExtractParam.m CVS version 1.6
% 	kbrExtractParam.m SVN version 24
% 	last update 2008-02-12T14:53:57.765278Z

if(nargin<2)
  params = [model.A(:)' model.bias];
else
  params = model.A(:,dim);
  params = [params(:)' model.bias(dim)];
end

if nargout > 1
  % Add names to parameters
  counter = 0;
  for i = 1:model.numData
    for j = 1:model.outputDim
      counter = counter + 1;
      names{counter} = ['A(' num2str(i) ', ' num2str(j) ')'];
    end
  end
  for j = 1:model.outputDim
    counter = counter + 1;
    names{counter} = ['bias(' num2str(j) ')'];
  end
end