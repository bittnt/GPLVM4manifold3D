% FGPLVM toolbox
% Version 0.161		06-Sep-2009
% Copyright (c) 2009, Neil D. Lawrence
% 
, Neil D. Lawrence
% GPDYNAMICSDISPLAY Display a GP dynamics model.
% GPREVERSIBLEDYNAMICSLOGLIKELIHOOD Give the log likelihood of the dynamics part.
% FGPLVMOPTIONS Return default options for FGPLVM model.
% FGPLVMSEQUENCELOGLIKELIHOOD Log-likelihood of a sequence for the GP-LVM.
% ROBTHREEDYNAMICSEXPANDPARAM Place the parameters vector into the model for first robot dynamics.
% FGPLVMADDCONSTRAINT Add latent constraints to FGPLVM model
% GPTIMEDYNAMICSCREATE Create the time dynamics model. 
% ROBONEDYNAMICSEXPANDPARAM Place the parameters vector into the model for first robot dynamics.
% MODELLATENTGRADIENTS Gradients of the latent variables for dynamics models in the GPLVM.
% FGPLVMCOVGRADSTEST Test the gradients of the covariance.
% GPREVERSIBLEDYNAMICSSAMP Sample from the dynamics for a given input.
% ROBTWODYNAMICSSETLATENTVALUES Set the latent values inside the model.
% FGPLVMDYNAMICSPLOT 2-D scatter plot of the latent points.
% DEMROBOTWIRELESS2 Wireless Robot data from University of Washington, without dynamics and without back constraints.
% FGPLVMLOGLIKEGRADIENTS Compute the gradients for the FGPLVM.
% ROBTHREEDYNAMICSSETLATENTVALUES Set the latent values inside the model.
% GPTIMEDYNAMICSEXPANDPARAM Place the parameters vector into the model for GP time dynamics.
% DEMVOWELS3 Model the vowels data with a 2-D FGPLVM using RBF kernel and back constraints, but without PCA initialisation.
% GPDYNAMICSSETLATENTVALUES Set the latent values inside the model.
% ROBTWODYNAMICSEXPANDPARAM Place the parameters vector into the model for first robot dynamics.
% DEMROBOTWIRELESS4 Wireless Robot data from University of Washington with dynamics and back constraints.
% DEMBRENDAN1 Use the GP-LVM to model the Frey face data with back constraints.
% DEMSTICK2 Model the stick man using an RBF kernel and dynamics.
% FGPLVMGRADIENT GP-LVM gradient wrapper.
% DEMWALKSITJOGDYNAMICSLEARN Learn the stick man dynamics.
% GPSEQUENCELOGLIKEGRADIENT Log-likelihood gradient for of a sequence of the GP-LVM.
% FGPLVMTESTMISSING Make sure missing data likelihood match full ones.
% FGPLVMCMU35ANIMATE Animate the test data jointly with predictions.
% FGPLVMPOINTLOGLIKEGRADIENT Log-likelihood gradient for of a point of the GP-LVM.
% DEMVOWELS1 Model the vowels data with a 2-D FGPLVM using RBF kernel and back constraints.
% ROBTWODYNAMICSLOGLIKELIHOOD Give the log likelihood of the robot one dynamics part.
% GPDYNAMICSLATENTGRADIENTS Gradients of the X vector given the dynamics model.
% GPDYNAMICSPOINTLOGLIKELIHOOD Compute the log likelihood of a point under the GP dynamics model.
% GPDYNAMICSCREATE Create the dynamics model. 
% FGPLVMEXPANDPARAM Expand a parameter vector into a GP-LVM model.
% ROBTWODYNAMICSLATENTGRADIENTS Gradients of the X vector given the dynamics model.
% CMDSROADDATA This script uses classical MDS to visualise some road distance data.
% FGPLVMOPTIMISEPOINT Optimise the postion of a latent point.
% DEMSTICK5 Model the stick man using an RBF kernel and regressive dynamics.
% FGPLVMSEQUENCEGRADIENT Wrapper function for gradient of a latent sequence.
% DEMOIL4 Oil data with deterministic training conditional, and MLP back constraints.
% FGPLVMTAYLORANGLEERRORS Helper function for computing angle errors for CMU 35 data.
% FGPLVMDYNAMICSRUN Runs auto regressive dynamics in a forward manner.
% FGPLVMPOINTLOGLIKELIHOOD Log-likelihood of a point for the GP-LVM.
% DEMFOURWALKS1 Model four seperate walsk using an RBF kernel and dynamics.
% FGPLVMOBJECTIVE Wrapper function for GP-LVM objective.
% DEMCMU35SEQUENCEOPTIMISE 
% FGPLVMSEQUENCEOBJECTIVE Wrapper function for objective of a single sequence in latent space and the corresponding output sequence.
% DEMROBOTWIRELESS3 Wireless Robot data from University of Washington with dynamics and no back constraints.
% FGPLVMFIELDPLOT 2-D field plot of the dynamics.
% GPDYNAMICSEXPANDPARAM Place the parameters vector into the model for GP dynamics.
% DEMCMU35GPLVMRECONSTRUCT Reconstruct right leg and body of CMU 35.
% FGPLVMREADFROMFID Load from a FID produced by the C++ implementation.
% GPTIMEDYNAMICSLOGLIKELIHOOD Give the log likelihood of GP time dynamics.
% FGPLVMVISUALISE Visualise the manifold.
% GPDYNAMICSSAMP Sample from the dynamics for a given input.
% ROBTWODYNAMICSCREATE Create the dynamics model. 
% FGPLVMCREATE Create a GPLVM model with inducing variables.
% ROBTHREEDYNAMICSDISPLAY Display the robot dynamics model. 
% GPDYNAMICSLOGLIKEGRADIENTS Gradients of the GP dynamics wrt parameters.
% DEMCMU35GPLVM4 Learn a GPLVM on CMU 35 data set.
% GPTIMEDYNAMICSLATENTGRADIENTS Gradients of the X vector given the time dynamics model.
% GPREVERSIBLEDYNAMICSDISPLAY Display a GP dynamics model.
% FGPLVMKERNDYNAMICSSAMPLE Sample a field from a given kernel.
% DEMCMU35ANIMATE Animate reconstructed right leg and body.
% ROBTHREEDYNAMICSLOGLIKELIHOOD Give the log likelihood of the robot three dynamics part.
% DEMCMU35GPLVM2 Learn a GPLVM on CMU 35 data set.
% ROBONEDYNAMICSLATENTGRADIENTS Gradients of the X vector given the dynamics model.
% ROBTHREEDYNAMICSEXTRACTPARAM Extract parameters from the robot three dynamics model.
% FGPLVMNEARESTNEIGHBOUR Give the number of errors in latent space for 1 nearest neighbour.
% ROBTWODYNAMICSEXTRACTPARAM Extract parameters from the robot two dynamics model.
% DEMSTICK1 Model the stick man using an RBF kernel.
% DEMSTICK3 Model the stick man using an RBF kernel and RBF kernel based back constraints.
% DEMCMU35GPLVMRECONSTRUCTTAYLOR Reconstruct right leg of CMU 35.
% FGPLVMTEST Test the gradients of the gpCovGrads function and the fgplvm models.
% DEMFOURWALKSRECONSTRUCT Reconstruct right leg of CMU 35.
% FGPLVMPOINTOBJECTIVEGRADIENT Wrapper function for objective and gradient of a single point in latent space and the output location..
% GPDYNAMICSSEQUENCELOGLIKELIHOOD Return the log likelihood of a given latent sequence.
% GPTIMEDYNAMICSSEQUENCELOGLIKEGRADIENT Log-likelihood gradient for of a sequence of the GP-LVM time dynamics.
% GPLVMCMU35ANIMATE Animate the test data jointly with predictions.
% DEMROBOTWIRELESS1 Wireless Robot data from University of Washington, without dynamics and without back constraints.
% FGPLVMCLASSVISUALISE Callback function for visualising data in 2-D.
% FGPLVMOBJECTIVEGRADIENT Wrapper function for FGPLVM objective and gradient.
% GPDYNAMICSEXTRACTPARAM Extract parameters from the GP dynamics model.
% FGPLVMDYNAMICSFIELDPLOT 2-D field plot of the dynamics.
% ROBONEDYNAMICSLOGLIKELIHOOD Give the log likelihood of the robot one dynamics part.
% DEMCMU35GPLVM1 Learn a GPLVM on CMU 35 data set.
% ROBTWODYNAMICSDISPLAY Display the robot dynamics model. 
% GPTIMEDYNAMICSEXTRACTPARAM Extract parameters from the GP time dynamics model.
% FGPLVMPRINTPLOT Print latent space for learnt model.
% FGPLVMPOSTERIORMEANVAR Mean and variances of the posterior at points given by X.
% ROBONEDYNAMICSDISPLAY Display the robot dynamics model. 
% FGPLVMOPTIMISESEQUENCE Optimise the postion of a latent sequence.
% DEMVOWELSLLE Model the vowels data with a 2-D FGPLVM using RBF kernel.
% DEMCMU35GPLVM3 Learn a GPLVM on CMU 35 data set.
% GPREVERSIBLEDYNAMICSEXTRACTPARAM Extract parameters from the GP reversible dynamics model.
% DEMOIL7 Oil data with variational sparse approximation.
% DEMOIL1 Oil data with fully independent training conditional.
% FGPLVMEXTRACTPARAM Extract a parameter vector from a GP-LVM model.
% DEMVOWELSISOMAP Model the vowels data with a 2-D FGPLVM using RBF kernel.
% FGPLVMDYNAMICSPOSTERIORMEANVAR Mean and variances of the posterior at points given by X.
% FGPLVMSEQUENCEOBJECTIVEGRADIENT Wrapper function for objective
% FGPLVMRESULTSDYNAMIC Load a results file and visualise them.
% FGPLVMLOADRESULT Load a previously saved result.
% FGPLVMREADFROMFILE Load a file produced by the C++ implementation.
% DEMOIL3 Oil data with deterministic training conditional.
% FGPLVMLOGLIKELIHOOD Log-likelihood for a GP-LVM.
% GPTIMEDYNAMICSLOGLIKEGRADIENTS Gradients of the GP dynamics wrt parameters.
% ROBONEDYNAMICSSETLATENTVALUES Set the latent values inside the model.
% FGPLVMADDDYNAMICS Add a dynamics kernel to the model.
% GPTIMEDYNAMICSDISPLAY Display a GP time dynamics model.
% ROBONEDYNAMICSEXTRACTPARAM Extract parameters from the robot one dynamics model.
% GPDYNAMICSSEQUENCELOGLIKEGRADIENT Log-likelihood gradient for of a sequence of the GP-LVM dynamics.
% FGPLVMVITERBISEQUENCE Viterbi align a latent sequence.
% ROBONEDYNAMICSLOGLIKEGRADIENTS Gradients of the robot one dynamics wrt parameters.
% DEMTWOCLUSTERS1
% ROBTHREEDYNAMICSLATENTGRADIENTS Gradients of the X vector given the dynamics model.
% GPREVERSIBLEDYNAMICSSETLATENTVALUES Set the latent values inside the model.
% FGPLVMDISPLAY Display an FGPLVM model.
% DEMVOWELS2 Model the vowels data with a 2-D FGPLVM using RBF kernel.
% DEMSTICKFGPLVM1 Model the stick man using an RBF kernel.
% ROBONEDYNAMICSCREATE Create the dynamics model. 
% GPTIMEDYNAMICSSETLATENTVALUES Set the latent values inside the model.
% DEMOIL6 Oil data with partially independent training conditional, and MLP back constraints.
% DEMCMU35TAYLORNEARESTNEIGHBOUR Recreate the Nearest Neighbour result from Taylor et al, NIPS 2006.
% GPTIMEDYNAMICSSEQUENCELOGLIKELIHOOD Return the log likelihood of a given latent sequence.
% DEMROBOTTRACES1 Wireless Robot data from University of Washington, with tailored dynamics.
% FGPLVMSEQUENCELOGLIKEGRADIENT Log-likelihood gradient for of a sequence of the GP-LVM.
% GPTIMEDYNAMICSOUT Evaluate the output of GPTIMEDYNAMICS.
% ROBTHREEDYNAMICSCREATE Create the dynamics model. 
% ROBTWODYNAMICSLOGLIKEGRADIENTS Gradients of the robot two dynamics wrt parameters.
% DYNAMICSTEST Run some tests on the specified dynamics model.
% ROBTHREEDYNAMICSLOGLIKEGRADIENTS Gradients of the robot three dynamics wrt parameters.
% DEMOIL5 Oil data with partially independent training conditional.
% FGPLVMBACKCONSTRAINTGRAD Gradient with respect to back constraints if present.
% DEMSTICK4 Model the stick man using an RBF kernel and 3-D latent space.
% GPREVERSIBLEDYNAMICSLATENTGRADIENTS Gradients of the X vector given the dynamics model.
% GPDYNAMICSLOGLIKELIHOOD Give the log likelihood of GP dynamics.
% GPREVERSIBLEDYNAMICSOPTIONS Return default options for GP reversible dynamics model.
% GPREVERSIBLEDYNAMICSCREATE Create a reversible dynamics model. 
% GPREVERSIBLEDYNAMICSLOGLIKEGRADIENTS Gradients of the GP reversible dynamics wrt parameters.
% DEMROBOTWIRELESSNAVIGATE Take some test data for the robot and navigate with it.
% FGPLVMPOSTERIORVAR Variances of the posterior at points given by X.
% FGPLVMPOINTGRADIENT Wrapper function for gradient of a single point.
% GPREVERSIBLEDYNAMICSEXPANDPARAM Place the parameters vector into the model for GP dynamics.
% FGPLVMPOINTSAMPLELOGLIKELIHOOD
% FGPLVMTOOLBOXES Load in the relevant toolboxes for fgplvm.
% MODELSETLATENTVALUES Set the latent variables for dynamics models in the GPLVM.
% FGPLVMDYNAMICSSAMPLE Sample a field from the GP.
% DEMOIL2 Oil data with fully independent training conditional, and MLP back constraints.
% FGPLVMPOINTOBJECTIVE Wrapper function for objective of a single point in latent space and the output location..
% FGPLVMOPTIMISE Optimise the FGPLVM.
