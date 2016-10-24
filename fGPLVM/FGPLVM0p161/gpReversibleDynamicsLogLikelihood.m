function ll = gpReversibleDynamicsLogLikelihood(model)

% GPREVERSIBLEDYNAMICSLOGLIKELIHOOD Give the log likelihood of the dynamics part.
%
%	Description:
%	ll = gpReversibleDynamicsLogLikelihood(model)
%% 	gpReversibleDynamicsLogLikelihood.m CVS version 1.3
% 	gpReversibleDynamicsLogLikelihood.m SVN version 29
% 	last update 2007-11-03T14:32:43.000000Z

ll = gpLogLikelihood(model);

% Use prior on first two points only for reversible dynamics model.
if isfield(model, 'prior') &  ~isempty(model.prior)
  ll = ll + priorLogProb(model.prior, model.X(1, :));
  ll = ll + priorLogProb(model.prior, model.X(2, :));
end  
