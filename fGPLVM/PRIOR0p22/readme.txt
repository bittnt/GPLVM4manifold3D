PRIOR software
Version 0.22		Friday 17 Apr 2009 at 17:43

This toolbox allows priors to be placed over parameters, at the moment this is used so that MAP solutions can be found for the parameters rather than type-II maximum likelihood. The priors were written for the Null Category Noise Model (see NCNM toolbox) so that an exponential prior could be placed over the process variances. The rest of its functionality has not been tested, so use with care.


Version 0.132
-------------

Minor changes for reading in prior distributions from C++ written files.

Version 0.131
-------------

There was a sign error in lnDiffCumGaussian, and a corresponding sign error in the normal uniform prior, this has now been fixed.


MATLAB Files
------------

Matlab files associated with the toolbox are:

gaussianPriorExpandParam.m: Expand Gaussian prior structure from param vector.
normuniPriorExtractParam.m: Extract params from normal uniform prior structure.
laplacePriorExtractParam.m: Extract params from Laplace prior structure.
priorToolboxes.m: Load in the relevant toolboxes for kern.
gammaPriorGradient.m: Gradient wrt x of the gamma prior.
priorLogProb.m: Log probability of given prior.
normuniPriorExpandParam.m: Expand Normal uniform prior structure from param vector.
gaussianPriorExtractParam.m: Extract params from Gaussian prior structure.
priorParamInit.m: Prior model's parameter initialisation.
gaussianPriorLogProb.m: Log probability of Gaussian prior.
gammaPriorParamInit.m: Gamma prior model's parameter initialisation.
normuniPriorLogProb.m: Log probability of a normal uniform.
wangPriorLogProb.m: Log probability of Wang prior.
laplacePriorParamInit.m: Laplace prior model's parameter initialisation.
normuniPriorParamInit.m: Normal uniform prior model's parameter initialisation.
laplacePriorExpandParam.m: Expand Laplace prior structure from param vector.
gammaPriorExtractParam.m: Extract params from gamma prior structure.
wangPriorExtractParam.m: Extract params from Wang prior structure.
priorCreate.m: Create a prior structure given a type.
normuniPriorGradient.m: Gradient wrt x of the log normal uniform prior.
laplacePriorLogProb.m: Log probability of Laplace prior.
priorGradient.m: Gradient of the prior with respect to its variables
laplacePriorGradient.m: Gradient wrt x of the log Laplace prior.
wangPriorParamInit.m: Wang prior model's parameter initialisation.
gammaPriorLogProb.m: Log probability of Gamma prior.
priorWriteToFID.m: Write a prior to a C++ stream.
priorWriteParamsToFID.m: Write prior params from C++ written FID.
gaussianPriorGradient.m: Gradient wrt x of the log Gaussian prior.
invgammaPriorExtractParam.m: Extract params from inverse gamma prior structure.
wangPriorExpandParam.m: Expand wang prior structure from params.
invgammaPriorParamInit.m: Inverse gamma prior model's parameter initialisation.
priorTest.m: Run some tests on the specified prior.
gammaPriorExpandParam.m: Expand gamma prior structure from params.
gaussianPriorParamInit.m: Gaussian prior model's parameter initialisation.
wangPriorGradient.m: Gradient wrt x of the Wang prior.
priorExpandParam.m: Expand the prior model's parameters from params vector.
priorReadFromFID.m: Read a prior from a C++ written FID.
invgammaPriorExpandParam.m: Expand inverse gamma prior structure from params.
priorReadParamsFromFID.m: Read prior params from C++ written FID.
priorExtractParam.m: Extract the prior model's parameters.
invgammaPriorGradient.m: Gradient wrt x of the log Gaussian prior.
invgammaPriorLogProb.m: Log probability of inverse gamma prior.
