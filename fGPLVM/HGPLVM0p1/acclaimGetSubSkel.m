function [subskel, channelIndices] = acclaimGetSubSkel(skel, newRootName, children, stoplist)

% ACCLAIMGETSUBSKEL Gets a sub-skeleton from a larger acclaim format skeleton.
%
%	Description:
%
%	[SUBKEL, CHANNELINDICES] = ACCLAIMGETSUBSKEL(SKEL, NEWROOTNAME,
%	CHILDREN, STOPLIST) gets a sub-skeleton from a larger skeleton given
%	the original skeleton, the root of the new skeleton and the joints
%	from the root to be included in the sub-skeleton.
%	 Returns:
%	  SUBKEL - the sub-skeleton as specificed by the given arguments.
%	  CHANNELINDICES - the relevant channel indices associated with the
%	   sub-skeleton.
%	 Arguments:
%	  SKEL - Original skeleton to take a subskel from.
%	  NEWROOTNAME - Name of the joint from skel which will be the root
%	   of the new subskel.
%	  CHILDREN - Cell array containing the names of joints/bones below
%	   newRootName which are to be included in the subskel (omitting this
%	   will add all children of newRootName).
%	  STOPLIST - Cell array containing the names of joints/bones.  If
%	   any joint is explored which has a name on the stoplist, then this
%	   joint and its child joints are not added to the new subskel.
%	
%
%	See also
%	SKELREVERSELOOKUP


%	Copyright (c) 2006, 2007 Andrew J. Moore and Neil D. Lawrence
% 	acclaimGetSubSkel.m version 1.1


IND_ROOT = 1; %assume the index of a root node is always 1.

if nargout>1
  getSubChannels = 1;
  channelIndices = [];
else
  getSubChannels = 0;
end
if nargin < 4
  stoplist = {};
elseif ~iscell(stoplist)
  error('The ''stoplist'' parameter must be passed as a cell array.');    
end
if nargin > 2 
  if ~iscell(children)
    error('The ''children'' parameter must be passed as a cell array.');
  end
else
  children = {};
end

%Copy over key skel info
subskel.type = skel.type;

jointIndex = skelReverseLookup(skel, newRootName);
newIndex = 1; %global store of the current flat index of the subskel tree array.

%If the children parameter is defined, prune from the skel any child indices not
%in children.
if size(children, 1) > 0
  for n=1:length(children)
    childJointIndices(n) = skelReverseLookup(skel, children(n));
  end
  count = 1;
  for m=1:length(skel.tree(jointIndex).children)
    bJointMatch = 0;
    for n=1:length(childJointIndices)
      if childJointIndices(n) == skel.tree(jointIndex).children(m)
        bJointMatch = 1;
      end
    end
    if bJointMatch
      prunedChildren(count) = skel.tree(jointIndex).children(m);
      count = count + 1;
    end
  end
  skel.tree(jointIndex).children = prunedChildren;
end

%if the root of the subskel is not the root of the original skel, need to
%calculate the position offset of the new subskel from the original root
if not(strcmp(newRootName,'root'))
  %calculate the cumulative offset of the root of the subskel from the
  %original skel root.
  rootOffset = skel.tree(jointIndex).offset;
  %BEGIN - calculate the offset in relation to the whole skel. should now
  %be done at run time -
  %nodeIndex = skel.tree(jointIndex).parent;
  %while nodeIndex > 0
  %    rootOffset = rootOffset + skel.tree(nodeIndex).offset;
  %    nodeIndex = skel.tree(nodeIndex).parent;
  %end
  %END
  subskel.tree(IND_ROOT) = skel.tree(jointIndex);
  subskel.tree(IND_ROOT).offset = rootOffset;
  subskel.tree(IND_ROOT).orientation = skel.tree(IND_ROOT).orientation;
  %need to add in the posInd (x,y,z), setting to the original roots value
  subskel.tree(IND_ROOT).posInd = skel.tree(IND_ROOT).posInd;
else
  subskel.tree(IND_ROOT) = skel.tree(IND_ROOT);
end
%copy over position data from orig skel root to the new subskel root
if getSubChannels 
  channelIndices = [channelIndices 1:3];
  nextChanIndex = 4;
end


%Note that the rotation indices attribute, rotInd, of each bone contains
%the indices of the channel data for each DoF.

recurseTree(jointIndex, 0, true); %set parent index to the orig skel root.

  function z = recurseTree(skelIndex, subskelParentIndex, continueRecursion)
    %skelIndex - index in skel of the current node to copy.
    %subskelParentIndex - the index in subskel of this node's parent.
    if nargin < 3
      continueRecursion = true;
    end
    thisNodeIndex = newIndex;
    
    %need to re calculate the parent and child indices
    if subskelParentIndex > 0
      subskel.tree(thisNodeIndex) = skel.tree(skelIndex);
      subskel.tree(thisNodeIndex).parent = subskelParentIndex; % re-set this node's parent
    end
    if getSubChannels
      %copy the old channel data over, and update the rotInd's to the
      %new positions in the subchannels matrix.
      for i = 1:length(subskel.tree(thisNodeIndex).rotInd)
        if subskel.tree(thisNodeIndex).rotInd(i)
          channelIndices = [channelIndices  subskel.tree(thisNodeIndex).rotInd(i)];
          subskel.tree(thisNodeIndex).rotInd(i) = nextChanIndex;
          nextChanIndex = nextChanIndex + 1;
        end
      end
    end
                
    newIndex = newIndex + 1;
    numChildren = length(skel.tree(skelIndex).children);
    unblockedChildCounter = 1;
    %clear the current children copied from subskel, and recalulate the
    %new child indicies
    subskel.tree(thisNodeIndex).children = [];
    % if continueRecursion if false, recurse through the children.
    if continueRecursion
      for i = 1:numChildren
        childSkelIndex = skel.tree(skelIndex).children(i);
        if inStoplist(skel.tree(childSkelIndex).name)
          % Find children, but don't recurse through them.
          recurseFurther = false;
        else 
          recurseFurther = true;
        end
        childSubskelIndex = recurseTree(childSkelIndex, ...
                                        thisNodeIndex, ...
                                        recurseFurther);
        subskel.tree(thisNodeIndex).children(unblockedChildCounter) = ...
            childSubskelIndex;
        unblockedChildCounter = unblockedChildCounter + 1;
      end
    end
    z = thisNodeIndex; %return the id of this node, used for setting child id's on parent.
  end

  %function inStoplist
  %newRootName - the name of a joint
  %Returns 0 or 1 to indicate if jointName is in the stoplist
  function result = inStoplist(jointName)
    result = false;
    for i = 1:length(stoplist)
      if strcmp(jointName, stoplist(i))
        result = true;
        return;
      end
    end
    
  end
     
end
        
        
        



