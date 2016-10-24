function fgplvmResultsDynamic(dataSet, number, dataType, varargin)

% FGPLVMRESULTSDYNAMIC Load a results file and visualise them.
%
%	Description:
%	fgplvmResultsDynamic(dataSet, number, dataType, varargin)
%% 	fgplvmResultsDynamic.m CVS version 1.3
% 	fgplvmResultsDynamic.m SVN version 29
% 	last update 2007-11-03T14:32:50.000000Z
  
[model, lbls] = fgplvmLoadResult(dataSet, number);

% Visualise the results
switch size(model.X, 2) 
 case 2
  fgplvmVisualise(model, lbls, [dataType 'Visualise'], [dataType 'Modify'], ...
                 varargin{:});
  
 otherwise 
  error('No visualisation code for data of this latent dimension.');
end