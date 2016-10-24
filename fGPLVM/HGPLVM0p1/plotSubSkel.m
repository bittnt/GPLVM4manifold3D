function visHandle = plotSubSkel(visIndex, model, subSkel, padding, ...
                                 axesHandle)

% PLOTSUBSKEL Plot a given sub-skeleton.
%
%	Description:
%
%	PLOTSUBSKEL(VISINDEX, MODEL, SUBSKEL, PADDING) plots a sub skeleton
%	on for the given visualisation.
%	 Arguments:
%	  VISINDEX - the index of the visualisation structure into which the
%	   plot will be made.
%	  MODEL - the model containing the learned information about the
%	   skeleton to be plotted.
%	  SUBSKEL - the sub-skeleton structure to be plotted.
%	  PADDING - any padding to be added to the skeleton.
%	
%	


%	Copyright (c) 2006 % COPYRIGHT Andrew J. Moore
% 	plotSubSkel.m version 1.1

global visualiseInfo;
if nargin < 5
  figure(2)
else
  axes(axesHandle)
end

visData = zeros(1, model.d);
%set visData to frame with max sum of squares of joint angles
[void, maxInd] = min(sum((model.y.*model.y), 2));
visData = model.y(maxInd, :);

visHandle = visualiseInfo(visIndex).visualiseFunction(visData, subSkel, visIndex, padding);

set(axesHandle, 'UserData', 0);
set(visHandle, 'eraseMode', 'xor');
colormap gray;




