function options = pmvuOptions(neighbours, sigma2)

% PMVUOPTIONS Create a default options structure for the PMVU model.
%
%	Description:
%
%	OPTIONS = PMVUOPTIONS(NEIGHBOURS, SIGMA2) creates a default options
%	structure for the probabilistic maximum variance unfolding model
%	structure.
%	 Returns:
%	  OPTIONS - the default options structure.
%	 Arguments:
%	  NEIGHBOURS - the number of neighbours to use.
%	  SIGMA2 - noise level.
%	
%
%	See also
%	PMVUCREATE, MODELOPTIONS


%	Copyright (c)  Neil D. Lawrence 2009
% 	pmvuOptions.m SVN version 584
% 	last update 2009-11-06T08:16:00.532904Z

  if nargin < 1
    neighbours = 7;
  end
  options.numNeighbours = neighbours;
  options.isNormalised = false;
  options.regulariser = 0.0;
  if nargin<2
    options.sigma2 = 0.0;
  else
    options.sigma2 = sigma2;
  end
end
