
% DEMVOWELSLLE Model the vowels data with a 2-D FGPLVM using RBF kernel.
%
%	Description:
%	% 	demVowelsLle.m CVS version 1.2
% 	demVowelsLle.m SVN version 29
% 	last update 2007-11-03T14:33:04.000000Z

% Fix seeds
randn('seed', 1e5);
rand('seed', 1e5);

dataSetName = 'vowels';
experimentNo = 1;

% load data
[Y, lbls] = lvmLoadData(dataSetName);
X = lleEmbed(Y, 2);

