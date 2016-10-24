function K = multiKernCompute(kern, varargin)

% MULTIKERNCOMPUTE Compute the MULTI kernel given the parameters and X.
%
%	Description:
%
%	K = MULTIKERNCOMPUTE(KERN, X, X2) computes the kernel parameters for
%	the multiple output block kernel given inputs associated with rows
%	and columns.
%	 Returns:
%	  K - the kernel matrix computed at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  X - the input matrix associated with the rows of the kernel.
%	  X2 - the input matrix associated with the columns of the kernel.
%
%	K = MULTIKERNCOMPUTE(KERN, X) computes the kernel matrix for the
%	multiple output block kernel given a design matrix of inputs.
%	 Returns:
%	  K - the kernel matrix computed at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed.
%	  X - input data matrix in the form of a design matrix.
%	
%	
%
%	See also
%	MULTIKERNPARAMINIT, KERNCOMPUTE, KERNCREATE, MULTIKERNDIAGCOMPUTE


%	Copyright (c) 2006 Neil D. Lawrence
%	Copyright (c) 2007 Pei Gao
% 	multiKernCompute.m CVS version 1.3
% 	multiKernCompute.m SVN version 269
% 	last update 2009-03-08T08:54:27.000000Z

if iscell(varargin{1})
  if length(varargin{1}) ~= kern.numBlocks
    error('Time information is not matched among blocks!');
  end
  for i = 1:kern.numBlocks
    dim1(i) = size(varargin{1}{i}, 1);    
    if length(varargin)>1
      if length(varargin{1}) ~= length(varargin{2})
        error('Time information is not matched within the block!');
      end      
      dim2(i) = size(varargin{2}{i}, 1);
    else
      dim2(i) = dim1(i);
    end    
    
  end
    
  K = zeros(sum(dim1), sum(dim2));
  
  for i = 1:kern.numBlocks
    startOne = sum(dim1(1:(i-1))) + 1;
    endOne = sum(dim1(1:i));
    startThree = sum(dim2(1:(i-1))) + 1;
    endThree = sum(dim2(1:i));

    if length(varargin)<2
      K(startOne:endOne, startThree:endThree) = multiKernComputeBlock(kern, ...
                                                    varargin{1}{i}, i, i);     
    else
      K(startOne:endOne, startThree:endThree) = multiKernComputeBlock(kern, ...
                                     varargin{1}{i}, varargin{2}{i}, i, i);      
    end
    for j = 1:i-1
      if ~isempty(kern.block{i}.cross{j})
        startTwo = sum(dim2(1:(j-1))) + 1;
        endTwo =  sum(dim2(1:j));
        
        if length(varargin)<2
          K(startOne:endOne, startTwo:endTwo) = multiKernComputeBlock(kern, ...
                                varargin{1}{i}, varargin{1}{j}, i, j);
          K(startTwo:endTwo, startOne:endOne) = K(startOne:endOne, ...
                                                startTwo:endTwo)';
        else
          K(startOne:endOne, startTwo:endTwo) = multiKernComputeBlock(kern, ...
                                varargin{1}{i}, varargin{2}{j}, i, j);
          startFour = sum(dim1(1:(j-1))) + 1;
          endFour =  sum(dim1(1:j));
          K(startFour:endFour, startThree:endThree) = ...
              multiKernComputeBlock(kern, varargin{2}{i}, varargin{1}{j}, j, i)';
        end
      end
    end
  end
 
else
  dim1 = size(varargin{1}, 1);
  
  if length(varargin)>1
    dim2 = size(varargin{2}, 1);
  else
    dim2 = dim1;
  end
  
  K = zeros(kern.numBlocks*dim1, kern.numBlocks*dim2);
  
  for i = 1:kern.numBlocks
    startOne = (i-1)*dim1 + 1;
    endOne = i*dim1;
    startThree = (i-1)*dim2 + 1;
    endThree = i*dim2;
    K(startOne:endOne, startThree:endThree) = multiKernComputeBlock(kern, ...
                                                      varargin{:}, i, i);
    for j = 1:i-1
      if ~isempty(kern.block{i}.cross{j})
        startTwo = (j-1)*dim2 + 1;
        endTwo = j*dim2;
        K(startOne:endOne, startTwo:endTwo) = multiKernComputeBlock(kern, ...
                                                          varargin{:}, i, j);
        if length(varargin)<2
          K(startTwo:endTwo, startOne:endOne) = K(startOne:endOne, ...
                                                startTwo:endTwo)';
        else
          startFour = (j-1)*dim1 + 1;
          endFour = j*dim1;
          K(startFour:endFour, startThree:endThree) = ...
              multiKernComputeBlock(kern, varargin{end:-1:1}, j, i)';
        end
      end
    end
  end
  
end
