
% DNETTEST Test some settings for the density network.
%
%	Description:
%	% 	dnetTest.m SVN version 24
% 	last update 2008-06-19T16:02:30.961622Z

model = dnetCreate(2, 3, randn(2, 3), dnetOptions);

model.basisStored = false;

modelTest(model)  