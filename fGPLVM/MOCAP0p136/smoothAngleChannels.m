function channels = smoothAngleChannels(channels, skel);

% SMOOTHANGLECHANNELS Try and remove artificial discontinuities associated with angles.
%
%	Description:
%	channels = smoothAngleChannels(channels, skel);
%% 	smoothAngleChannels.m CVS version 1.1
% 	smoothAngleChannels.m SVN version 30
% 	last update 2008-01-12T11:32:50.000000Z

for i=1:length(skel.tree)
  for j=1:length(skel.tree(i).rotInd)    
    col = skel.tree(i).rotInd(j);
    if col
      for k=2:size(channels, 1)
        diff=channels(k, col)-channels(k-1, col);
        if abs(diff+360)<abs(diff)
          channels(k:end, col)=channels(k:end, col)+360;
        elseif abs(diff-360)<abs(diff)
          channels(k:end, col)=channels(k:end, col)-360;
        end        
      end
    end
  end
end