function factors = kernFactors(kern, factorType)

% KERNFACTORS Extract factors associated with transformed optimisation space.
%
%	Description:
%	factors = kernFactors(kern, factorType)
%% 	kernFactors.m CVS version 1.2
% 	kernFactors.m SVN version 1
% 	last update 2008-10-11T19:45:36.000000Z

factors.index = [];
factors.val = [];
if ~isempty(kern.transforms)
  fhandle = str2func([kern.type 'KernExtractParam']);
  params = fhandle(kern);
  for i = 1:length(kern.transforms)
    index = kern.transforms(i).index;
    factors.index = [factors.index index];
    fhandle = str2func([kern.transforms(i).type 'Transform']);
    factors.val = [factors.val  ...
        fhandle(params(index), factorType)];
  end
end
