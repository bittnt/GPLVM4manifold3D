% MLTOOLS toolbox
% Version 0.134		06-Nov-2009
% Copyright (c) 2009, Neil D. Lawrence
% 
, Neil D. Lawrence
% DEMMPPCA1 Demonstrate MPPCA on a artificial dataset.
% KBRDISPLAY Display parameters of the KBR model.
% KBROUTPUTGRAD Evaluate derivatives of KBR model outputs with respect to parameters.
% KBRPARAMINIT KBR model parameter initialisation.
% KPCAEMBED Embed data set with kernel PCA.
% LINEARCREATE Create a linear model.
% LINEARDISPLAY Display a linear model.
% LINEAREXPANDPARAM Update linear model with vector of parameters.
% LINEAREXTRACTPARAM Extract weights from a linear model.
% LINEARLOGLIKEGRADIENTS Linear model gradients.
% LINEARPARAMINIT Initialise the parameters of an LINEAR model.
% LLEEMBED Embed data set with LLE.
% LVMCLASSVISUALISE Callback function for visualising data.
% LVMSCATTERPLOT 2-D scatter plot of the latent points.
% LVMSCATTERPLOTCOLOR 2-D scatter plot of the latent points with color.
% LVMTWODPLOT Helper function for plotting the labels in 2-D.
% MAPPINGOPTIMISE Optimise the given model.
% KBREXPANDPARAM Create model structure from KBR model's parameters.
% MLPCREATE Multi-layer peceptron model.
% MLPEXTRACTPARAM Extract weights and biases from an MLP.
% MLPLOGLIKEGRADIENTS Multi-layer perceptron gradients.
% MLPLOGLIKEHESSIAN Multi-layer perceptron Hessian.
% MLPLOGLIKELIHOOD Multi-layer perceptron log likelihood.
% MLPOPTIMISE Optimise MLP for given inputs and outputs.
% MLPOPTIONS Options for the multi-layered perceptron.
% MLPOUT Output of an MLP model.
% MLPOUTPUTGRAD Evaluate derivatives of mlp model outputs with respect to parameters.
% MLPOUTPUTGRADX Evaluate derivatives of mlp model outputs with respect to inputs.
% MLPPARAMINIT Initialise the parameters of an MLP model.
% MLTOOLSTOOLBOXES Load in the relevant toolboxes for the MLTOOLS.
% MODELOUTPUTGRAD Compute derivatives with respect to params of model outputs.
% MODELOUTPUTGRADX Compute derivatives with respect to model inputs of model outputs.
% MODELPARAMINIT Initialise the parameters of the model.
% MODELPOINTLOGLIKELIHOOD Compute the log likelihood of a given point.
% MODELSAMP Give a sample from a model for given X.
% MODELTEST Run some tests on the specified model.
% MOGESTEP Do an E-step on an MOG model.
% MOGLOWERBOUND Computes lower bound on log likelihood for an MOG model.
% MOGOPTIMISE Optimise an MOG model.
% IMAGEMODIFY Helper code for visualisation of image data.
% MOGOPTIONS Sets the default options structure for MOG models.
% IMAGEVISUALISE Helper code for showing an image during 2-D visualisation.
% ISOMAPEMBED Embed data set with Isomap.
% KBRCREATE Create a KBR model.
% KBREXTRACTPARAM Extract parameters from the KBR model structure.
% LMVUEMBED Embed data set with landmark MVU
% MOGUPDATECOVARIANCE Update the covariances of an MOG model.
% MOGUPDATEMEAN Update the means of an MOG model.
% MOGUPDATEPRIOR Update the priors of an MOG model.
% MULTIMODELCREATE Create a MULTIMODEL model.
% MULTIMODELDISPLAY Display parameters of the MULTIMODEL model.
% MULTIMODELEXPANDPARAM Create model structure from MULTIMODEL model's parameters.
% KBROPTIMISE Optimise a KBR model.
% KBROPTIONS Create a default options structure for the KBR model.
% KBROUT Compute the output of a KBR model given the structure and input X.
% LINEARLOGLIKELIHOOD Linear model log likelihood.
% MULTIMODELEXTRACTPARAM Extract parameters from the MULTIMODEL model structure.
% MULTIMODELOPTIONS Create a default options structure for the MULTIMODEL model.
% MULTIMODELLOGLIKEGRADIENTS Gradient of MULTIMODEL model log likelihood with respect to parameters.
% MULTIMODELLOGLIKELIHOOD Log likelihood of MULTIMODEL model.
% LINEAROPTIMISE Optimise a linear model.
% LINEAROPTIONS Options for learning a linear model.
% LINEAROUT Obtain the output of the linear model.
% LINEAROUTPUTGRAD Evaluate derivatives of linear model outputs with respect to parameters.
% LINEAROUTPUTGRADX Evaluate derivatives of linear model outputs with respect to inputs.
% MLPDISPLAY Display the multi-layer perceptron model.
% MLPEXPANDPARAM Update mlp model with new vector of parameters.
% MODELCREATE Create a model of the specified type.
% MODELDISPLAY Display a text output of a model.
% MODELEXPANDPARAM Update a model structure with parameters.
% MODELEXTRACTPARAM Extract the parameters of a model.
% MULTIMODELPARAMINIT MULTIMODEL model parameter initialisation.
% PPCAEMBED Embed data set with probabilistic PCA.
% RBFCREATE Wrapper for NETLAB's rbf `net'.
% RBFDISPLAY Display an RBF network.
% RBFEXPANDPARAM Update rbf model with new vector of parameters.
% RBFEXTRACTPARAM Wrapper for NETLAB's rbfpak.
% RBFOPTIMISE Optimise RBF for given inputs and outputs.
% RBFOPTIONS Default options for RBF network.
% MODELGRADIENT Gradient of error function to minimise for given model.
% MODELGRADIENTCHECK Check gradients of given model.
% MODELHESSIAN Hessian of error function to minimise for given model.
% MODELLOGLIKEGRADIENTS Compute a model's gradients wrt log likelihood.
% MODELLOGLIKELIHOOD Compute a model log likelihood.
% MODELOBJECTIVE Objective function to minimise for given model.
% MODELOPTIMISE Optimise the given model.
% MODELOPTIONS Returns a default options structure for the given model.
% MODELOUT Give the output of a model for given X.
% MODELTIEPARAM Tie parameters of a model together.
% RBFOUT Output of an RBF model.
% RBFOUTPUTGRAD Evaluate derivatives of rbf model outputs with respect to parameters.
% MOGCREATE Create a mixtures of Gaussians model.
% RBFPERIODICCREATE Create a RBFPERIODIC model.
% RBFPERIODICDISPLAY Display parameters of the RBFPERIODIC model.
% RBFPERIODICEXPANDPARAM Create model structure from RBFPERIODIC model's parameters.
% RBFPERIODICEXTRACTPARAM Extract parameters from the RBFPERIODIC model structure.
% RBFPERIODICOUTPUTGRAD Evaluate derivatives of RBFPERIODIC model outputs with respect to parameters.
% RBFPERIODICLOGLIKEGRADIENTS Gradient of RBFPERIODIC model log likelihood with respect to parameters.
% RBFPERIODICLOGLIKELIHOOD Log likelihood of RBFPERIODIC model.
% RBFPERIODICOPTIONS Create a default options structure for the RBFPERIODIC model.
% RBFPERIODICOUT Compute the output of a RBFPERIODIC model given the structure and input X.
% RBFPERIODICOUTPUTGRADX Evaluate derivatives of a RBFPERIODIC model's output with respect to inputs.
% RBFPERIODICPARAMINIT RBFPERIODIC model parameter initialisation.
% SMALLRANDEMBED Embed data set with small random values.
% SPECTRUMMODIFY Helper code for visualisation of spectrum data.
% VECTORMODIFY Helper code for visualisation of vectorial data.
% SPECTRUMVISUALISE Helper code for showing an spectrum during 2-D visualisation.
% VECTORVISUALISE  Helper code for plotting a vector during 2-D visualisation.
% VITERBIALIGN Compute the Viterbi alignment.
% MODELADDDYNAMICS Add a dynamics kernel to the model.
% MVUEMBED Embed data set with MVU.
% LVMCLASSVISUALISEPATH Latent variable model path drawing in latent space.
% SPRINGDAMPERSMODIFY Helper code for visualisation of springDamper data.
% LLECREATE Locally linear embedding model.
% SPRINGDAMPERSVISUALISE Helper code for showing an spring dampers during 2-D visualisation.
% MOGLOGLIKELIHOOD Mixture of Gaussian's log likelihood.
% MODELREADFROMFILE Read model from a file FID produced by the C++ implementation.
% MODELREADFROMFID Load from a FID produced by C++ code.
% DOUBLEMATRIXWRITETOFID Writes a double matrix to an FID.
% MAPMODELREADFROMFID Load from a FID produced by C++ code.
% DNETCREATE Density network model.
% DNETESTEP Do an E-step (update importance weights) on an Density Network model.
% DOUBLEMATRIXREADFROMFID Read a full matrix from an FID.
% MODELWRITETOFID Write to a stream a given model.
% MATRIXREADFROMFID Read a matrix from an FID.
% DNETLOGLIKEGRADIENTS Density network gradients.
% DNETOPTIMISE Optimise an DNET model.
% DNETOPTIONS Options for a density network.
% DNETOUT Output of an DNET model.
% DNETOUTPUTGRAD Evaluate derivatives of dnet model outputs with respect to parameters.
% DNETOUTPUTGRADX Evaluate derivatives of DNET model outputs with respect to inputs.
% DNETPOSTERIORMEANVAR Mean and variances of the posterior at points given by X.
% DNETEXPANDPARAM Update dnet model with new vector of parameters.
% DNETEXTRACTPARAM Extract weights and biases from an DNET.
% DNETGRADIENT Density Network gradient wrapper.
% DNETLOGLIKELIHOOD Density network log likelihood.
% DNETLOWERBOUND Computes lower bound on log likelihood for an DNET model.
% DNETOBJECTIVE Wrapper function for Density Network objective.
% DNETUPDATEBETA Do an M-step (update parameters) on an Density Network model.
% DNETUPDATEOUTPUTWEIGHTS Do an M-step (update parameters) on an Density Network model.
% DNETTEST Test some settings for the density network.
% MOGPRINTPLOT Print projection of MOG into two dimensions.
% LVMLOADRESULT Load a previously saved result.
% LVMNEARESTNEIGHBOUR Give the number of errors in latent space for 1 nearest neighbour.
% LVMPRINTPLOT Print latent space for learnt model.
% LVMRESULTSDYNAMIC Load a results file and visualise them.
% LVMVISUALISE Visualise the manifold.
% MODELGETOUTPUTWEIGHTS Wrapper function to return output weight and bias matrices.
% MODELSETOUTPUTWEIGHTS Wrapper function to return set output weight and bias matrices.
% PPCACREATE Density network model.
% PPCAOPTIONS Options for probabilistic PCA.
% PPCAOUT Output of an PPCA model.
% MOGMEANCOV Project a mixture of Gaussians to a low dimensional space.
% MOGTWODPLOT Helper function for plotting the labels in 2-D.
% PPCAPOSTERIORMEANVAR Mean and variances of the posterior at points given by X.
% RBFOUTPUTGRADX Evaluate derivatives of a RBF model's output with respect to inputs.
% MOGPROJECT Project a mixture of Gaussians to a low dimensional space.
% PARAMNAMEREGULAREXPRESSIONLOOKUP Returns the indices of the parameter containing the given regular expression.
% MOGSAMPLE Sample from a mixture of Gaussians model.
% PARAMNAMEREVERSELOOKUP Returns the index of the parameter with the given name.
% FINDNEIGHBOURS find the k nearest neighbours for each point in Y.
% LLEOPTIMISE Optimise an LLE model.
% LVMSCATTERPLOTNEIGHBOURS 2-D scatter plot of the latent points with neighbourhood.
% LFMRESULTSDYNAMIC Load a results file and visualise them.
% LFMVISUALISE Visualise the outputs in a latent force model
% DEMOILLLE2 Demonstrate LLE on the oil data.
% LLEOPTIONS Options for a locally linear embedding.
% DEMOILLLE1 Demonstrate LLE on the oil data.
% DEMOILLLE3 Demonstrate LLE on the oil data.
% DEMOILLLE4 Demonstrate LLE on the oil data.
% PPCAPOSTERIORVAR Mean and variances of the posterior at points given by X.
% LVMTHREEDPLOT Helper function for plotting the labels in 3-D.
% ISOMAPCREATE isomap embedding model.
% DEMSWISSROLLFULLLLE2 Demonstrate LLE on the oil data.
% DEMSWISSROLLFULLLLE3 Demonstrate LLE on the oil data.
% DEMSWISSROLLFULLLLE4 Demonstrate LLE on the oil data.
% DEMSWISSROLLLLE1 Demonstrate LLE on the oil data.
% DEMSWISSROLLLLE2 Demonstrate LLE on the oil data.
% DEMSWISSROLLLLE3 Demonstrate LLE on the oil data.
% DEMSWISSROLLLLE4 Demonstrate LLE on the oil data.
% ISOMAPOPTIMISE Optimise an ISOMAP model.
% ISOMAPOPTIONS Options for a isomap.
% MVUCREATE Maximum variance unfolding embedding model.
% MODELPOSTERIORMEANVAR Mean and variances of the posterior at points given by X.
% MODELPOSTERIORVAR variances of the posterior at points given by X.
% LFMCLASSVISUALISE Callback function to visualize LFM in 2D
% MVUOPTIMISE Optimise an MVU model.
% MVUOPTIONS Options for a MVU.
% LEOPTIMISE Optimise an LE model.
% LEOPTIONS Options for a Laplacian eigenmaps.
% SPECTRALUPDATEX Update the latent representation for spectral model.
% LECREATE Laplacian eigenmap model.
% LVMRESULTSCLICK Load a results file and visualise them with clicks
% SPECTRALUPDATELAPLACIAN Update the Laplacian using graph connections.
% LVMCLASSCLICKVISUALISE Callback function for visualising data in 2-D with clicks.
% DNETLOADRESULT Load a previously saved result.
% DNETRECONSTRUCT Reconstruct an DNET form component parts.
% ISOMAPRECONSTRUCT Reconstruct an isomap form component parts.
% LEDECONSTRUCT break LE in pieces for saving.
% LERECONSTRUCT Reconstruct an LE form component parts.
% DNETDECONSTRUCT break DNET in pieces for saving.
% DEMSWISSROLLFULLLLE1 Demonstrate LLE on the oil data.
% DNETWRITERESULT Write a DNET result.
% MODELLOADRESULT Load a previously saved result.
% MODELWRITERESULT Write a model to file.
% LVMSETPLOT Sets up the plot for visualization of the latent space.
% PPCADECONSTRUCT break PPCA in pieces for saving.
% PPCARECONSTRUCT Reconstruct an PPCA form component parts.
% LLEDECONSTRUCT break LLE in pieces for saving.
% LLERECONSTRUCT Reconstruct an LLE form component parts.
% MVUDECONSTRUCT break MVU in pieces for saving.
% PMVUCREATE Create a PMVU model.
% PMVUDECONSTRUCT break PMVU in pieces for saving.
% PMVUDISPLAY Display parameters of the PMVU model.
% PMVUEXPANDPARAM Create model structure from PMVU model's parameters.
% PMVUEXTRACTPARAM Extract parameters from the PMVU model structure.
% MVURECONSTRUCT Reconstruct an MVU form component parts.
% PMVULOGLIKEGRADIENTS Gradient of PMVU model log likelihood with respect to parameters.
% PMVULOGLIKELIHOOD Log likelihood of PMVU model.
% PMVUOPTIONS Create a default options structure for the PMVU model.
% ISOMAPDECONSTRUCT break isomap in pieces for saving.
% PMVUPARAMINIT PMVU model parameter initialisation.
% PMVURECONSTRUCT Reconstruct an probabilistic maximum variance unfolding from component parts.
% LVMCLICKVISUALISE Visualise the manifold using clicks.
