function kern = cmpndKernSetIndex(kern, component, indices)

% CMPNDKERNSETINDEX Set the indices in the compound kernel.
%
%	Description:
%	kern = cmpndKernSetIndex(kern, component, indices)
%% 	cmpndKernSetIndex.m CVS version 1.2
% 	cmpndKernSetIndex.m SVN version 1
% 	last update 2006-10-25T10:53:00.000000Z

if size(indices, 1) ~= 1
  error('Indices should be a row vector.');
end
if max(indices) > kern.inputDimension
  error('Indices are larger than kernel input dimension');
elseif min(indices) < 0
  error('Indices should be greater than zero.');
end
  
kern.comp{component}.inputDimension = length(indices);
kern.comp{component}.index = indices;
kern.comp{component} = kernParamInit(kern.comp{component});
kern.nParams = 0;
for i = 1:length(kern.comp)
  kern.nParams = kern.nParams + kern.comp{i}.nParams;
end


kern.paramGroups = speye(kern.nParams);
