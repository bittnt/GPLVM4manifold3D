function ind = paramNameRegularExpressionLookup(model, pattern)

% PARAMNAMEREGULAREXPRESSIONLOOKUP Returns the indices of the parameter containing the given regular expression.
%
%	Description:
%
%	IND = PARAMNAMEREGULAREXPRESSIONLOOKUP(MODEL, PATTERN) returns the
%	index of the parameters which contain the given regular expression.
%	If no matches are found then an empty vector is returned.
%	 Returns:
%	  IND - the indices of those parameters in the model.
%	 Arguments:
%	  MODEL - the model for which parameters are reverse looked up.
%	  PATTERN - the regular expression that should match the names.
%	
%
%	See also
%	CMPNDTIEPARAMETERS, PARAMNAMEREVERSELOOKUP


%	Copyright (c) 2008 Neil D. Lawrence
% 	paramNameRegularExpressionLookup.m SVN version 151
% 	last update 2008-11-04T16:32:04.816209Z
  
  ind = [];
  [void, names] = modelExtractParam(model);
  for i = 1:length(names)
    if(regexp(names{i}, pattern))
      ind = [ind i];
    end
  end
end