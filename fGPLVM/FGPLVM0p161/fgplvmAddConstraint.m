function model = fgplvmAddConstraint(model,options)

% FGPLVMADDCONSTRAINT Add latent constraints to FGPLVM model
%
%	Description:
%
%	MODEL = FGPLVMADDCONSTRAINT(MODEL, OPTIONS) Adds constraint
%	structure to FGPLVM model
%	 Returns:
%	  MODEL - the GP-LVM model.
%	 Arguments:
%	  MODEL - fgplvm model
%	  OPTIONS - options strucure as returnded from constraintOptions
%	
%
%	See also
%	CONSTRAINTOPTIONS


%	Copyright (c) 2009 Carl Henrik Ek
% 	fgplvmAddConstraint.m SVN version 292
% 	last update 2009-03-04T22:08:40.000000Z


%
if(isfield(model,'constraints')&&~isempty(model.constraints))
  % constraints init
  model = constraintCreate(model,options);
else
  % no constraints
  model.constraints = [];
  model.constraints.q = model.q;
  model.constraints.N = model.N;
  model.constraints.id = [];
  model.constraints.numConstraints = 0;
  model.constraints.comp = {};
  model = constraintCreate(model,options);
end

model.constraints.numConstraints = model.constraints.numConstraints + 1;
model.constraints.id = [model.constraints.id; false*ones(1,model.q)];
model.constraints.id(end,options.dim) = true;