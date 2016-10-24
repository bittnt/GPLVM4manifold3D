HGPLVM software
Version 0.1		Wednesday 14 Feb 2007 at 08:50
Copyright (c) 2007 Neil D. Lawrence

The HGPLVM toolbox is a toolbox for hierarchical visualisation with the GP-LVM, it relies on the FGPLVM code to run.


Version 0.1
-----------

First main release with two examples of human motion under the hierarchical model.

Version 0.001
-------------

Very preliminary test version, just to act as a placeholder for the toolbox.



MATLAB Files
------------

Matlab files associated with the toolbox are:

acclaim2xyzHierarchical.m: Compute XYZ values given skeleton structure and channels.
acclaimGetSubSkel.m: Gets a sub-skeleton from a larger acclaim format skeleton.
acclaimSplitHierarchy.m: Split an acclaim skeleton into a hierarchy.
demHighFive1.m: Demonstration of hierarchical GP-LVM on walking and running data.
demHighFivePrintPlot.m: Print high five results to svg file.
demRun1.m: Show visualisation of the run.
demSubskels.m: Load in the walk1 skeleton and motion capture, then break up into sub skels and learn models on each sub skel.
demSubskelsH.m: Run a given data set in the hierarchical GP-LVM.
demTemporalSamplePaths.m: Show sample paths from temporal dynamics.
demWalk1.m: Show visualisation of the walk.
demWalkRun1.m: Demonstration of hierarchical GP-LVM on walking and running data.
demWalkRunPrintPlot.m: Print the results from the walk/run experiment.
fgplvmHierarchicalVisualise.m: Visualise the manifold.
hgplvmCreate.m: Creates an HGPLVM model.
hgplvmExpandParam.m: Expand a parameter vector into an HGPLVM model.
hgplvmExtractParam.m: Extract a parameter vector from an HGPLVM model.
hgplvmGradient.m: Hierarchical GP-LVM gradient wrapper.
hgplvmHierarchicalPrintPlot.m: Print latent space for learnt model.
hgplvmHierarchicalVisualise.m: Visualise the manifold.
hgplvmLatentGradients.m: Gradients of the latent positions given parent GP-LVMs.
hgplvmLatentSpaceHandler.m: Event handler for the HGPLVM latent space.
hgplvmLogLikeGradients.m: Compute the gradients for the HGPLVM.
hgplvmLogLikelihood.m: Log-likelihood for an HGPLVM.
hgplvmObjective.m: Wrapper function for hierarchical GP-LVM objective.
hgplvmObjectiveGradient.m: Wrapper function for HGPLVM objective and gradient.
hgplvmOptimise.m: Optimise the HGPLVM.
hgplvmOptions.m: Returns an options structure for HGPLVM.
hgplvmOut.m: Give the output of the HGPLVM model.
hgplvmTest.m: Test the HGPLVM implementation.
hgplvmToolboxes.m: Load in the relevant toolboxes for hgplvm.
lvmHierarchicalScatterPlot.m: 2-D scatter plot of the latent points.
plotSubSkel.m: Plot a given sub-skeleton.
skelModifyHierarchical.m: Helper code for visualisation of skel data.
skelVisualiseHierarchical.m: For updating a skel representation of 3-D data.
testFunc.m: Handler for mouse events on the latetn space axes.
