function model = pmvuExpandParam(model, params)

% PMVUEXPANDPARAM Create model structure from PMVU model's parameters.
%
%	Description:
%
%	MODEL = PMVUEXPANDPARAM(MODEL, PARAM) returns a probabilistic
%	maximum variance unfolding model structure filled with the
%	parameters in the given vector. This is used as a helper function to
%	enable parameters to be optimised in, for example, the NETLAB
%	optimisation functions.
%	 Returns:
%	  MODEL - model structure with the given parameters in the relevant
%	   locations.
%	 Arguments:
%	  MODEL - the model structure in which the parameters are to be
%	   placed.
%	  PARAM - vector of parameters which are to be placed in the model
%	   structure.
%	
%
%	See also
%	PMVUCREATE, PMVUEXTRACTPARAM, MODELEXPANDPARAM


%	Copyright (c)  Neil D. Lawrence 2009
% 	pmvuExpandParam.m SVN version 584
% 	last update 2009-11-06T08:16:00.484772Z

  fhandle = str2func([model.kappaTransform 'Transform']);
  params = fhandle(params, 'atox');
  model.kappa = reshape(params, model.N, model.k);
  model = spectralUpdateLaplacian(model);
  Kinv = model.L + repmat(model.gamma, model.N, model.N);
  if model.sigma2>0
    model.Sigma = pdinv(Kinv) + model.sigma2*eye(model.N);
    [model.invSigma, U] = pdinv(model.Sigma);
    model.logDetSigma = logdet(model.Sigma, U);
    A = speye(model.N) + model.sigma2*Kinv;
    model.Ainv = pdinv(A);
    model.AinvLinv = pdinv(A*Kinv);
  else
    [model.K, U] = pdinv(full(Kinv));
    model.logDetK = - logdet(Kinv, U);
  end
end
