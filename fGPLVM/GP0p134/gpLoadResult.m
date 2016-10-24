function model = gpLoadResult(dataSet, number)

% GPLOADRESULT Load a previously saved result.
%
%	Description:
%
%	MODEL = GPLOADRESULT(DATASET, NUMBER) loads a previously saved GP
%	result.
%	 Returns:
%	  MODEL - the saved model.
%	 Arguments:
%	  DATASET - the name of the data set to load.
%	  NUMBER - the number of the GP run to load.
%	
%
%	See also
%	GPLOADRESULT


%	Copyright (c) 2003, 2004, 2005, 2006, 2008 Neil D. Lawrence
% 	gpLoadResult.m SVN version 536
% 	last update 2009-09-29T13:02:50.000000Z

  [X, y] = mapLoadData(dataSet);

  dataSet(1) = upper(dataSet(1));
  load(['dem' dataSet 'Gp' num2str(number)])
  model = gpReconstruct(kern, noise, gpInfo, X, y);
end