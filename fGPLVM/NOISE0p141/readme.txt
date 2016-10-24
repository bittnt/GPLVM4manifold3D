NOISE software
Version 0.141		Tuesday 06 Oct 2009 at 17:28

Version 0.141 Release Notes
---------------------------

Added noiseReadFromFile and noiseReadFromFID for compatability with CPP releases.

Version 0.14 Release Notes
--------------------------

Much improved documentation and merging of NCNM noise model into this toolbox from the NCNM toolbox.

Version 0.131 Release Notes
---------------------------

There was a sign error in lnDiffCumGaussian and a corresponding sign error in orderedLogLikelihood. This has now been fixed.


Version 0.13 Release Notes
--------------------------

This code no longer runs under MATLAB 6.0. It now requires MATLAB 7.0 or higher to run. 

Version 0.121 Release Notes
---------------------------

Included a `scale' noise type for use with the GPLVM which allows for scaling the outputs on the GPLVM. This noise model is not designed for normal use with the IVM.

Added noiseReadFromFID.m for reading a noise model from a file written by the C++ code.

Version 0.12 Release Notes
--------------------------

This toolbox implements different noise models for the IVM toolbox from version 0.31.

Interaction with the toolbox is done through the interface files which are prefixed by `noise'. 

The toolbox was spun out of the IVM toolbox, and most of the files are based on files in IVM 0.221.

Noise Types
-----------

Three main noise models are also provided:

      'gaussian' is the standard Gaussian noise model.

      'probit' is the probit model for classification.

      'ordered' is an ordered categorical model based on the probit.

Also there is

      'cmpnd' is for associating different noise models to different processes when learning multiple processes together. The ability to learn multiple processes is mainly included so that the next release of GPLVM code can use this IVM code base, but it may also be useful for multi-class classification noise models.

      'mgaussian' which is designed to allow multiple processes to have individually different variances (mainly for the GPLVM).

The perl script for generating code for new noise models is noiseGenerator.pl

It is run with two arguments, the first is the short name for the noise model, e.g. gaussian, the second is the long name, e.g. Gaussian\ noise\ model.


MATLAB Files
------------

Matlab files associated with the toolbox are:

ngaussNoiseLikelihood.m: Likelihood of the data under the NGAUSS noise model.
noiseUpdateNuG.m: Update nu and g for a given noise model.
orderedNoiseLikelihood.m: Likelihood of the data under the ORDERED noise model.
probit3dPlot.m: Draw a 3D or contour plot for the probit.
gaussianNoiseExtractParam.m: Extract parameters from the GAUSSIAN noise structure.
gaussianNoisePointPlot.m: Plot the data-points for the GAUSSIAN noise model.
probitNoiseLikelihood.m: Likelihood of the data under the PROBIT noise model.
cmpndNoise3dPlot.m: Draws a 3D or contour plot for the CMPND noise model.
negNoiseGradientParam.m: Wrapper function for calling noise gradients.
noiseExpandParam.m: Expand the noise model's parameters from params vector.
orderedNoiseParamInit.m: ORDERED noise parameter initialisation.
mgaussianNoiseExpandParam.m: Create noise structure from MGAUSSIAN noise's parameters.
cmpndNoisePointPlot.m: Plot the data-points for the CMPND noise model.
cmpndNoiseExtractParam.m: Extract parameters from the CMPND noise structure.
cmpndNoiseLogLikelihood.m: Log likelihood of the data under the CMPND noise model.
noiseOut.m: Give the output of the noise model given the mean and variance.
noisePointPlot.m: Plot the data-points for the given noise model.
ngaussNoiseExtractParam.m: Extract parameters from the NGAUSS noise structure.
probitNoiseExpandParam.m: Create noise structure from PROBIT noise's parameters.
ncnmNoiseDisplay.m: Display  parameters from null category noise model.
ncnmNoiseNuG.m: Update nu and g parameters associated with null category noise model.
probitNoiseExtractParam.m: Extract parameters from the PROBIT noise structure.
mgaussianNoisePointPlot.m: Plot the data-points for the MGAUSSIAN noise model.
orderedNoiseDisplay.m: Display parameters of the ORDERED noise.
cmpndNoiseOut.m: Compute the output of the CMPND noise given the input mean and variance.
scaleNoiseDisplay.m: Display the parameters of the scaled noise model.
ncnmNoiseLogLikelihood.m: Log-likelihood of data under null category noise model.
probitNoiseDisplay.m: Display parameters of the PROBIT noise.
probitNoiseOut.m: Compute the output of the PROBIT noise given the input mean and variance.
orderedNoiseUpdateParams.m: Update parameters for ordered categorical noise model.
scaleNoiseSites.m: Site updates for Scale noise model.
noiseLikelihood.m: Return the likelihood for each point under the noise model.
negNoiseLogLikelihood.m: Wrapper function for calling noise likelihoods.
ngaussNoise3dPlot.m: Draws a 3D or contour plot for the NGAUSS noise model.
gaussianNoiseParamInit.m: GAUSSIAN noise parameter initialisation.
noiseTest.m: Run some tests on the specified noise model.
ngaussNoiseSites.m: Site updates for noiseless Gaussian noise model.
scaleNoiseOut.m: A simple noise model that scales and centres the data.
noiseUpdateSites.m: Update site parameters for a given noise model.
noiseWriteToFID.m: Load from an FID written by the C++ implementation.
ncnmNoiseLikelihood.m: Likelihood of data under null category noise model.
ncnmNoiseExpandParam.m: Expand null category noise model's structure from param vector.
gaussianNoiseLogLikelihood.m: Log likelihood of the data under the GAUSSIAN noise model.
scaleNoiseExpandParam.m: Expand Scale noise structure from param vector.
mgaussianNoiseGradientParam.m: Gradient of MGAUSSIAN noise's parameters.
gaussianNoiseOut.m: Compute the output of the GAUSSIAN noise given the input mean and variance.
mgaussianNoiseLikelihood.m: Likelihood of the data under the MGAUSSIAN noise model.
noiseWriteParamsToFID.m: Write the noise parameters to a stream.
cmpndNoiseDisplay.m: Display parameters of the CMPND noise.
noiseReadParamsFromFID.m: Read the noise parameters from C++ file FID.
cmpndNoiseLikelihood.m: Likelihood of the data under the CMPND noise model.
gaussianNoiseLikelihood.m: Likelihood of the data under the GAUSSIAN noise model.
probitNoisePointPlot.m: Plot the data-points for the PROBIT noise model.
gaussianNoiseGradientParam.m: Gradient of GAUSSIAN noise's parameters.
probitNoiseLogLikelihood.m: Log likelihood of the data under the PROBIT noise model.
gaussianNoiseSites.m: Update the site parameters for the GAUSSIAN noise mode.
mgaussianNoiseExtractParam.m: Extract parameters from the MGAUSSIAN noise structure.
ngaussNoiseExpandParam.m: Create noise structure from NGAUSS noise's parameters.
noiseExpectationLogLikelihood.m: Return the expectation of the log likelihood.
ngaussNoiseOut.m: Compute the output of the NGAUSS noise given the input mean and variance.
gaussianNoiseExpandParam.m: Create noise structure from GAUSSIAN noise's parameters.
ngaussNoiseLogLikelihood.m: Log likelihood of the data under the NGAUSS noise model.
mgaussianNoiseLogLikelihood.m: Log likelihood of the data under the MGAUSSIAN noise model.
gaussianNoiseDisplay.m: Display parameters of the GAUSSIAN noise.
orderedNoisePointPlot.m: Plot the data-points for the ORDERED noise model.
probitNoiseGradientParam.m: Gradient of PROBIT noise's parameters.
cmpndNoiseParamInit.m: CMPND noise parameter initialisation.
ncnmNoiseGradVals.m: Compute gradient with respect to inputs to noise model.
orderedNoiseGradientParam.m: Gradient of ORDERED noise's parameters.
ncnmNoiseOut.m: Ouput from null category noise model.
noiseCreate.m: Initialise a noise structure.
orderedNoiseGradVals.m: Gradient of ORDERED noise log Z with respect to input mean and variance.
gaussianNoiseGradVals.m: Gradient of GAUSSIAN noise log Z with respect to input mean and variance.
mgaussianNoiseParamInit.m: MGAUSSIAN noise parameter initialisation.
ngaussNoisePointPlot.m: Plot the data-points for the NGAUSS noise model.
orderedNoise3dPlot.m: Draws a 3D or contour plot for the ORDERED noise model.
noise3dPlot.m: Draw a 3D or contour plot for the relevant noise model.
ncnmNoiseGradientParam.m: Gradient of parameters for NCNM.
cmpndNoiseExpandParam.m: Create noise structure from CMPND noise's parameters.
noiseGradX.m: Returns the gradient of the log-likelihood wrt x.
orderedNoiseExtractParam.m: Extract parameters from the ORDERED noise structure.
ncnmNoiseParamInit.m: null category noise model's parameter initialisation.
ngaussNoiseNuG.m: Update nu and g parameters associated with noiseless Gaussian noise model.
probitNoiseParamInit.m: PROBIT noise parameter initialisation.
ncnmNoiseExtractParam.m: Extract parameters from null category noise model.
ncnmNoise3dPlot.m: Draw a 3D or contour plot for the NCNM noise model.
gaussianNoiseNuG.m: Compute nu and g for GAUSSIAN noise model.
probitNoise3dPlot.m: Draws a 3D or contour plot for the PROBIT noise model.
noiseGradientParam.m: Gradient wrt the noise model's parameters.
noiseDisplay.m: Display the parameters of the noise model.
mgaussianNoise3dPlot.m: Draws a 3D or contour plot for the MGAUSSIAN noise model.
cmpndNoiseGradVals.m: Gradient of CMPND noise log Z with respect to input mean and variance.
noiseReadFromFID.m: Load from an FID written by the C++ implementation.
gaussianNoise3dPlot.m: Draws a 3D or contour plot for the GAUSSIAN noise model.
ngaussNoiseParamInit.m: NGAUSS noise parameter initialisation.
scaleNoiseParamInit.m: Scale noise model's parameter initialisation.
noiseLogLikelihood.m: Return the log-likelihood under the noise model.
cmpndNoiseGradientParam.m: Gradient of CMPND noise's parameters.
ncnmNoiseSites.m: Site updates for null category model.
probitNoiseGradVals.m: Gradient of PROBIT noise log Z with respect to input mean and variance.
ncnmNoisePointPlot.m: Plot the data-points for null category noise model.
noiseExtractParam.m: Extract the noise model's parameters.
ngaussNoiseGradVals.m: Gradient of NGAUSS noise log Z with respect to input mean and variance.
orderedNoiseLogLikelihood.m: Log likelihood of the data under the ORDERED noise model.
cmpndNoiseNuG.m:  Update nu and g parameters associated with compound noise model.
orderedNoiseOut.m: Compute the output of the ORDERED noise given the input mean and variance.
ngaussNoiseGradientParam.m: Gradient of NGAUSS noise's parameters.
orderedGradX.m: Gradient wrt x of log-likelihood for Ordered categorical model.
mgaussianNoiseDisplay.m: Display parameters of the MGAUSSIAN noise.
noiseGradVals.m: Gradient of noise model wrt mu and varsigma.
orderedNoiseExpandParam.m: Create noise structure from ORDERED noise's parameters.
noiseParamInit.m: Noise model's parameter initialisation.
mgaussianNoiseOut.m: Compute the output of the MGAUSSIAN noise given the input mean and variance.
cmpndNoiseSites.m: Site updates for compound noise model.
mgaussianNoiseGradVals.m: Gradient of MGAUSSIAN noise log Z with respect to input mean and variance.
ngaussNoiseDisplay.m: Display parameters of the NGAUSS noise.
