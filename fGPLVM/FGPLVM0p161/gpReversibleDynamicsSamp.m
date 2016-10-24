function y = gpReversibleDynamicsSamp(model, X);

% GPREVERSIBLEDYNAMICSSAMP Sample from the dynamics for a given input.
%
%	Description:
%	y = gpReversibleDynamicsSamp(model, X);
%% 	gpReversibleDynamicsSamp.m CVS version 1.3
% 	gpReversibleDynamicsSamp.m SVN version 29
% 	last update 2007-11-03T14:32:42.000000Z

persistent oldX
if isempty(oldX)
  Xp = [X zeros(size(X))];
else
  Xp = [X X-oldX];
end
oldX = X;
[mu, var] = gpPosteriorMeanVar(model, Xp);
y = gsamp(mu, diag(var), 1);
y = X + y;
