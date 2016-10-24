function gX = multiKernGradientBlockX(kern, X, X2, i, j)

% MULTIKERNGRADIENTBLOCKX
%
%	Description:
%
%	[G1, G2] = MULTIKERNGRADIENTBLOCKX(KERN, X1, X2, COVGRAD, I, J)
%	computes the gradient with respect to the inducing points for a
%	block of a multi-output kerneal given two matrices of input.
%	 Returns:
%	  G1 - the gradient of the kernel parameters from the first kernel
%	   in the order provided by the relevant kernExtractParam commands.
%	  G2 - the gradient of the kernel parameters from the second kernel
%	   in the order provided by the relevant kernExtractParam commands.
%	 Arguments:
%	  KERN - the structure containing the kernel.
%	  X1 - first set of kernel inputs.
%	  X2 - second set of kernel inputs.
%	  COVGRAD - Gradient of the objective function with respect to the
%	   relevant portion of the kernel matrix.
%	  I - the row of the block of the kernel to be computed.
%	  J - the column of the block of the kernel to be computed.
%
%	[G1, G2] = MULTIKERNGRADIENTBLOCKX(KERN, X, COVGRAD, I, J) compute a
%	block of a multi-output kernel given a single matrix of input.
%	 Returns:
%	  G1 - the gradient of the kernel parameters from the first kernel
%	   in the order provided by the relevant kernExtractParam commands.
%	  G2 - the gradient of the kernel parameters from the second kernel
%	   in the order provided by the relevant kernExtractParam commands.
%	 Arguments:
%	  KERN - the structure containing the kernel.
%	  X - first set of kernel inputs.
%	  COVGRAD - Gradient of the objective function with respect to the
%	   relevant portion of the kernel matrix.
%	  I - the row of the block of the kernel to be computed.
%	  J - the column of the block of the kernel to be computed.
%	
%
%	See also
%	MULTIKERNCREATE, MULTIKERNGRADX


%	Copyright (c) 2006 Neil D. Lawrence
% 	multiKernGradientBlockX.m SVN version 269
% 	last update 2009-03-08T08:54:27.000000Z

if nargin < 5
    j = i;
    i = X2;
    X2 = [];
end
outArg = 2;
if i == j
    fhandle = [kern.comp{i}.type 'KernGradX'];
    transpose = 0;
    arg{1} = kern.comp{i};
    factors = kernFactors(kern.comp{i}, 'gradfact');
    outArg = 1;
else
    if j<i
        fhandle = [kern.block{i}.cross{j} 'KernGradX'];
        transpose = kern.block{i}.transpose(j);
    else
        fhandle = [kern.block{j}.cross{i} 'KernGradX'];
        transpose = ~kern.block{j}.transpose(i);
    end
    if transpose
        arg{1} = kern.comp{j};
        factors{1} = kernFactors(kern.comp{j}, 'gradfact');
        arg{2} = kern.comp{i};
        factors{2} = kernFactors(kern.comp{i}, 'gradfact');
    else
        arg{1} = kern.comp{i};
        factors{1} = kernFactors(kern.comp{i}, 'gradfact');
        arg{2} = kern.comp{j};
        factors{2} = kernFactors(kern.comp{j}, 'gradfact');
    end
end
fhandle = str2func(fhandle);
arg{end+1} = X;
if ~isempty(X2);
    arg{end+1} = X2;
end
switch outArg
    case 1
        gX = fhandle(arg{:});
    case 2
        gX = fhandle(arg{:});
        if transpose
            g = g2;
            g2 = g1;
            g1 = g;
        end
    otherwise
        error('Invalid number of out arguments.')
end