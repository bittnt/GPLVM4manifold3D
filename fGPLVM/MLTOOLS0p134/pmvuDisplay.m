function pmvuDisplay(model, spacing)

% PMVUDISPLAY Display parameters of the PMVU model.
%
%	Description:
%
%	PMVUDISPLAY(MODEL) displays the parameters of the probabilistic
%	maximum variance unfolding model and the model type to the console.
%	 Arguments:
%	  MODEL - the model to display.
%
%	PMVUDISPLAY(MODEL, SPACING)
%	 Arguments:
%	  MODEL - the model to display.
%	  SPACING - how many spaces to indent the display of the model by.
%	
%
%	See also
%	PMVUCREATE, MODELDISPLAY


%	Copyright (c)  Neil D. Lawrence 2009
% 	pmvuDisplay.m SVN version 548
% 	last update 2009-10-09T06:08:21.302454Z

  if nargin > 1
    spacing = repmat(32, 1, spacing);
  else
    spacing = [];
  end
  spacing = char(spacing);
  fprintf(spacing);
  fprintf('Probabilistic MVU model:\n')
  fprintf(spacing);
  fprintf('  Neighbours: %d\n', model.k);
end