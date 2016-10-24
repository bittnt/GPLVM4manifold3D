function g = pmvuLogLikeGradients(model)

% PMVULOGLIKEGRADIENTS Gradient of PMVU model log likelihood with respect to parameters.
%
%	Description:
%
%	G = PMVULOGLIKEGRADIENTS(MODEL) computes the gradient of the
%	probabilistic maximum variance unfolding model's log likelihood with
%	respect to the parameters.
%	 Returns:
%	  G - the returned gradients.
%	 Arguments:
%	  MODEL - model structure for which gradients are being computed.
%	
%
%	See also
%	% SEEALSO PMVUCREATE, PMVULOGLIKELIHOOD, MODELLOGLIKEGRADIENTS


%	Copyright (c)  Neil D. Lawrence 2009
% 	pmvuLogLikeGradients.m SVN version 584
% 	last update 2009-11-06T08:16:00.508942Z
  if model.sigma2 == 0.0
    expD2 = zeros(model.N, model.k);
    for i = 1:model.N
      for j = 1:model.k
        ind = model.indices(i, j);
        D2_e(i, j) = model.K(i, i) - 2*model.K(i, ind) + model.K(ind, ind);
      end
    end
    gV = 0.5*( model.d*D2_e - model.D2);
  else
    AinvY = model.Ainv*model.Y;
    AinvYYTAinv = AinvY*AinvY';
    for i = 1:model.N
      for j = 1:model.k
        ind = model.indices(i, j);
        gV(i, j) = model.d*(model.AinvLinv(i, i) ...
                            - 2*model.AinvLinv(i, ind) ...
                            + model.AinvLinv(ind, ind));
        gV(i, j) = gV(i, j) - AinvYYTAinv(i, i) ...
            + 2*AinvYYTAinv(i, ind) ...
            - AinvYYTAinv(ind, ind);
      end
    end
    gV = gV*0.5;
  end
  fhandle = str2func([model.kappaTransform 'Transform']);
  factors = fhandle(model.kappa, 'gradfact');
  gV = gV.*factors;
  g = gV(:)';
  