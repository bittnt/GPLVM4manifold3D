function model = fgplvmCreate(q, Y, options)

% FGPLVMCREATE Create a GPLVM model with inducing variables.
%
%	Description:
%
%	MODEL = FGPLVMCREATE(Q, D, Y, OPTIONS) creates a GP-LVM model with
%	the possibility of using inducing variables to speed up computation.
%	 Returns:
%	  MODEL - the GP-LVM model.
%	 Arguments:
%	  Q - dimensionality of latent space.
%	  D - dimensionality of data space.
%	  Y - the data to be modelled in design matrix format (as many rows
%	   as there are data points).
%	  OPTIONS - options structure as returned from FGPLVMOPTIONS. This
%	   structure determines the type of approximations to be used (if
%	   any).
%	
%
%	See also
%	MODELCREATE, FGPLVMOPTIONS


%	Copyright (c) 2005, 2006 Neil D. Lawrence
% 	fgplvmCreate.m CVS version 1.8
% 	fgplvmCreate.m SVN version 498
% 	last update 2009-08-26T18:10:26.000000Z

d = size(Y, 2);

if (nargin ~= 3)
    error('remove d');
end

if size(Y, 2) ~= d
  error(['Input matrix Y does not have dimension ' num2str(d)]);
end

if isstr(options.initX)
  initFunc = str2func([options.initX 'Embed']);
  X = initFunc(Y, q);
else
  if size(options.initX, 1) == size(Y, 1) ...
        & size(options.initX, 2) == q
    X = options.initX;
  else
    error('options.initX not in recognisable form.');
  end
end


model = gpCreate(q, d, X, Y, options);

model.type = 'fgplvm';

if isstruct(options.prior)
  model.prior = options.prior;
else
  if ~isempty(options.prior)
    model.prior = priorCreate(options.prior);
  end
end

if isstruct(options.inducingPrior)
  model.inducingPrior = options.inducingPrior;
else
  if ~isempty(options.inducingPrior)
    model.inducingPrior = priorCreate(options.inducingPrior);
  end
end

if isfield(options, 'back') & ~isempty(options.back)
  if isstruct(options.back)
    model.back = options.back;
  else
    if ~isempty(options.back)
      model.back = modelCreate(options.back, model.d, model.q, options.backOptions);
    end
  end
  if options.optimiseInitBack
    % Match back model to initialisation.
    model.back = mappingOptimise(model.back, model.y, model.X);
  end
  % Now update latent positions with the back constraints output.
  model.X = modelOut(model.back, model.y);
else
  model.back = [];
end

model.constraints = {};

model.dynamics = [];

initParams = fgplvmExtractParam(model);
model.numParams = length(initParams);
% This forces kernel computation.
% model.kern = mvo.kern;
model = fgplvmExpandParam(model, initParams);

