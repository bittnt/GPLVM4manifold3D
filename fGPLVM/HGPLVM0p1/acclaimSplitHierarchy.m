function [tree, visualiseNodes, dependencyVisData] = acclaimSplitHierarchy(skel)

% ACCLAIMSPLITHIERARCHY Split an acclaim skeleton into a hierarchy.
%
%	Description:
%	DESC Runs a given data set with the hierarchical GP-LVM.
%	ARG skel : The acclaim skeleton structure to split.
%	RETURN tree : the tree structure for the hierarchy split.
%	RETURN visualiseNodes : the data structure needed for
%	visualisation.
%	RETURN dependencyVisData :
%	
%	
%
%	See also
%	ACCLAIMGETSUBSKEL


%	Copyright (c) Neil D. Lawrence, 2006 Andrew Moore
% 	acclaimSplitHierarchy.m version 1.1



% data structure for dependencies between same joints in
% different nodes.
dependencyVisData = [];


% Define the hierarchy.
visualiseNodes(9).name = 'skeleton';
tree(9).parent =[];
%define the abdomen as the first child as its position will affect the
%upper body (hack for now).
tree(9).children = [7, 6, 8];
visualiseNodes(9).model = [];
visualiseNodes(9).labels = [];
visualiseNodes(9).padding = [];

visualiseNodes(8).name = 'upper body';
tree(8).children = [5, 4, 3];
visualiseNodes(8).model = [];

visualiseNodes(7).name = 'abdomen';
tree(7).children = [];
visualiseNodes(7).model = [];
[visualiseNodes(7).subskel tree(7).featureInd] = acclaimGetSubSkel(skel, ...
    'root', {}, {'lclavicle', 'rclavicle', 'lowerneck', 'lhipjoint', ...
                'rhipjoint'});

visualiseNodes(6).name = 'legs';
tree(6).children = [2, 1];
visualiseNodes(6).model = [];

% visualiseNodes(7).name = 'left hand';
% tree(7).children = [];
% visualiseNodes(7).model = [];
% [visualiseNodes(7).subskel tree(7).featureInd] = acclaimGetSubSkel(skel, ...
%     'lwrist');

visualiseNodes(5).name = 'left arm';
tree(5).children = [];
visualiseNodes(5).model = [];
[visualiseNodes(5).subskel tree(5).featureInd] = acclaimGetSubSkel(skel, ...
    'lclavicle', {}, {'lwrist'});


visualiseNodes(4).name = 'head';
tree(4).children = [];
visualiseNodes(4).model = [];
[visualiseNodes(4).subskel tree(4).featureInd] = acclaimGetSubSkel(skel, ...
    'lowerneck');

% visualiseNodes(4).name = 'right hand';
% tree(4).children = [];
% visualiseNodes(4).model = [];
% [visualiseNodes(4).subskel tree(4).featureInd] = acclaimGetSubSkel(skel, ...
%     'rwrist');

visualiseNodes(3).name = 'right arm';
tree(3).children = [];
visualiseNodes(3).model = [];
[visualiseNodes(3).subskel tree(3).featureInd] = acclaimGetSubSkel(skel, ...
    'rclavicle',  {}, {'rwrist'});

visualiseNodes(2).name = 'left leg';
tree(2).children = [];
visualiseNodes(2).model = [];
[visualiseNodes(2).subskel tree(2).featureInd] = acclaimGetSubSkel(skel, ...
    'lhipjoint',  {}, {'lfoot'});

visualiseNodes(1).name = 'right leg';
tree(1).children = [];
visualiseNodes(1).model = [];
[visualiseNodes(1).subskel tree(1).featureInd] = acclaimGetSubSkel(skel, ...
                                                  'rhipjoint', ...
                                                  {}, {'rfoot'});

% Add in the parents
tree = treeFindParents(tree);

%set up dependencies
setDependency('lclavicle', 7); %abdomen controls the thorax.
setDependency('rclavicle', 7); %abdomen controls the thorax.
setDependency('lowerneck', 7); %abdomen controls the thorax.
setDependency('lhipjoint', 7); %abdomen controls lhipjoint
setDependency('rhipjoint', 7); %abdomen controls rhipjoint
%setDependency('rwrist', 3); % Right arm controls right wrist.
%setDependency('lwrist', 5); % Left arm controls left wrist.

  function setDependency(jointName, masterNodeIndex)
    ind = length(dependencyVisData);
    dependencyVisData(ind+1).xyz = [];
    dependencyVisData(ind+1).rot = [];
    dependencyVisData(ind+1).name = jointName;
    dependencyVisData(ind+1).masterNodeIndex = masterNodeIndex;
    dependencyVisData(ind+1).dependents = [];
    %error test
    skelReverseLookup(visualiseNodes(masterNodeIndex).subskel, jointName);
    for i = 1:length(tree)
      if (~isempty(visualiseNodes(i).subskel))
        for j = 1:length(visualiseNodes(i).subskel.tree)
          if strcmp(visualiseNodes(i).subskel.tree(j).name, jointName) && ...
                i ~= masterNodeIndex
            dependencyVisData(ind+1).dependents = [ ...
                dependencyVisData(ind+1).dependents, i];
          end
        end
      end
    end
                
  end

end
