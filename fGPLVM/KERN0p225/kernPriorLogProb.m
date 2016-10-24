function L = kernPriorLogProb(kern)

% KERNPRIORLOGPROB Compute penalty terms associated with kernel priors.
%
%	Description:
%	L = kernPriorLogProb(kern)
%% 	kernPriorLogProb.m CVS version 1.4
% 	kernPriorLogProb.m SVN version 1
% 	last update 2006-10-25T10:53:00.000000Z

L = 0;
switch kern.type
 case {'cmpnd', 'multi', 'tensor'}
  for i = 1:length(kern.comp)
    L = L + kernPriorLogProb(kern.comp{i});
  end
 otherwise
  if isfield(kern, 'priors')
    fhandle = str2func([kern.type 'KernExtractParam']);
    params = fhandle(kern);
    for i = 1:length(kern.priors)
      index = kern.priors(i).index;
      L = L + priorLogProb(kern.priors(i), params(index));
    end
  end
end