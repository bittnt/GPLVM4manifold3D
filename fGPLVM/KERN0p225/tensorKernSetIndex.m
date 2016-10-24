function kern = tensorKernSetIndex(kern, component, indices)

% TENSORKERNSETINDEX Set the indices in the tensor kernel.
%
%	Description:
%	kern = tensorKernSetIndex(kern, component, indices)
%% 	tensorKernSetIndex.m CVS version 1.1
% 	tensorKernSetIndex.m SVN version 1
% 	last update 2008-10-11T19:45:37.000000Z

kern = cmpndKernSetIndex(kern, component, indices);