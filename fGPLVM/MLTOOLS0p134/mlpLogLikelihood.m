function ll = mlpLogLikelihood(model)

% MLPLOGLIKELIHOOD Multi-layer perceptron log likelihood.
%
%	Description:
%
%	LL = MLPLOGLIKELIHOOD(MODEL) computes the log likelihood of a
%	multi-layer perceptron model. For single hidden layer models this is
%	done by wrapping the mlperr command.
%	 Returns:
%	  LL - the model log likelihood.
%	 Arguments:
%	  MODEL - the model structure for computing the log likelihood.
%	
%
%	See also
%	MODELLOGLIKEIHOOD, MLPERR


%	Copyright (c) 2006, 2007 Neil D. Lawrence
% 	mlpLogLikelihood.m CVS version 1.3
% 	mlpLogLikelihood.m SVN version 24
% 	last update 2007-08-28T08:30:08.075838Z


if length(model.hiddenDim) == 1
  ll = -mlperr(model, model.X, model.y);
else
  Y = mlpOut(model, model.X);
  ll = -0.5*sum(sum((model.Y - Y).^2));
end

ll = ll - size(model.X, 1)/2*log(2*pi);