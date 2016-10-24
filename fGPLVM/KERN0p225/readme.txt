KERN software
Version 0.225		Saturday 28 Nov 2009 at 16:25

Version 0.225
-------------

Updates for latest version of MULTIGP toolbox associated with MULTIGP tech report.

Version 0.224
-------------

Added disimSample and simSample for sampling from these multioutput covariance functions. Michalis added kernel types rbfard2 and linard2 which use a slightly different formulation of the ARD parameters.

Version 0.223
-------------

Minor fix of "ard" kernel which somehow had a kernel computation bit placed in the parameter initialization --- cut and past mistake at some point.

Version 0.222
-------------

Removed division by kernel variance in kernels for computing the variance of the kernel. It causes numerical problems when the variance is small. Also changed mlp kernels so that the default variance distant from the origin is 1 instead of pi/2. 

Version 0.221
-------------

Minor changes for reading in kernels
written by C++ code into files.

Version 0.22
------------

Added Wiener kernel and various kernels for multi output kernels
including white noise being propagated through the first and second
order differential equation. 


Version 0.21
------------

Compatibility changes for NCCA and SGPLVM toolboxes.

Version 0.2
-----------

Added multiKernGradX, added new kernels for diffusion processes and
2nd order differential equations.

Version 0.172
-------------

Further minor updates to kern for working with the new gpsim code
(corrected handling of white kernel in multiKern).


Version 0.171
-------------

Minor update to kernCreate to handle block kernel with differing
number of inputs for each block.

Version 0.17
------------

Further improvements on the stability of the sim kernel. Addition of
the driven input single input motif kernel (Antti Honkela) and the
modification of the multiKern type to allow each block to have a
different number of time points (Pei Gao).

Version 0.168
-------------

Found a bug in tensor gradient which meant gradients weren't being
computed correctly with respect to X when more X and X2 are both
provided as input arguments and both have length larger than 1.

Antti Honkela improved the numerial stability of the sim kernel
through judicious use of erfc.

Version 0.167
-------------

Added 'translate' kernel which allows wrapping of other kernels with a
kernel that translates the input location. Useful for moving the
non-stationarity around the input space.

Version 0.166
-------------

Added periodic version of RBF kernel (see Rasmussen and Williams pg 92
or Mackay's introduction to GPs (1998)) and periodic version of
Gibbs's non-stationary kernel (see e.g. pg 93 of Rasmussen and
Williams).

Version 0.165
-------------

Added flag which indicates whether or not a kernel is stationary. This
can be used for speeding computations (stationary kernels have a
constant diagonal). Also replaced calls to constraining functions with
'optimiDefaultConstraint' calls which return the default constraint
(making it easier for the user to change).

Version 0.163
-------------

This release removes the stubs for several KernDiagGradX.m files,
which were confusing kernDiagGradX.m, which assumes they only exist if
the function is implemented. For the kernel types 'lin', 'poly',
'mlp', and their 'ard' counter-types, these files existed but weren't
yet implemented.


Version 0.162
-------------

Added the Gibbs's non-stationary kernel, the rational quadratic kernel
and the Matern kernel with nu = 3/2 and nu = 5/2.

Version 0.161
-------------

Updated with the Single Input Motif kernel, and improved the
documentation.

Version 0.16
------------

An intermediate release with some problems.

Version 0.151
-------------
 
Added kernDiagGradient command and versions of it for rbf, white,
bias, whitefixed and rbfard code. This command improves the speed of
the fitc approximation in the FGPLVM code a lot.

Version 0.15
------------

Added tensor kernels and white noise kernels which don't return a
parameter for optimisation: 'whitefixed'. White fixed kernels were
added by Nathaniel King.

Version 0.142 Release Notes
---------------------------

Minor changes to the kernDisplay command and each command for the
relevant sub kernels. New command allows spaces to be placed in front
of the display so that the kernel can be better formated when
displayed as part of a larger model.

Also added is the kernel 'file' which is a kernel for which values are
precomputed and stored in a file.

Version 0.141 Release Notes
---------------------------

Included the kernGetVariance function for obtaining the `signal'
associated with the kernel for use with the FGPLVM toolbox.

Version 0.14 Release Notes
--------------------------

Added computation of parameter gradients with respect to sub-matrices
of the kernel matrix to allow for optimisation of inducing points.

Version 0.131 Release Notes
---------------------------

Added polynomial and polynomial ARD kernels for completeness (their
use is not recommended in Gaussian processes). Added kernReadFromFID.m
for reading in a kernel from a C++ written file.

Version 0.13 Release Notes
--------------------------

Added kernSetWhite as a helper function to set the level of white
noise in the kernel.

General Overview
----------------

This toolbox implements the different kernels. At the time of writing
two toolboxes make use of KERN, IVM vs 0.31 and FBD vs 0.2.

Interaction with the toolbox is done through the interface files which
are prefixed by kern. The toolbox is designed to allow linear
combinations of kernels with a minimum of fuss (using the cmpnd
kernel).

The toolbox was spun out of the IVM toolbox, and most of the files are
based on files in IVM 0.221.

Kernel Types
------------

Several example kernels are given:

     'ard' For backward compatability with the ard kernel in IVM 0.1. It combines linear and rbf ard kernels.

     'sqexp' For backwards compatability this is equivalent to the 'rbf' kernel in IVM 0.1.

     'mlp', 'mlpard' The multi-layer perceptron kernel from Williams' Computing with infinite networks paper. An ARD version is also provided.

     'rbf', 'rbfard' The standard radial basis function kernel and an ARD version.

     'lin', 'linard' A linear kernel and an ARD version.

     'white' Is just a white noise kernel. It is not designed to be used alone, but as an element in the compound kernel

     'bias' is for adding a bias variance term to the kernel (a positive offset) on it's own it is not a valid kernel.

     'cmpnd' The compound kernel is for creating new kernels which are linear combinations of other kernels.

The perl script for generating code for new kernels is kernelGenerator.pl

It is run with two arguments, the first is the short name for the noise model, e.g. rbf, the second is the long name, e.g. radial\ basis\ function.


MATLAB Files
------------

Matlab files associated with the toolbox are:

linard2KernExtractParam.m: Extract parameters from the LINARD2 kernel structure.
rbfperiodicKernParamInit.m: RBFPERIODIC kernel parameter initialisation.
rbfwhiteXrbfwhiteKernGradient.m: Compute a cross gradient between two
disimXsimKernCompute.m: Compute a cross kernel between DISIM and SIM kernels.
expKernExpandParam.m: Create kernel structure from EXP kernel's parameters.
whitefixedKernGradX.m: Gradient of WHITEFIXED kernel with respect to a point x.
simwhiteXrbfwhiteKernCompute.m: Compute a cross kernel between a SIM-WHITE
simwhiteXrbfwhiteKernGradient.m: Compute a cross gradient between a SIM-WHITE
disimXdisimKernGradient.m: Compute a cross gradient between two DISIM kernels.
disimKernGradient.m: Gradient of DISIM kernel's parameters.
wienerKernCompute.m: Compute the WIENER kernel given the parameters and X.
translateKernGradX.m: Gradient of TRANSLATE kernel with respect to a point x.
ratquadKernExpandParam.m: Create kernel structure from RATQUAD kernel's parameters.
sqexpKernGradient.m: Gradient of SQEXP kernel's parameters.
matern32KernCompute.m: Compute the MATERN32 kernel given the parameters and X.
mlpKernDiagGradX.m: Gradient of MLP kernel's diagonal with respect to X.
whitefixedXwhitefixedKernCompute.m: Compute a cross kernel between two WHITEFIXED kernels.
mlpardKernGradient.m: Gradient of MLPARD kernel's parameters.
lfmwhiteKernExpandParam.m: Create kernel structure from LFM-WHITE kernel's
lfmwhiteKernExtractParam.m: Extract parameters from the LFM-WHITE kernel
tensorKernDisplay.m: Display parameters of the TENSOR kernel.
disimKernExtractParam.m: Extract parameters from the DISIM kernel structure.
ggwhiteXgaussianwhiteKernGradX.m: Compute gradient between the GG white and
simSample.m: Sample from SIM kernel
gibbsperiodicKernGradient.m: Gradient of GIBBSPERIODIC kernel's parameters.
lfmwhiteXlfmwhiteKernGradient.m: Compute a cross gradient between two
lfmwhiteKernGradient.m: Gradient of LFM-WHITE kernel's parameters.
sqexpKernDiagGradX.m: Gradient of SQEXP kernel's diagonal with respect to X.
ggwhiteXggwhiteKernGradient.m: Compute a cross gradient between two GG WHITE kernels.
gibbsKernDiagCompute.m: Compute diagonal of GIBBS kernel.
ggKernExpandParam.m: Create kernel structure from GG kernel's parameters.
ouKernExtractParam.m: Extract parameters from the OU kernel structure (see
linardKernExtractParam.m: Extract parameters from the LINARD kernel structure.
lfmwhiteKernGradX.m: Gradient of LFM-WHITE kernel with respect to a point t.
gaussianwhiteKernGradient.m: Gradient of gaussian white kernel's parameters.
lfmGradientSigmaH3.m: Gradient of the function h_i(z) with respect \sigma.
disimKernParamInit.m: DISIM kernel parameter initialisation.
kernReadParamsFromFID.m: Read the kernel parameters from C++ file FID.
tensorKernGradX.m: Gradient of TENSOR kernel with respect to a point x.
rbfperiodicKernGradX.m: Gradient of RBFPERIODIC kernel with respect to a point x.
matern32KernDiagGradient.m: Compute the gradient of the MATERN32 kernel's diagonal wrt parameters.
rbfwhiteKernGradient.m: Gradient of RBF-WHITE kernel's parameters.
dexpKernExtractParam.m: Extract parameters from the double exponential's
matern32KernExpandParam.m: Create kernel structure from MATERN32 kernel's parameters.
simKernDiagCompute.m: Compute diagonal of SIM kernel.
translateKernDiagCompute.m: Compute diagonal of TRANSLATE kernel.
polyKernCompute.m: Compute the POLY kernel given the parameters and X.
matern32KernGradient.m: Gradient of MATERN32 kernel's parameters.
multiKernFixBlocks.m:
mlpKernCompute.m: Compute the MLP kernel given the parameters and X.
polyKernExpandParam.m: Create kernel structure from POLY kernel's parameters.
ggwhiteKernExpandParam.m: Create kernel structure from GG white kernel's parameters.
linKernDisplay.m: Display parameters of the LIN kernel.
kernCompute.m: Compute the kernel given the parameters and X.
lfmwhiteKernDiagCompute.m: Compute diagonal of LFM-WHITE kernel.
ggwhiteKernParamInit.m: GG WHITE kernel parameter initialisation.
tensorKernDiagGradX.m: Gradient of TENSOR kernel's diagonal with respect to X.
noneKernGradient.m: Gradient of NONE kernel's parameters.
lfmwhiteComputeGradThetaH2.m: computes a portion of the LFM-WHITE kernel's gradient w.r.t. theta.
disimXdisimKernCompute.m: Compute a cross kernel between two DISIM kernels.
ratquadKernCompute.m: Compute the RATQUAD kernel given the parameters and X.
rbfinfwhiteXwhiteKernGradient.m: Compute gradient between the RBF-WHITE kernel
mlpardKernDiagGradX.m: Gradient of MLPARD kernel's diagonal with respect to X.
ggwhiteXggwhiteKernCompute.m: Compute a cross kernel between two GG white kernels.
kernPca.m: performs KPCA.
tensorKernExtractParam.m: Extract parameters from the TENSOR kernel structure.
fileKernDiagCompute.m: Compute diagonal of FILE kernel.
expKernParamInit.m: EXP kernel parameter initialisation.
linard2KernParamInit.m: LINARD2 kernel parameter initialisation.
simKernExtractParam.m: Extract parameters from the SIM kernel structure.
mlpKernGradient.m: Gradient of MLP kernel's parameters.
matern32KernGradX.m: Gradient of MATERN32 kernel with respect to input locations.
expKernCompute.m: Compute the EXP kernel given the parameters and X.
whitefixedKernExtractParam.m: Extract parameters from the WHITEFIXED kernel structure.
polyardKernExtractParam.m: Extract parameters from the POLYARD kernel structure.
gibbsKernSetLengthScaleFunc.m: Set the length scale function of the GIBBS kernel.
ouKernDiagCompute.m: Compute diagonal of OU kernel (see ouKernCompute or
ggwhiteKernDiagCompute.m: Compute diagonal of GG WHITE kernel.
sqexpKernGradX.m: Gradient of SQEXP kernel with respect to a point x.
kernCreate.m: Initialise a kernel structure.
noneKernCompute.m: Compute the NONE kernel given the parameters and X.
mlpKernDisplay.m: Display parameters of the MLP kernel.
kernDiagGradient.m: Compute the gradient of the kernel's parameters for the diagonal.
rbfardKernGradX.m: Gradient of RBFARD kernel with respect to input locations.
ggwhiteKernCompute.m: Compute the GG white kernel given the parameters and X.
whitefixedKernCompute.m: Compute the WHITEFIXED kernel given the parameters and X.
lfmXlfmKernCompute.m: Compute a cross kernel between two LFM kernels.
whitehKernDiagGradient.m: Compute the gradient of the WHITEH kernel's diagonal wrt parameters.
simwhiteKernDiagGradX.m: Gradient of SIM-WHITE kernel's diagonal w.r.t. t.
polyKernDiagCompute.m: Compute diagonal of POLY kernel.
cmpndKernExtractParam.m: Extract parameters from the CMPND kernel structure.
biasKernDiagGradient.m: Compute the gradient of the BIAS kernel's diagonal wrt parameters.
gibbsKernDisplay.m: Display parameters of the GIBBS kernel.
componentKernReadParamsFromFID.m: Read a component based kernel from a C++ file.
lfmUpdateKernels.m: Updates the kernel representations in the LFM structure.
polyardKernExpandParam.m: Create kernel structure from POLYARD kernel's parameters.
ratquadKernDiagGradient.m: Compute the gradient of the RATQUAD kernel's diagonal wrt parameters.
rbfardKernExtractParam.m: Extract parameters from the RBFARD kernel structure.
ardKernExtractParam.m: Extract parameters from the ARD kernel structure.
tensorKernGradient.m: Gradient of TENSOR kernel's parameters.
rbfKernDiagGradient.m: Compute the gradient of the RBF kernel's diagonal wrt parameters.
linKernExpandParam.m: Create kernel structure from LIN kernel's parameters.
biasKernGradient.m: Gradient of BIAS kernel's parameters.
ratquadKernParamInit.m: RATQUAD kernel parameter initialisation.
lfmwhiteXrbfwhiteKernGradient.m: Compute a cross gradient between an LFM-WHITE
kernelCenter.m: Attempts to Center Kernel Matrix
rbfard2KernDiagGradient.m: Compute the gradient of the RBFARD2 kernel's diagonal wrt parameters.
ggXgaussianKernCompute.m: Compute a cross kernel between the GG and GAUSSIAN kernels.
whiteKernGradient.m: Gradient of WHITE kernel's parameters.
disimComputeHPrime.m: Helper function for comptuing part of the DISIM kernel.
ratquadKernGradient.m: Gradient of RATQUAD kernel's parameters.
lfmKernDiagCompute.m: Compute diagonal of LFM kernel.
mlpKernExtractParam.m: Extract parameters from the MLP kernel structure.
lfmwhiteXwhiteKernCompute.m: Compute a cross kernel between the LFM-WHITE
rbfKernGradient.m: Gradient of RBF kernel's parameters.
ratquadKernDiagGradX.m: Gradient of RATQUAD kernel's diagonal with respect to X.
simwhiteXsimwhiteKernCompute.m: Compute a cross kernel between two SIM-WHITE
lfmOptions.m: Creates a set of default options for a LFM model.
lfmGradientH.m: Gradient of the function h_i(z) with respect to some of the
lfmGradientSigmaH.m: Gradient of the function h_i(z) with respect \sigma.
rbfwhiteKernDisplay.m: Display parameters of the RBF-WHITE kernel.
whitefixedKernExpandParam.m: Create kernel structure from WHITEFIXED kernel's parameters.
simXsimKernCompute.m: Compute a cross kernel between two SIM kernels.
multiKernComputeBlock.m:
ardKernParamInit.m: ARD kernel parameter initialisation.
simKernDiagGradient.m: Compute the gradient of the SIM kernel's diagonal wrt parameters.
ggXgaussianKernGradient.m: Compute gradient between the GG and GAUSSIAN kernels.
kernSetWhite.m: Helper function to set the white noise in a kernel if it exists.
rbfardKernGradient.m: Gradient of RBFARD kernel's parameters.
rbfardKernDiagGradX.m: Gradient of RBFARD kernel's diagonal with respect to X.
ggKernParamInit.m: GG kernel parameter initialisation.
ardKernCompute.m: Compute the ARD kernel given the parameters and X.
linard2KernGradient.m: Gradient of LINARD2 kernel's parameters.
biasKernDisplay.m: Display parameters of the BIASkernel.
ggKernCompute.m: Compute the GG kernel given the parameters and X.
gibbsKernGradient.m: Gradient of GIBBS kernel's parameters.
whitehKernCompute.m: Compute the WHITEH kernel given the parameters and X.
gibbsperiodicKernExpandParam.m: Create kernel structure from GIBBSPERIODIC kernel's parameters.
wienerKernExpandParam.m: Create kernel structure from WIENER kernel's parameters.
simwhiteXrbfinfwhiteKernCompute.m: Compute a cross kernel between a SIM-WHITE
wienerKernGradX.m: Gradient of WIENER kernel with respect to a point x.
polyardKernDiagGradX.m: Gradient of POLYARD kernel's diagonal with respect to X.
rbfKernGradX.m: Gradient of RBF kernel with respect to input locations.
dexpKernExpandParam.m: Create a kernel structure from the double exponential
multiKernCompute.m: Compute the MULTI kernel given the parameters and X.
rbfard2KernCompute.m: Compute the RBFARD kernel given the parameters and X.
translateKernParamInit.m: TRANSLATE kernel parameter initialisation.
biasKernDiagCompute.m: Compute diagonal of BIAS kernel.
lfmXrbfKernGradient.m: Compute gradient between the LFM and RBF kernels.
kernDiagGradX.m: Compute the gradient of the  kernel wrt X.
disimKernExpandParam.m: Create kernel structure from DISIM kernel's parameters.
biasKernParamInit.m: BIAS kernel parameter initialisation.
biasKernDiagGradX.m: Gradient of BIAS kernel's diagonal with respect to X.
tensorKernSetIndex.m: Set the indices in the tensor kernel.
matern52KernExtractParam.m: Extract parameters from the MATERN52 kernel structure.
whitefixedKernParamInit.m: WHITEFIXED kernel parameter initialisation.
simKernDisplay.m: Display parameters of the SIM kernel.
linKernCompute.m: Compute the LIN kernel given the parameters and X.
whiteKernCompute.m: Compute the WHITE kernel given the parameters and X.
rbfwhiteXrbfwhiteKernCompute.m: Compute a cross kernel between two RBF-WHITE
linard2KernCompute.m: Compute the LINARD2 kernel given the parameters and X.
ggKernExtractParam.m: Extract parameters from the GG kernel structure.
lfmGradientH32.m: Gradient of the function h_i(z) with respect to some of the
ardKernDiagGradient.m: Compute the gradient of the ARD kernel's diagonal wrt parameters.
mlpKernParamInit.m: MLP kernel parameter initialisation.
rbfwhiteKernExtractParam.m: Extract parameters from the RBF-WHITE kernel
lfmComputeUpsilon.m: Helper function for comptuing part of the LFM kernel.
dexpKernGradient.m: Gradient of the double exponential kernel's parameters.
lfmGradientH42.m: Gradient of the function h_i(z) with respect to some of the
fileKernExpandParam.m: Create kernel structure from FILE kernel's parameters.
fileKernParamInit.m: FILE kernel parameter initialisation.
mlpardKernExtractParam.m: Extract parameters from the MLPARD kernel structure.
simKernCompute.m: Compute the SIM kernel given the parameters and X.
rbfwhiteXwhiteKernGradient.m: Compute gradient between the RBF-WHITE and
ardKernDisplay.m: Display parameters of the ARD kernel.
matern52KernDisplay.m: Display parameters of the MATERN52 kernel.
dexpKernParamInit.m: The double exponential kernel is usually called
cmpndKernDiagCompute.m: Compute diagonal of CMPND kernel.
multiKernExpandParam.m: Create kernel structure from MULTI kernel's parameters.
sqexpKernParamInit.m: SQEXP kernel parameter initialisation.
kernFactors.m: Extract factors associated with transformed optimisation space.
lfmKernGradX.m: Gradient of LFM kernel with respect to a point x.
ratquadKernDisplay.m: Display parameters of the RATQUAD kernel.
lfmwhiteXlfmwhiteKernCompute.m: Compute a cross kernel between two LFM-WHITE
disimXrbfKernGradient.m: Compute gradient between the DISIM and RBF kernels.
gibbsperiodicKernDiagGradX.m: Gradient of GIBBSPERIODIC kernel's diagonal with respect to X.
ardKernExpandParam.m: Create kernel structure from ARD kernel's parameters.
kernTest.m: Run some tests on the specified kernel.
whiteKernGradX.m: Gradient of WHITE kernel with respect to input locations.
simComputeH.m: Helper function for comptuing part of the SIM kernel.
simwhiteXsimwhiteKernGradient.m: Compute a cross gradient between two
rbfinfwhiteXrbfinfwhiteKernGradient.m: Compute a cross gradient between two
polyardKernParamInit.m: POLYARD kernel parameter initialisation.
lfmKernExpandParam.m: Create kernel structure from LFM kernel's parameters.
rbfKernExtractParam.m: Extract parameters from the RBF kernel structure.
matern52KernGradX.m: Gradient of MATERN52 kernel with respect to input locations.
kernWriteParamsToFID.m: Write the kernel parameters to a stream.
rbfperiodicKernDisplay.m: Display parameters of the RBFPERIODIC kernel.
disimKernDiagCompute.m: Compute diagonal of DISIM kernel.
linard2KernGradX.m: Gradient of LINARD2 kernel with respect to input locations.
polyardKernDisplay.m: Display parameters of the POLYARD kernel.
simComputeTest.m: Test the file simComputeH.
polyKernDiagGradX.m: Gradient of POLY kernel's diagonal with respect to X.
ggwhiteXwhiteKernCompute.m: Compute a cross kernel between a GG white and
linardKernDisplay.m: Display parameters of the LINARD kernel.
whitehKernParamInit.m: WHITEH kernel parameter initialisation.
tensorKernSlash.m: Tensor kernel created by removing ith component.
rbfinfwhiteKernExtractParam.m: Extract parameters from the RBF-WHITE kernel
rbfperiodicKernExtractParam.m: Extract parameters from the RBFPERIODIC kernel structure.
kernToolboxes.m: Load in the relevant toolboxes for kern.
simwhiteKernCompute.m: Compute the SIM-WHITE kernel given the parameters, t1
whitefixedKernDiagGradX.m: Gradient of WHITEFIXED kernel's diagonal with respect to X.
lfmwhiteKernDiagGradX.m: Gradient of LFM-WHITE kernel's diagonal w.r.t. t.
linKernGradient.m: Gradient of LIN kernel's parameters.
wienerKernGradient.m: Gradient of WIENER kernel's parameters.
ouKernDisplay.m: Display parameters of the OU kernel (see ouKernCompute or
polyKernParamInit.m: POLY kernel parameter initialisation.
lfmKernGradient.m: Gradient of LFM kernel's parameters.
rbfard2KernExtractParam.m: Extract parameters from the RBFARD2 kernel structure.
sqexpKernDiagGradient.m: Compute the gradient of the SQEXP kernel's diagonal wrt parameters.
simwhiteKernParamInit.m: SIM-WHITE kernel parameter initialisation.
ggwhiteKernExtractParam.m: Extract parameters from the GG WHITE kernel structure.
gaussianKernDiagCompute.m: Compute diagonal of gaussian kernel.
multiKernGradX.m: Gradient of MULTI kernel with respect to a point x.
lfmGradientUpsilon.m: Gradient of the function \upsilon(z) with respect to
rbfardKernDiagGradient.m: Compute the gradient of the RBFARD kernel's diagonal wrt parameters.
rbfinfwhiteKernCompute.m: Compute the RBF-WHITE kernel (with integration limits
linardKernCompute.m: Compute the LINARD kernel given the parameters and X.
sqexpKernCompute.m: Compute the SQEXP kernel given the parameters and X.
lfmKernDisplay.m: Display parameters of the LFM kernel.
gaussianwhiteKernCompute.m: Compute the covariance of the output samples 
lfmComputeH.m: Helper function for computing part of the LFM kernel.
rbfXnoneKernGradient.m: Compute a cross gradient between RBF and DUMMY
lfmExtractParam.m: Extract the parameters of an LFM model.
noneKernDiagCompute.m: Compute diagonal of NONE kernel.
fileKernRead.m: Read kernel values from file or cache.
simKernExpandParam.m: Create kernel structure from SIM kernel's parameters.
rbfperiodicKernDiagGradient.m: Compute the gradient of the RBFPERIODIC kernel's diagonal wrt parameters.
rbfard2KernGradient.m: Gradient of RBFARD2 kernel's parameters.
rbfwhiteKernExpandParam.m: Create kernel structure from RBF-WHITE kernel's
ggXgaussianKernGradX.m: Compute gradient between the GG and GAUSSIAN
linard2KernDiagGradX.m: Gradient of LINARD2 kernel's diagonal with respect to X.
tensorKernCompute.m: Compute the TENSOR kernel given the parameters and X.
gibbsKernCompute.m: Compute the GIBBS kernel given the parameters and X.
linKernParamInit.m: LIN kernel parameter initialisation.
whiteKernExpandParam.m: Create kernel structure from WHITE kernel's parameters.
ratquadKernDiagCompute.m: Compute diagonal of RATQUAD kernel.
sqexpKernExpandParam.m: Create kernel structure from SQEXP kernel's parameters.
disimKernDisplay.m: Display parameters of the DISIM kernel.
rbfard2KernExpandParam.m: Create kernel structure from RBFARD2 kernel's parameters.
gaussianKernCompute.m: Compute the Gaussian kernel given the parameters and X.
dexpKernDisplay.m: Display parameters of the double exponential kernel.
matern32KernDiagGradX.m: Gradient of MATERN32 kernel's diagonal with respect to X.
kernGetVariance.m: Get the signal associated with a the kernel.
cmpndKernGradX.m: Gradient of CMPND kernel with respect to a point x.
noneKernDisplay.m: Display parameters of the NONE kernel.
gibbsKernExpandParam.m: Create kernel structure from GIBBS kernel's parameters.
disimSample.m: Sample from SIM kernel
simKernGradX.m: Gradient of SIM kernel with respect to each time point in t1.
lfmTest.m: Test the gradients of the LFM model.
polyardKernGradient.m: Gradient of POLYARD kernel's parameters.
gibbsKernExtractParam.m: Extract parameters from the GIBBS kernel structure.
lfmwhiteComputeH.m: Helper function for computing part of the LFM-WHITE
rbfperiodicKernGradient.m: Gradient of RBFPERIODIC kernel's parameters.
lfmSample.m: Sample from LFM kernel
ouKernCompute.m: Compute the Ornstein-Uhlenbeck (OU) kernel arising from the
sqexpKernDiagCompute.m: Compute diagonal of SQEXP kernel.
ggXggKernCompute.m: Compute a cross kernel between two GG kernels.
linardKernParamInit.m: LINARD kernel parameter initialisation.
gaussianwhiteKernDiagGradX.m: Gradient of gaussian white kernel's diagonal with respect to X.
polyardKernCompute.m: Compute the POLYARD kernel given the parameters and X.
lfmComputeH4.m: Helper function for computing part of the LFM kernel.
lfmwhiteXwhiteKernGradient.m: Compute gradient between the LFM-WHITE and
lfmGradientSigmaH4.m: Gradient of the function h_i(z) with respect \sigma.
simComputeHStat.m: Helper function for computing part of the stationary version
rbfard2KernDisplay.m: Display parameters of the RBFARD2 kernel.
whitefixedKernGradient.m: Gradient of WHITEFIXED kernel's parameters.
whiteKernParamInit.m: WHITE kernel parameter initialisation.
simXsimKernGradient.m: Compute a cross gradient between two SIM kernels.
whiteXnoneKernGradient.m: Compute a cross gradient between WHITE and DUMMY kernels.
lfmKernDiagGradX.m: Gradient of LFM kernel's diagonal with respect to X.
translateKernCompute.m: Compute the TRANSLATE kernel given the parameters and X.
lfmKernDiagGradient.m: Compute the gradient of the LFM kernel's diagonal wrt parameters.
rbfperiodicKernDiagGradX.m: Gradient of RBFPERIODIC kernel's diagonal with respect to X.
whitehKernExpandParam.m: Create kernel structure from WHITEH kernel's parameters.
ardKernDiagGradX.m: Gradient of ARD kernel's diagonal with respect to X.
linardKernExpandParam.m: Create kernel structure from LINARD kernel's parameters.
whitefixedKernDisplay.m: Display parameters of the WHITEFIXED kernel.
expKernDisplay.m: Display parameters of the EXP kernel.
simwhiteXwhiteKernCompute.m: Compute a cross kernel between the SIM-WHITE
kernDisplay.m: Display the parameters of the kernel.
whitehKernGradient.m: Gradient of WHITEH kernel's parameters.
ggKernDiagCompute.m: Compute diagonal of GG kernel.
kernPriorGradient.m: Compute gradient terms associated with kernel priors.
ggXggKernGradient.m: Compute a cross gradient between two GG kernels.
lfmwhiteKernCompute.m: Compute the LFM-WHITE kernel given the parameters, t1
kernDiagCompute.m: Compute the kernel given the parameters and X.
rbfKernDisplay.m: Display parameters of the RBF kernel.
disimXrbfKernCompute.m: Compute a cross kernel between the DISIM and RBF kernels.
sqexpKernExtractParam.m: Extract parameters from the SQEXP kernel structure.
matern32KernDisplay.m: Display parameters of the MATERN32 kernel.
sparseKernDisplay.m: Display parameters of the SPARSE kernel.
mlpardKernDiagCompute.m: Compute diagonal of MLPARD kernel.
gaussianwhiteKernDiagCompute.m: Compute diagonal of gaussian white kernel.
cmpndKernExpandParam.m: Create kernel structure from CMPND kernel's parameters.
polyKernGradX.m: Gradient of POLY kernel with respect to input locations.
gibbsperiodicKernCompute.m: Compute the GIBBSPERIODIC kernel given the parameters and X.
whitehKernGradX.m: Gradient of WHITEH kernel with respect to input locations.
tensorKernDiagCompute.m: Compute diagonal of TENSOR kernel.
lfmCreate.m: Create a LFM model.
lfmGradientH41.m: Gradient of the function h_i(z) with respect to some of the
rbfinfwhiteKernDiagGradX.m: Gradient of RBF-WHITE kernel's (with integration
polyKernDisplay.m: Display parameters of the POLY kernel.
rbfinfwhiteKernGradient.m: Gradient of the parameters of the RBF-WHITE kernel
matern32KernParamInit.m: MATERN32 kernel parameter initialisation.
wienerKernExtractParam.m: Extract parameters from the WIENER kernel structure.
ouKernExpandParam.m: Create kernel structure from OU kernel's parameters
wienerKernDisplay.m: Display parameters of the WIENER kernel.
gaussianwhiteKernExpandParam.m: Create kernel structure from gaussian white 
lfmXrbfKernCompute.m: Compute a cross kernel between the LFM and RBF kernels.
rbfinfwhiteKernGradX.m: Gradient of RBF-WHITE kernel (with integration limits
whitefixedXwhitefixedKernGradient.m: Compute a cross gradient between two WHITEFIXED kernels.
lfmLogLikelihood.m: Compute the log likelihood of a LFM model.
matern52KernDiagCompute.m: Compute diagonal of MATERN52 kernel.
gaussianKernDiagGradient.m: Compute the gradient of the gaussian kernel's diagonal wrt parameters.
linard2KernDisplay.m: Display parameters of the LINARD2 kernel.
lfmKernExtractParam.m: Extract parameters from the LFM kernel structure.
gaussianKernDiagGradX.m: Gradient of gaussian kernel's diagonal with respect to X.
ouKernGradX.m: Gradient of OU kernel with respect to a point x (see
mlpardKernParamInit.m: MLPARD kernel parameter initialisation.
cmpndKernDisplay.m: Display parameters of the CMPND kernel.
rbfperiodicKernDiagCompute.m: Compute diagonal of RBFPERIODIC kernel.
wienerKernParamInit.m: WIENER kernel parameter initialisation.
expKernExtractParam.m: Extract parameters from the EXP kernel structure.
multiKernDiagGradient.m: Compute the gradient of the MULTI kernel's diagonal wrt parameters.
rbfinfwhiteKernDisplay.m: Display parameters of the RBF-WHITE kernel (with
gaussianwhiteKernExtractParam.m: Extract parameters from the gaussian white 
rbfXnoneKernCompute.m: Compute a cross kernel between RBF and NONE kernels.
lfmLogLikeGradients.m: Compute the gradients of the log likelihood of a LFM model.
ardKernDiagCompute.m: Compute diagonal of ARD kernel.
rbfard2KernDiagCompute.m: Compute diagonal of RBFARD2 kernel.
matern52KernDiagGradient.m: Compute the gradient of the MATERN52 kernel's diagonal wrt parameters.
ardKernGradX.m: Gradient of ARD kernel with respect to a point x.
matern52KernExpandParam.m: Create kernel structure from MATERN52 kernel's parameters.
computeKernel.m: Compute the kernel given the parameters and X.
multiKernTest.m: Run some tests on the multiple output block kernel.
polyardKernDiagCompute.m: Compute diagonal of POLYARD kernel.
pskernelGradient.m: Gradient on likelihood approximation for point set IVM.
kernCorrelation.m: Compute the correlation matrix kernel given the parameters and X.
fileKernDisplay.m: Display parameters of the FILE kernel.
lfmwhiteComputePsi.m: Helper function for comptuing part of the LFM-WHITE
noneKernParamInit.m: NONE kernel parameter initialisation.  
whiteKernDiagCompute.m: Compute diagonal of WHITE kernel.
cmpndKernDiagGradX.m: Gradient of CMPND kernel's diagonal with respect to X.
mlpardKernExpandParam.m: Create kernel structure from MLPARD kernel's parameters.
simwhiteXwhiteKernGradient.m: Compute gradient between the SIM-WHITE and WHITE kernels.
linKernDiagCompute.m: Compute diagonal of LIN kernel.
gaussianKernExtractParam.m: Extract parameters from the gaussian kernel structure.
multiKernDiagCompute.m: Compute diagonal of MULTI kernel.
mlpardKernGradX.m: Gradient of MLPARD kernel with respect to input locations.
matern52KernGradient.m: Gradient of MATERN52 kernel's parameters.
lfmKernCompute.m: Compute the LFM kernel given the parameters and X.
translateKernDiagGradX.m: Gradient of TRANSLATE kernel's diagonal with respect to X.
matern32KernDiagCompute.m: Compute diagonal of MATERN32 kernel.
dexpKernDiagGradX.m: Gradient of the double exponential kernel's diagonal
simwhiteKernGradient.m: Gradient of SIM-WHITE kernel's parameters.
linard2KernDiagCompute.m: Compute diagonal of LINARD2 kernel.
gibbsperiodicKernDisplay.m: Display parameters of the GIBBSPERIODIC kernel.
biasKernGradX.m: Gradient of BIAS kernel with respect to input locations.
fileKernGradX.m: Gradient of FILE kernel with respect to a point x.
gaussianKernGradX.m: Gradient of gaussian kernel with respect to input locations.
kernPriorLogProb.m: Compute penalty terms associated with kernel priors.
gibbsperiodicKernGradX.m: Gradient of GIBBSPERIODIC kernel with respect to a point x.
linKernGradX.m: Gradient of LIN kernel with respect to input locations.
componentKernWriteParamsToFID.m: Write a component based kernel to a stream.
ggwhiteXgaussianwhiteKernCompute.m: Compute a cross kernel between the GG white and GAUSSIAN white kernels.
whitehKernDiagCompute.m: Compute diagonal of WHITEH kernel.
linardKernDiagCompute.m: Compute diagonal of LINARD kernel.
rbfperiodicKernCompute.m: Compute the RBFPERIODIC kernel given the parameters and X.
tensorKernDiagGradient.m: Compute the gradient of the TENSOR kernel's diagonal wrt parameters.
mlpKernGradX.m: Gradient of MLP kernel with respect to input locations.
cmpndKernSetIndex.m: Set the indices in the compound kernel.
expKernDiagGradX.m: Gradient of EXP kernel's diagonal with respect to X.
lfmwhiteKernParamInit.m: LFM-WHITE kernel parameter initialisation.
cmpndKernParamInit.m: CMPND kernel parameter initialisation.
rbfwhiteKernParamInit.m: RBF-WHITE kernel parameter initialisation. The RBF-
whiteXwhiteKernGradX.m:
disimKernDiagGradX.m: Gradient of DISIM kernel's diagonal with respect to X.
rbfKernCompute.m: Compute the RBF kernel given the parameters and X.
rbfard2KernGradX.m: Gradient of RBFARD2 kernel with respect to input locations.
biasKernExpandParam.m: Create kernel structure from BIAS kernel's parameters.
matern32KernExtractParam.m: Extract parameters from the MATERN32 kernel structure.
rbfardKernDisplay.m: Display parameters of the RBFARD kernel.
polyKernExtractParam.m: Extract parameters from the POLY kernel structure.
ardKernGradient.m: Gradient of ARD kernel's parameters.
multiKernGradient.m: Gradient of MULTI kernel's parameters.
rbfinfwhiteXrbfinfwhiteKernCompute.m: Compute a cross kernel between two
lfmKernParamInit.m: LFM kernel parameter initialisation. The latent force
rbfinfwhiteKernParamInit.m: The RBF-WHITE-INF kernel is a convolutional
cmpndKernCompute.m: Compute the CMPND kernel given the parameters and X.
ggwhiteKernDisplay.m: Display parameters of the GG WHITE kernel.
multiKernParamInit.m: MULTI kernel parameter initialisation.
disimXsimKernGradient.m: Compute gradient between the DISIM and SIM kernels.
whitefixedKernDiagGradient.m: Compute the gradient of the WHITEFIXED kernel's diagonal wrt parameters.
simKernGradient.m: Gradient of SIM kernel's parameters.
noneKernGradX.m: Gradient of NONE kernel with respect to a point x.
disimKernGradX.m: Gradient of DISIM kernel with respect to a point x.
mlpardKernCompute.m: Compute the MLPARD kernel given the parameters and X.
whitefixedKernDiagCompute.m: Compute diagonal of WHITEFIXED kernel.
kernWriteToFID.m: Load from an FID written by the C++ implementation.
whiteKernExtractParam.m: Extract parameters from the WHITE kernel structure.
gibbsperiodicKernDiagCompute.m: Compute diagonal of GIBBSPERIODIC kernel.
rbfinfwhiteKernDiagCompute.m: Compute diagonal of RBF-WHITE kernel (with
dexpKernDiagCompute.m: Compute diagonal of the double exponential kernel.
simwhiteKernExtractParam.m: Extract parameters from the SIM-WHITE kernel
disimKernCompute.m: Compute the DISIM kernel given the parameters and X.
kernGradient.m: Compute the gradient wrt the kernel's parameters.
rbfKernParamInit.m: RBF kernel parameter initialisation.
whiteXrbfKernGradient.m: Compute a cross gradient between WHITE and RBF kernels.
whiteXnoneKernCompute.m: Compute a cross kernel between WHITE and NONE kernels.
simwhiteKernExpandParam.m: Create kernel structure from SIM-WHITE kernel's
wienerKernDiagCompute.m: Compute diagonal of WIENER kernel.
kernExtractParam.m: Extract parameters from kernel structure.
gibbsperiodicKernDiagGradient.m: Compute the gradient of the GIBBSPERIODIC kernel's diagonal wrt parameters.
simXrbfKernGradient.m: Compute gradient between the SIM and RBF kernels.
ouKernDiagGradX.m: Gradient of OU kernel's diagonal with respect to t (see
multiKernCacheBlock.m:
mlpardKernDisplay.m: Display parameters of the MLPARD kernel.
simwhiteXrbfinfwhiteKernGradient.m: Compute a cross gradient between a
rbfwhiteXwhiteKernCompute.m: Compute a cross kernel between the RBF-WHITE
rbfwhiteKernGradX.m: Gradient of RBF-WHITE kernel with respect to a point t.
expKernGradient.m: Gradient of EXP kernel's parameters.
lfmComputeH3.m: Helper function for computing part of the LFM kernel.
rbfwhiteKernCompute.m: Compute the RBF-WHITE kernel given the parameters, t1
tensorKernParamInit.m: TENSOR kernel parameter initialisation.
gaussianKernDisplay.m: Display parameters of the GAUSSIAN kernel.
lfmGradientSigmaUpsilon.m: Gradient of the function \upsilon(z) with respect
gaussianwhiteKernParamInit.m: Gaussian white kernel parameter initialisation.
whiteXwhiteKernGradient.m: Compute a cross gradient between two WHITE kernels.
tensorKernExpandParam.m: Create kernel structure from TENSOR kernel's parameters.
ratquadKernGradX.m: Gradient of RATQUAD kernel with respect to input locations.
ggKernDisplay.m: Display parameters of the GG kernel.
rbfperiodicKernExpandParam.m: Create kernel structure from RBFPERIODIC kernel's parameters.
ouKernGradient.m: Gradient of OU kernel's parameters (see ouKernCompute or
gibbsKernParamInit.m: GIBBS kernel parameter initialisation.
kernParamInit.m: Kernel parameter initialisation.
simwhiteKernGradX.m: Gradient of SIM-WHITE kernel with respect to a point t.
rbfinfwhiteXwhiteKernCompute.m: Compute a cross kernel between the RBF-WHITE
dexpKernGradX.m: Gradient of the double exponential kernel with respect to a
ggwhiteXgaussianwhiteKernGradient.m: Compute gradient between the GG white
rbfard2KernParamInit.m: RBFARD2 kernel parameter initialisation.
translateKernExpandParam.m: Create kernel structure from TRANSLATE kernel's parameters.
ggwhiteXwhiteKernGradient.m: Compute gradient between the GGWHITE and WHITE kernels.
gaussianKernExpandParam.m: Create kernel structure from gaussian kernel's parameters.
multiKernGradientBlock.m:
translateKernGradient.m: Gradient of TRANSLATE kernel's parameters.
simXrbfKernCompute.m: Compute a cross kernel between the SIM and RBF kernels.
matern52KernParamInit.m: MATERN52 kernel parameter initialisation.
matern52KernCompute.m: Compute the MATERN52 kernel given the parameters and X.
biasKernExtractParam.m: Extract parameters from the BIAS kernel structure.
rbfard2KernDiagGradX.m: Gradient of RBFARD2 kernel's diagonal with respect to X.
multiKernDiagGradX.m: Gradient of MULTI kernel's diagonal with respect to X.
whiteKernDiagGradX.m: Gradient of WHITE kernel's diagonal with respect to X.
translateKernDisplay.m: Display parameters of the TRANSLATE kernel.
simKernParamInit.m: SIM kernel parameter initialisation.
fileKernGradient.m: Gradient of FILE kernel's parameters.
rbfardKernCompute.m: Compute the RBFARD kernel given the parameters and X.
whitehKernExtractParam.m: Extract parameters from the WHITEH kernel structure.
ggwhiteKernGradient.m: Gradient of GG WHITE kernel's parameters.
kernReadFromFID.m: Load from an FID written by the C++ implementation.
disimKernDiagGradient.m: Compute the gradient of the DISIM kernel's diagonal wrt parameters.
disimComputeH.m: Helper function for comptuing part of the DISIM kernel.
ggKernGradient.m: Gradient of GG kernel's parameters.
mlpKernDiagCompute.m: Compute diagonal of MLP kernel.
rbfardKernExpandParam.m: Create kernel structure from RBFARD kernel's parameters.
kernSetIndex.m: Set the indices on a compound kernel.
expKernGradX.m: Gradient of EXP kernel with respect to a point x.
gaussianKernGradient.m: Gradient of gaussian kernel's parameters.
rbfwhiteKernDiagGradX.m: Gradient of RBF-WHITE kernel's diagonal w.r.t. t.
lfmwhiteComputeGradThetaH1.m: computes a portion of the LFM-WHITE kernel's gradient w.r.t. theta.
lfmwhiteKernDisplay.m: Display parameters of the LFM-WHITE kernel.
lfmExpandParam.m: Expand the given parameters into a LFM structure.
linKernDiagGradX.m: Gradient of LIN kernel's diagonal with respect to X.
linardKernDiagGradX.m: Gradient of LINARD kernel's diagonal with respect to X.
rbfwhiteKernDiagCompute.m: Compute diagonal of RBF-WHITE kernel.
simKernDiagGradX.m: Gradient of SIM kernel's diagonal with respect to the
whitehKernDisplay.m: Display parameters of the WHITEH kernel.
expKernDiagCompute.m: Compute diagonal of EXP kernel.
lfmComputeTest.m: Test the file lfmComputeH.
kernGradX.m: Compute the gradient of the kernel wrt X.
fileKernExtractParam.m: Extract parameters from the FILE kernel structure.
linardKernGradient.m: Gradient of LINARD kernel's parameters.
gaussianKernParamInit.m: Gaussian kernel parameter initialisation.
polyKernGradient.m: Gradient of POLY kernel's parameters.
simwhiteKernDiagCompute.m: Compute the diagonal of the SIM-WHITE kernel.
rbfKernDiagGradX.m: Gradient of RBF kernel's diagonal with respect to X.
multiKernExtractParam.m: Extract parameters from the MULTI kernel structure.
noneKernExtractParam.m: Extract parameters from the NONE kernel structure.
rbfardKernParamInit.m: RBFARD kernel parameter initialisation.
whiteXwhiteKernCompute.m: Compute a cross kernel between two WHITE kernels.
ratquadKernExtractParam.m: Extract parameters from the RATQUAD kernel structure.
gibbsperiodicKernExtractParam.m: Extract parameters from the GIBBSPERIODIC kernel structure.
linard2KernExpandParam.m: Create kernel structure from LINARD2 kernel's parameters.
sqexpKernDisplay.m: Display parameters of the SQEXP kernel.
biasKernCompute.m: Compute the BIAS kernel given the parameters and X.
rbfinfwhiteKernExpandParam.m: Create kernel structure from RBF-WHITE kernel's
lfmwhiteXrbfwhiteKernCompute.m: Compute a cross kernel between an LFM-WHITE
cmpndKernGradient.m: Gradient of CMPND kernel's parameters.
gaussianwhiteKernDisplay.m: Display parameters of the GAUSSIAN white kernel.
noneKernDiagGradX.m: Gradient of NONE kernel's diagonal with respect to X.
gaussianwhiteKernDiagGradient.m: Compute the gradient of the gaussian white 
fileKernCompute.m: Compute the FILE kernel given the parameters and X.
noneKernExpandParam.m: Create kernel structure from NONE kernel's parameters.
matern52KernDiagGradX.m: Gradient of MATERN52 kernel's diagonal with respect to X.
gibbsKernGradX.m: Gradient of GIBBS kernel with respect to input locations.
cmpndKernDiagGradient.m: Compute the gradient of the CMPND kernel's diagonal wrt parameters.
gibbsKernDiagGradient.m: Compute the gradient of the GIBBS kernel's diagonal wrt parameters.
mlpKernExpandParam.m: Create kernel structure from MLP kernel's parameters.
simwhiteKernDisplay.m: Display parameters of the SIM-WHITE kernel.
translateKernExtractParam.m: Extract parameters from the TRANSLATE kernel structure.
gibbsperiodicKernParamInit.m: GIBBSPERIODIC kernel parameter initialisation.
lfmGradientH31.m: Gradient of the function h_i(z) with respect to some of the
ouKernParamInit.m: Ornstein-Uhlenbeck (OU) kernel parameter initialisation.
lfmXlfmKernGradient.m: Compute a cross gradient between two LFM kernels.
kernExpandParam.m: Expand parameters to form a kernel structure.
dexpKernCompute.m: Compute the double exponential kernel,
whiteKernDisplay.m: Display parameters of the WHITE kernel.
wienerKernDiagGradX.m: Gradient of WIENER kernel's diagonal with respect to X.
rbfKernDiagCompute.m: Compute diagonal of RBF kernel.
whitehKernDiagGradX.m: Gradient of WHITEH kernel's diagonal with respect to X.
multiKernDisplay.m: Display parameters of the MULTI kernel.
whiteKernDiagGradient.m: Compute the gradient of the WHITE kernel's diagonal wrt parameters.
gibbsKernDiagGradX.m: Gradient of GIBBS kernel's diagonal with respect to X.
pskernelObjective.m: Likelihood approximation for point set IVM.
rbfardKernDiagCompute.m: Compute diagonal of RBFARD kernel.
linKernExtractParam.m: Extract parameters from the LIN kernel structure.
multiKernGradientBlockX.m:
rbfKernExpandParam.m: Create kernel structure from RBF kernel's parameters.
polyardKernGradX.m: Gradient of POLYARD kernel with respect to input locations.
gaussianwhiteKernGradX.m: Gradient of gaussian white kernel with respect 
linardKernGradX.m: Gradient of LINARD kernel with respect to input locations.
