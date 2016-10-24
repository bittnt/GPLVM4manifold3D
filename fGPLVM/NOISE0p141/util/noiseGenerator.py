#!/usr/bin/env python

# For creating files for new noises. Run as 

# noiseGenerator.py {noise short name} {noise long name} [CopyrightName YearOne YearTwo etc]

# A detailed noise description can be given in {noise short name}.txt
import os
import sys
import re
import shutil
import time
import string


if len(sys.argv) < 3:
    raise "There should be two input arguments"
prefix = sys.argv[1]
longName = sys.argv[2]
ucPrefix = prefix.upper()
year = time.strftime('%Y')

if len(sys.argv)>3:
    # copyright info provided
    copyRightText = sys.argv[3]
    if len(sys.argv)>4:
        for argNo in range(len(sys.argv)-4):
            copyRightText += ', ' + sys.argv[argNo+4]
    else:
        copyRightText + ', ' + year
    copyRightText = '\n%\n% COPYRIGHT : ' + copyRightText
else:
    copyRightText = ''
    
file = prefix + '.txt'
if os.path.exists(file):
    fileHandle = open(file, 'r')
    noiseDescription = fileHandle.read()
    fileHandle.close()
    noiseDescription = '\n' + noiseDescription.strip() + '\n%'
else:
    noiseDescription = ''

# Dictionary of the files and their contents.
files = {prefix + 'NoiseOut.m' :
 '''function y = ''' + prefix + '''NoiseOut(noise, mu, varSigma)

% ''' + ucPrefix + '''NOISEOUT Compute the output of the ''' + ucPrefix + ''' noise given the input mean and variance.
% FORMAT
% DESC computes the ouptut for the ''' + longName + '''
% noise given input mean and variances.
% ARG noise : the noise structure for which the output is computed.
% ARG mu : the input mean values.
% ARG varSigma : the input variance values.
% RETURN y : the output from the noise model.
%
% SEEALSO : ''' + prefix + '''NoiseParamInit, noiseOut, noiseCreate ''' + copyRightText + '''

% NOISE

''',
prefix + 'NoiseNuG.template' : 
'''function [g, nu] = ''' + prefix + '''NoiseNuG(noise, x)

% ''' + ucPrefix + '''NOISENUG Compute nu and g for ''' + ucPrefix + ''' noise model.
% FORMAT
% DESC computes the values nu and g for the ''' + longName + ''' noise given the mean and variance inputs as well as the output of the noise model.
% ARG noise : the noise structure for which the nu and g are computed.
% ARG mu : input mean to the noise model.
% ARG varSigma : input variance to the noise model.
% ARG y : target output for the noise model.
% RETURN g : the vector g, which is the gradient of log Z with respect to the input mean.
% ARG y : target output for the noise model.
% RETURN nu : the vector nu, see equation 10 of "Extensions of the Informative Vector Machine".
%
% SEEALSO : ''' + prefix + '''NoiseParamInit, noiseUpdateNuG, noiseCreate''' + copyRightText + '''

% NOISE

''',
prefix + 'Noise3dPlot.m' :
'''function gX = ''' + prefix + '''Noise3dPlot(noise, X)

% ''' + ucPrefix + '''NOISE3DPLOT Draws a 3D or contour plot for the ''' + ucPrefix + ''' noise model.
% FORMAT
% DESC draws a 3D or contour plot for the ''' + longName + ''' noise model.
% ARG noise : the noise structure for which the plot is required.
% ARG plotType : string containing the name of the plotting function (for example mesh, contour).
% ARG X : the input X data in the form of a \'mesh\' matrix.
% ARG Y : the input Y data in the form of a \'mesh\' matrix.
% ARG mu : the input mean in the form of a \'mesh\' matrix.
% ARG varSigma : the input variance in the form of a \'mesh\' matrix. 
% ARG P1, P2, P3 ... : optional additional arguments for the given plot type.
% RETURN h : the gradients of the diagonal with respect to each element
% of X. The returned matrix has the same dimensions as X.
%
% SEEALSO : ''' + prefix + '''NoiseParamInit, noise3dPlot, ''' + copyRightText + '''

% NOISE

''',
prefix + 'NoiseSites.template' :
''' function [m, beta] = ''' + prefix + '''NoiseSites(noise, g, nu, mu, varSigma, y)

% ''' + ucPrefix + '''NOISESITES Update the site parameters for the ''' + ucPrefix + ''' noise mode.
% FORMAT
% DESC updates the site parameters for the ''' + longName + '''
% noise model. 
% ARG noise : the noise structure for which the site parameters are to
% be updated. 
% ARG g : values of g as retuned by ''' + prefix + '''NoiseNuG.
% ARG nu : values of nu as retuned by ''' + prefix + '''NoiseNuG.
% ARG mu : the mean value of the Gaussian input to the noise structure.
% ARG varSigma : the variance of the Gaussian input to the noise structure.
% ARG y : the target value.
% RETURN m : the site mean parameters.
% RETURN beta : the site precision parameters.
%
% SEEALSO : ''' + prefix + '''NoiseParamInit, noiseUpdateSites''' + copyRightText + '''

% NOISE

''',
prefix + 'NoiseDisplay.m' : 
'''function ''' + prefix + '''NoiseDisplay(noise, spacing)

% ''' + ucPrefix + '''NOISEDISPLAY Display parameters of the ''' + ucPrefix + ''' noise.
% FORMAT
% DESC displays the parameters of the ''' + longName + '''
% noise and the noise type to the console.
% ARG noise : the noise to display.
%
% FORMAT does the same as above, but indents the display according
% to the amount specified.
% ARG noise : the noise to display.
% ARG spacing : how many spaces to indent the display of the noise by.
%
% SEEALSO : ''' + prefix + '''NoiseParamInit, modelDisplay, noiseDisplay''' + copyRightText + '''

% NOISE

''',
prefix + 'NoiseExpandParam.m' :
'''function noise = ''' + prefix + '''NoiseExpandParam(noise, params)

% ''' + ucPrefix + '''NOISEEXPANDPARAM Create noise structure from ''' + ucPrefix + ''' noise\'s parameters.
% FORMAT
% DESC returns a ''' + longName + ''' noise structure filled with the
% parameters in the given vector. This is used as a helper function to
% enable parameters to be optimised in, for example, the NETLAB
% optimisation functions.
% ARG noise : the noise structure in which the parameters are to be
% placed.
% ARG param : vector of parameters which are to be placed in the
% noise structure.
% RETURN noise : noise structure with the given parameters in the
% relevant locations.
%
% SEEALSO : ''' + prefix + '''NoiseParamInit, ''' + prefix + '''NoiseExtractParam, noiseExpandParam''' + copyRightText + '''

% NOISE

''',
prefix + 'NoiseExtractParam.m' :
'''function [params, names] = ''' + prefix + '''NoiseExtractParam(noise)

% ''' + ucPrefix + '''NOISEEXTRACTPARAM Extract parameters from the ''' + ucPrefix + ''' noise structure.
% FORMAT
% DESC extracts parameters from the ''' + longName + '''
% noise structure into a vector of parameters for optimisation.
% ARG noise : the noise structure containing the parameters to be
% extracted.
% RETURN param : vector of parameters extracted from the noise. If
% the field \'transforms\' is not empty in the noise structure, the
% parameters will be transformed before optimisation (for example
% positive only parameters could be logged before being returned).
%
% FORMAT
% DESC extracts parameters and parameter names from the ''' + longName + '''
% noise structure.
% ARG noise : the noise structure containing the parameters to be
% extracted.
% RETURN param : vector of parameters extracted from the noise. If
% the field \'transforms\' is not empty in the noise structure, the
% parameters will be transformed before optimisation (for example
% positive only parameters could be logged before being returned).
% RETURN names : cell array of strings containing names for each
% parameter.
%
% SEEALSO ''' + prefix + '''NoiseParamInit, ''' + prefix + '''NoiseExpandParam, noiseExtractParam, scg, conjgrad''' + copyRightText + '''
%
% NOISE

''',
prefix + 'NoiseGradVals.m' : 
'''function [dlnZ_dmu, dlnZ_dvs] = ''' + prefix + '''NoiseGradVals(noise, mu, varsigma, y)

% ''' + ucPrefix + '''NOISEGRADVALS Gradient of ''' + ucPrefix + ''' noise log Z with respect to input mean and variance.
% FORMAT
% DESC computes the gradient of the ''' + longName + '''
% noise with respect to the input mean and the input variance.
% ARG noise : noise structure for which gradients are being
% computed.
% ARG mu : mean input locations with respect to which gradients are
% being computed.
% ARG varSigma : variance input locations with respect to which
% gradients are being computed.
% ARG y : noise model output observed values associated with the given points.
% RETURN dlnZ_dmu : the gradient of log Z with respect to the input mean.
% RETURN dlnZ_dvs : the gradient of log Z with respect to the input variance.
%
% SEEALSO ''' + prefix + '''NoiseParamInit, ''' + prefix + '''NoiseGradientParam, noiseGradVals ''' + copyRightText + '''

% NOISE

''',
prefix + 'NoiseGradientParam.m' :
'''function g = ''' + prefix + '''NoiseGradientParam(noise, mu, varSigma, y)

% ''' + ucPrefix + '''NOISEGRADIENTPARAM Gradient of ''' + ucPrefix + ''' noise\'s parameters.
% FORMAT
% DESC computes the gradient of the log Z of the '''+ longName + ''' noise model with respect to the of functions with respect to the
% '''+ longName + '''
% noise\'s parameters. 
% ARG noise : the noise structure for which the gradients are being
% computed.
% ARG mu : the input means for which the gradients are being computed.
% ARG varSigma : the input variances for which the gradients are being computed.
% ARG y : the target values for the noise model.
% RETURN g : gradients of the log Z with respect to
% the noise parameters. The ordering of the vector should match
% that provided by the function noiseExtractParam.
%
%
% SEEALSO ''' + prefix + '''NoiseParamInit, ''' + prefix + '''NoiseGradVals, noiseGradientParam''' + copyRightText + '''

% NOISE

''',
prefix + 'NoiseParamInit.m' : 
'''function noise = ''' + prefix + '''NoiseParamInit(noise)

% ''' + ucPrefix + '''NOISEPARAMINIT ''' + ucPrefix + ''' noise parameter initialisation.''' + noiseDescription + '''
% FORMAT
% DESC initialises the ''' + longName + '''
%  noise structure with some default parameters.
% ARG noise : the noise structure which requires initialisation.
% RETURN noise : the noise structure with the default parameters placed in.
%
% SEEALSO : noiseCreate, noiseParamInit''' + copyRightText + '''

% NOISE

''',
prefix + 'NoisePointPlot.m' : 
'''function h = ''' + prefix + '''NoisePointPlot(noise, X, y, fontName, fontSize, markerSize, lineWidth)

% ''' + ucPrefix + '''NOISEPOINTPLOT Plot the data-points for the ''' + ucPrefix + ''' noise model.
% FORMAT
% DESC plots the data point locations for the ''' + longName + '''
%  noise structure.
% ARG noise : the noise structure which is to be plotted.
% ARG X : input locations to be plotted.
% ARG y : target locations to be plotted.
% ARG fontName : name of any fonts to be used.
% ARG fontSize : size of any fonts to be used.
% ARG markerSize : size of the makers to be used.
% ARG lineWidth : size of any lines to be plotted.
%
% SEEALSO : ''' + prefix + '''NoiseParamInit, noisePointPlot''' + copyRightText + '''

% NOISE

''',
prefix + 'NoiseLogLikelihood.m' : 
'''function ll = ''' + prefix + '''NoiseLogLikelihood(noise, mu, varSigma, y)

% ''' + ucPrefix + '''NOISELOGLIKELIHOOD Log likelihood of the data under the ''' + ucPrefix + ''' noise model.
% FORMAT
% DESC returns the log likelihood of a data set under the ''' + longName + ''' noise model.
% ARG noise : the noise structure for which the log likelihood is required.
% ARG mu : input mean locations for the log likelihood.
% ARG varSigma : input variance locations for the log likelihood.
% ARG y : target locations for the log likelihood.
%
% SEEALSO : ''' + prefix + '''NoiseParamInit, ''' + prefix + '''NoiseLikelihood, noiseLogLikelihood''' + copyRightText + '''

% NOISE

''',
prefix + 'NoiseLikelihood.m' : 
'''function ll = ''' + prefix + '''NoiseLikelihood(noise, mu, varSigma, y)

% ''' + ucPrefix + '''NOISELIKELIHOOD Likelihood of the data under the ''' + ucPrefix + ''' noise model.
% FORMAT
% DESC returns the likelihood of a data set under the ''' + longName + ''' noise model.
% ARG noise : the noise structure for which the likelihood is required.
% ARG mu : input mean locations for the likelihood.
% ARG varSigma : input variance locations for the likelihood.
% ARG y : target locations for the likelihood.
%
% SEEALSO : ''' + prefix + '''NoiseParamInit, ''' + prefix + '''NoiseLogLikelihood, noiseLikelihood''' + copyRightText + '''

% NOISE

'''};


for file in files.keys():
    if os.path.exists(file):
        foundNoise = 0
        justFoundNoise = 0
        newlines = files[file].split('\n')
        funcLine = newlines[0] + '\n'
        writeText = ''
        fileHandle = open(file, 'r')
        lines = fileHandle.readlines()
        fileHandle.close()
        for line in lines:
            if re.findall(re.compile(r'^%\s*NOISE\s*'), line):
                foundNoise = 1
                justFoundNoise = 1
            elif justFoundNoise:
                if not re.findall(re.compile(r'^\s*$'), line):
                    writeText += line
                    justFoundNoise = 0
            elif foundNoise:
                writeText += line
            elif re.findall(re.compile(r'^\s*function.*'), line):
                funcLine = line
        for line in newlines:
            if re.findall(re.compile(r'^\s*function.*'), line):
                commentText = funcLine + '\n'
            else:
                commentText += line + '\n'
        writeText = commentText + writeText
        fileHandle = open(file, 'w')
        fileHandle.write(writeText)
        fileHandle.close()
        
    else:
        fileHandle = open(file, 'w')
        fileHandle.write(files[file])
        fileHandle.close()
