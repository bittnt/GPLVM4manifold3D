% NOISE toolbox
% Version 0.141		06-Oct-2009
% Copyright (c) 2009, Neil D. Lawrence
% 
, Neil D. Lawrence
% NGAUSSNOISELIKELIHOOD Likelihood of the data under the NGAUSS noise model.
% NOISEUPDATENUG Update nu and g for a given noise model.
% ORDEREDNOISELIKELIHOOD Likelihood of the data under the ORDERED noise model.
% PROBIT3DPLOT Draw a 3D or contour plot for the probit.
% GAUSSIANNOISEEXTRACTPARAM Extract parameters from the GAUSSIAN noise structure.
% GAUSSIANNOISEPOINTPLOT Plot the data-points for the GAUSSIAN noise model.
% PROBITNOISELIKELIHOOD Likelihood of the data under the PROBIT noise model.
% CMPNDNOISE3DPLOT Draws a 3D or contour plot for the CMPND noise model.
% NEGNOISEGRADIENTPARAM Wrapper function for calling noise gradients.
% NOISEEXPANDPARAM Expand the noise model's parameters from params vector.
% ORDEREDNOISEPARAMINIT ORDERED noise parameter initialisation.
% MGAUSSIANNOISEEXPANDPARAM Create noise structure from MGAUSSIAN noise's parameters.
% CMPNDNOISEPOINTPLOT Plot the data-points for the CMPND noise model.
% CMPNDNOISEEXTRACTPARAM Extract parameters from the CMPND noise structure.
% CMPNDNOISELOGLIKELIHOOD Log likelihood of the data under the CMPND noise model.
% NOISEOUT Give the output of the noise model given the mean and variance.
% NOISEPOINTPLOT Plot the data-points for the given noise model.
% NGAUSSNOISEEXTRACTPARAM Extract parameters from the NGAUSS noise structure.
% PROBITNOISEEXPANDPARAM Create noise structure from PROBIT noise's parameters.
% NCNMNOISEDISPLAY Display  parameters from null category noise model.
% NCNMNOISENUG Update nu and g parameters associated with null category noise model.
% PROBITNOISEEXTRACTPARAM Extract parameters from the PROBIT noise structure.
% MGAUSSIANNOISEPOINTPLOT Plot the data-points for the MGAUSSIAN noise model.
% ORDEREDNOISEDISPLAY Display parameters of the ORDERED noise.
% CMPNDNOISEOUT Compute the output of the CMPND noise given the input mean and variance.
% SCALENOISEDISPLAY Display the parameters of the scaled noise model.
% NCNMNOISELOGLIKELIHOOD Log-likelihood of data under null category noise model.
% PROBITNOISEDISPLAY Display parameters of the PROBIT noise.
% PROBITNOISEOUT Compute the output of the PROBIT noise given the input mean and variance.
% ORDEREDNOISEUPDATEPARAMS Update parameters for ordered categorical noise model.
% SCALENOISESITES Site updates for Scale noise model.
% NOISELIKELIHOOD Return the likelihood for each point under the noise model.
% NEGNOISELOGLIKELIHOOD Wrapper function for calling noise likelihoods.
% NGAUSSNOISE3DPLOT Draws a 3D or contour plot for the NGAUSS noise model.
% GAUSSIANNOISEPARAMINIT GAUSSIAN noise parameter initialisation.
% NOISETEST Run some tests on the specified noise model.
% NGAUSSNOISESITES Site updates for noiseless Gaussian noise model.
% SCALENOISEOUT A simple noise model that scales and centres the data.
% NOISEUPDATESITES Update site parameters for a given noise model.
% NOISEWRITETOFID Load from an FID written by the C++ implementation.
% NCNMNOISELIKELIHOOD Likelihood of data under null category noise model.
% NCNMNOISEEXPANDPARAM Expand null category noise model's structure from param vector.
% GAUSSIANNOISELOGLIKELIHOOD Log likelihood of the data under the GAUSSIAN noise model.
% SCALENOISEEXPANDPARAM Expand Scale noise structure from param vector.
% MGAUSSIANNOISEGRADIENTPARAM Gradient of MGAUSSIAN noise's parameters.
% GAUSSIANNOISEOUT Compute the output of the GAUSSIAN noise given the input mean and variance.
% MGAUSSIANNOISELIKELIHOOD Likelihood of the data under the MGAUSSIAN noise model.
% NOISEWRITEPARAMSTOFID Write the noise parameters to a stream.
% CMPNDNOISEDISPLAY Display parameters of the CMPND noise.
% NOISEREADPARAMSFROMFID Read the noise parameters from C++ file FID.
% CMPNDNOISELIKELIHOOD Likelihood of the data under the CMPND noise model.
% GAUSSIANNOISELIKELIHOOD Likelihood of the data under the GAUSSIAN noise model.
% PROBITNOISEPOINTPLOT Plot the data-points for the PROBIT noise model.
% GAUSSIANNOISEGRADIENTPARAM Gradient of GAUSSIAN noise's parameters.
% PROBITNOISELOGLIKELIHOOD Log likelihood of the data under the PROBIT noise model.
% GAUSSIANNOISESITES Update the site parameters for the GAUSSIAN noise mode.
% MGAUSSIANNOISEEXTRACTPARAM Extract parameters from the MGAUSSIAN noise structure.
% NGAUSSNOISEEXPANDPARAM Create noise structure from NGAUSS noise's parameters.
% NOISEEXPECTATIONLOGLIKELIHOOD Return the expectation of the log likelihood.
% NGAUSSNOISEOUT Compute the output of the NGAUSS noise given the input mean and variance.
% GAUSSIANNOISEEXPANDPARAM Create noise structure from GAUSSIAN noise's parameters.
% NGAUSSNOISELOGLIKELIHOOD Log likelihood of the data under the NGAUSS noise model.
% MGAUSSIANNOISELOGLIKELIHOOD Log likelihood of the data under the MGAUSSIAN noise model.
% GAUSSIANNOISEDISPLAY Display parameters of the GAUSSIAN noise.
% ORDEREDNOISEPOINTPLOT Plot the data-points for the ORDERED noise model.
% PROBITNOISEGRADIENTPARAM Gradient of PROBIT noise's parameters.
% CMPNDNOISEPARAMINIT CMPND noise parameter initialisation.
% NCNMNOISEGRADVALS Compute gradient with respect to inputs to noise model.
% ORDEREDNOISEGRADIENTPARAM Gradient of ORDERED noise's parameters.
% NCNMNOISEOUT Ouput from null category noise model.
% NOISECREATE Initialise a noise structure.
% ORDEREDNOISEGRADVALS Gradient of ORDERED noise log Z with respect to input mean and variance.
% GAUSSIANNOISEGRADVALS Gradient of GAUSSIAN noise log Z with respect to input mean and variance.
% MGAUSSIANNOISEPARAMINIT MGAUSSIAN noise parameter initialisation.
% NGAUSSNOISEPOINTPLOT Plot the data-points for the NGAUSS noise model.
% ORDEREDNOISE3DPLOT Draws a 3D or contour plot for the ORDERED noise model.
% NOISE3DPLOT Draw a 3D or contour plot for the relevant noise model.
% NCNMNOISEGRADIENTPARAM Gradient of parameters for NCNM.
% CMPNDNOISEEXPANDPARAM Create noise structure from CMPND noise's parameters.
% NOISEGRADX Returns the gradient of the log-likelihood wrt x.
% ORDEREDNOISEEXTRACTPARAM Extract parameters from the ORDERED noise structure.
% NCNMNOISEPARAMINIT null category noise model's parameter initialisation.
% NGAUSSNOISENUG Update nu and g parameters associated with noiseless Gaussian noise model.
% PROBITNOISEPARAMINIT PROBIT noise parameter initialisation.
% NCNMNOISEEXTRACTPARAM Extract parameters from null category noise model.
% NCNMNOISE3DPLOT Draw a 3D or contour plot for the NCNM noise model.
% GAUSSIANNOISENUG Compute nu and g for GAUSSIAN noise model.
% PROBITNOISE3DPLOT Draws a 3D or contour plot for the PROBIT noise model.
% NOISEGRADIENTPARAM Gradient wrt the noise model's parameters.
% NOISEDISPLAY Display the parameters of the noise model.
% MGAUSSIANNOISE3DPLOT Draws a 3D or contour plot for the MGAUSSIAN noise model.
% CMPNDNOISEGRADVALS Gradient of CMPND noise log Z with respect to input mean and variance.
% NOISEREADFROMFID Load from an FID written by the C++ implementation.
% GAUSSIANNOISE3DPLOT Draws a 3D or contour plot for the GAUSSIAN noise model.
% NGAUSSNOISEPARAMINIT NGAUSS noise parameter initialisation.
% SCALENOISEPARAMINIT Scale noise model's parameter initialisation.
% NOISELOGLIKELIHOOD Return the log-likelihood under the noise model.
% CMPNDNOISEGRADIENTPARAM Gradient of CMPND noise's parameters.
% NCNMNOISESITES Site updates for null category model.
% PROBITNOISEGRADVALS Gradient of PROBIT noise log Z with respect to input mean and variance.
% NCNMNOISEPOINTPLOT Plot the data-points for null category noise model.
% NOISEEXTRACTPARAM Extract the noise model's parameters.
% NGAUSSNOISEGRADVALS Gradient of NGAUSS noise log Z with respect to input mean and variance.
% ORDEREDNOISELOGLIKELIHOOD Log likelihood of the data under the ORDERED noise model.
% CMPNDNOISENUG  Update nu and g parameters associated with compound noise model.
% ORDEREDNOISEOUT Compute the output of the ORDERED noise given the input mean and variance.
% NGAUSSNOISEGRADIENTPARAM Gradient of NGAUSS noise's parameters.
% ORDEREDGRADX Gradient wrt x of log-likelihood for Ordered categorical model.
% MGAUSSIANNOISEDISPLAY Display parameters of the MGAUSSIAN noise.
% NOISEGRADVALS Gradient of noise model wrt mu and varsigma.
% ORDEREDNOISEEXPANDPARAM Create noise structure from ORDERED noise's parameters.
% NOISEPARAMINIT Noise model's parameter initialisation.
% MGAUSSIANNOISEOUT Compute the output of the MGAUSSIAN noise given the input mean and variance.
% CMPNDNOISESITES Site updates for compound noise model.
% MGAUSSIANNOISEGRADVALS Gradient of MGAUSSIAN noise log Z with respect to input mean and variance.
% NGAUSSNOISEDISPLAY Display parameters of the NGAUSS noise.
