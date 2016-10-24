function [model, lbls] = fgplvmLoadResult(dataSet, number)

% FGPLVMLOADRESULT Load a previously saved result.
%
%	Description:
%
%	[MODEL, LBLS] = FGPLVMLOADRESULT(DATASET, NUMBER) loads a previously
%	saved FGPLVM result.
%	 Returns:
%	  MODEL - the saved model.
%	  LBLS - labels of the data set (for visualisation purposes).
%	 Arguments:
%	  DATASET - the name of the data set to load.
%	  NUMBER - the number of the FGPLVM run to load.
%	
%
%	See also
%	LVMLOADDATA


%	Copyright (c) 2003, 2004, 2005, 2006, 2008 Neil D. Lawrence
% 	fgplvmLoadResult.m CVS version 1.3
% 	fgplvmLoadResult.m SVN version 29
% 	last update 2008-06-13T09:17:10.000000Z

[Y, lbls] = lvmLoadData(dataSet);

dataSet(1) = upper(dataSet(1));
load(['dem' dataSet num2str(number)])
