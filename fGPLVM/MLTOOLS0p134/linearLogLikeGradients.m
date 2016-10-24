function g = linearLogLikeGradients(model)

% LINEARLOGLIKEGRADIENTS Linear model gradients.
%
%	Description:
%
%	G = LINEARLOGLIKEGRADIENTS(MODEL) computes the gradients of the log
%	likelihood of a linear model with respect to the parameters.
%	 Returns:
%	  G - the gradients of the model log likelihood.
%	 Arguments:
%	  MODEL - the model structure for computing the log likelihood.
%	
%
%	See also
%	MODELLOGLIKEIHOOD, LINEARGRAD


%	Copyright (c) 2006 Neil D. Lawrence
% 	linearLogLikeGradients.m CVS version 1.1
% 	linearLogLikeGradients.m SVN version 24
% 	last update 2007-03-27T18:20:27.662884Z

Xo = [model.X ones(size(model.X, 1), 1)];
W = [model.W; model.b];
G = -model.beta*(Xo'*Xo*W - Xo'*model.y);
gW = G(1:end-1, :);
gb = G(end, :);
g = [gW(:)' gb];
