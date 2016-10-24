function [X, sigma2] = kpcaEmbed(Y, dims)

% KPCAEMBED Embed data set with kernel PCA.
%
%	Description:
%	[X, sigma2] = kpcaEmbed(Y, dims)
%% 	kpcaEmbed.m CVS version 1.1
% 	kpcaEmbed.m SVN version 24
% 	last update 2007-03-27T18:20:26.547370Z


if any(any(isnan(Y)))
  error('When missing data is present Kernel PCA cannot be used to initialise')
end

kern = kernCreate(Y, 'rbf');

K = kernCompute(kern, Y);
[u, v] = eigs(K, dims);
X = u*sqrt(v);
sigma2 = -1;