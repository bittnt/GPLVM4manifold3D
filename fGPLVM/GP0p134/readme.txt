GP software
Version 0.134		Tuesday 06 Oct 2009 at 17:27

The GP toolbox is an implementation of the GPs that uses the Pseudo-Input method of Snelson and Ghahramani (NIPS 2005) for sparsification as well as extensions given by Quinonero-Candela and Rasmussen (JMLR 2005).


Version 0.134
-------------

Updates to allow deconstruction of model files when writing to disk (gpWriteResult, gpLoadResult, gpDeconstruct, gpReconstruct).

Version 0.133
-------------

Updates for running a GPLVM/GP using the data's inner product matrix for Interspeech synthesis demos.

Version 0.132
-------------

Remove bug in gpExtractParam for sparse models where scale parameters were in the wrong place. Moved in some examples from the oxford toolbox. Added Titsias's variational sparse approximation.

Version 0.131
-------------

Changes to allow compatibility with SGPLVM and NCCA toolboxes.

Version 0.13
------------

Changes to allow more flexibility in optimisation of beta.

Version 0.12
------------

Various minor changes for enabling back constraints in hierarchical
GP-LVM models.

Version 0.11
------------

Changes include the use of the optimiDefaultConstraint('positive') to
obtain the function to constrain beta to be positive (which now
returns 'exp' rather than 'negLogLogit' which was previously the
default). Similarly default optimiser is now given by a command in
optimiDefaultOptimiser.

Version 0.1
-----------

The first version which is spun out of the FGPLVM toolbox. The
corresponding FGPLVM toolbox is 0.15.


MATLAB Files
------------

Matlab files associated with the toolbox are:

gpPosteriorGradMeanVar.m: Gadient of the mean and variances of the posterior at points given by X.
gpCovGradsTest.m: Test the gradients of the likelihood wrt the covariance.
gpSubspaceOut.m:
gpUpdateKernels.m: Update the kernels that are needed.
gpPointLogLikelihood.m: Log-likelihood of a test point for a GP.
demGpSample.m: Simple demonstration of sampling from a covariance function.
gpPosteriorMeanCovarTest.m: Test the gradients of the mean and covariance.
gpToolboxes.m: Load in the relevant toolboxes for GP.
demGpCovFuncSample.m: Sample from some different covariance functions.
gpObjective.m: Wrapper function for GP objective.
demSilhouetteGp1.m: Model silhouette data with independent RBF GPs.
gpComputeM.m: Compute the matrix m given the model.
gpComputeAlpha.m: Update the vector `alpha' for computing posterior mean quickly.
gpReadFromFile.m: Load a file produced by the C++ implementation.
demInterpolation.m: Demonstrate Gaussian processes for interpolation.
gpPosteriorVar.m: Variances of the posterior at points given by X.
demSpgp1dGp4.m: Do a simple 1-D regression after Snelson & Ghahramani's example.
gpScaleBiasGradient.m: Compute the log likelihood gradient wrt the scales.
demSilhouettePlot.m:
gpSubspaceExtractParam.m:
demSpgp1dPlot.m: Plot results from 1-D sparse GP.
demOptimiseGp.m: Shows that there is an optimum for the covariance function length scale.
gpSubspaceCreate.m: 
demOptimiseGpTutorial.m: Shows that there is an optimum for the covariance function length scale.
gpPosteriorSample.m: Create a plot of samples from a posterior covariance.
demSilhouettePlotTrue.m: Plot the true poses for the silhouette data.
demStickGp1.m: Demonstrate Gaussian processes for regression on stick man data.
gpUpdateAD.m: Update the representations of A and D associated with the model.
gpObjectiveGradient.m: Wrapper function for GP objective and gradient.
gpGradient.m: Gradient wrapper for a GP model.
gpExpandParam.m: Expand a parameter vector into a GP model.
gpWriteToFile.m: Write a file to be read by the C++ implementation.
gpOut.m: Evaluate the output of an Gaussian process model.
demSpgp1dGp5.m: Do a simple 1-D regression after Snelson & Ghahramani's example.
demSilhouetteAverage.m: Shows the average of the poses.
demRegression.m: Demonstrate Gaussian processes for regression.
gpLogLikelihood.m: Compute the log likelihood of a GP.
gpLoadResult.m: Load a previously saved result.
gpSample.m: Create a plot of samples from a GP.
demSilhouetteGp2.m: Model silhouette data with independent MLP GPs.
gpWriteResult.m: Write a GP result.
gpDataIndices.m: Return indices of present data.
gpLogLikeGradients.m: Compute the gradients for the parameters and X.
gpCovGrads.m: Sparse objective function gradients wrt Covariance functions for inducing variables.
gpDeconstruct.m: break GP in pieces for saving.
gpCreate.m: Create a GP model with inducing varibles/pseudo-inputs.
gpSubspaceExpandParam.m: 
gpExtractParam.m: Extract a parameter vector from a GP model.
gpSubspaceOptimise.m:
demSpgp1dGp3.m: Do a simple 1-D regression after Snelson & Ghahramani's example.
gpOptions.m: Return default options for GP model.
gpReconstruct.m: Reconstruct an GP form component parts.
gpDisplay.m: Display a Gaussian process model.
gpTest.m: Test the gradients of the gpCovGrads function and the gp models.
demGpCov2D.m: Simple demonstration of sampling from a covariance function.
gpPosteriorGradMeanCovar.m: Gadient of the mean and variances of the posterior at points given by X.
demSilhouetteLinear1.m: Model silhouette data with independent linear models.
gpPosteriorMeanCovar.m: Mean and covariances of the posterior at points given by X.
gpBlockIndices.m: Return indices of given block.
demSpgp1dGp2.m: Do a simple 1-D regression after Snelson & Ghahramani's example.
gpReadFromFID.m: Load from a FID produced by the C++ implementation.
demSpgp1dGp1.m: Do a simple 1-D regression after Snelson & Ghahramani's example.
gpPosteriorMeanVar.m: Mean and variances of the posterior at points given by X.
gpMeanFunctionGradient.m: Compute the log likelihood gradient wrt the scales.
gpOptimise.m: Optimise the inducing variable based kernel.
