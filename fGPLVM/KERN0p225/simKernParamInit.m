function kern = simKernParamInit(kern)

% SIMKERNPARAMINIT SIM kernel parameter initialisation.
%
%	Description:
%	The single input motif (SIM) kernel is specifically designed for
%	working with gene networks where there is assumed to be a single
%	transcription factor controlling several genes. If each gene is
%	related to the transcription factor through the following
%	differential equation,
%	
%	dx(t)/dt = B + C f(t-delta) - D x(t),
%	
%	where D is a decay term, C is a response term, delta is a time delay
%	and B is an initial level. Then if f(t) is assumed to come from a
%	Gaussian process with an RBF covariance function x(t) is a Gaussian
%	process with a covariance function provided by the single input
%	motif kernel.
%	
%	The kernel is designed to interoperate with the multiple output
%	block kernel so that f(t) can be inferred given several different
%	instantiations of x(t) (associated with different genes).
%	
%	The parameters (B, C, delta and D) are constrained positive.
%	
%
%	KERN = SIMKERNPARAMINIT(KERN) initialises the single input motif
%	kernel structure with some default parameters.
%	 Returns:
%	  KERN - the kernel structure with the default parameters placed in.
%	 Arguments:
%	  KERN - the kernel structure which requires initialisation.
%	
%
%	See also
%	KERNCREATE, KERNPARAMINIT, SIMKERNCOMPUTE


%	Copyright (c) 2006 Neil D. Lawrence
% 	simKernParamInit.m CVS version 1.2
% 	simKernParamInit.m SVN version 618
% 	last update 2009-11-28T15:31:03.000000Z

if kern.inputDimension > 1
  error('SIM kernel only valid for one-D input.')
end

kern.delay = 0;
kern.decay = 1;
kern.initVal = 1;
kern.variance = 1;
kern.inverseWidth = 1;
kern.nParams = 3;

kern.transforms.index = [1 2 3];
kern.transforms.type = optimiDefaultConstraint('positive');

kern.isStationary = false;
kern.isNormalised = false;
kern.positiveTime = true;
kern.isNegativeS = false;

if kern.isNegativeS == true
    kern.transforms.index = [1 2];    
end
    

