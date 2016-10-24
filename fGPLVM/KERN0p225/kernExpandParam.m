function kern = kernExpandParam(kern, params)

% KERNEXPANDPARAM Expand parameters to form a kernel structure.
%
%	Description:
%
%	KERN = KERNEXPANDPARAM(KERN, PARAM) returns a kernel structure
%	filled with the parameters in the given vector. This is used as a
%	helper function to enable parameters to be optimised in, for
%	example, the NETLAB optimisation functions.
%	 Returns:
%	  KERN - kernel structure with the given parameters in the relevant
%	   locations.
%	 Arguments:
%	  KERN - the kernel structure in which the parameters are to be
%	   placed.
%	  PARAM - vector of parameters which are to be placed in the kernel
%	   structure.
%	As well as extracting the parameters, some transformation of
%	parameters is also undertaken in this file. If the field
%	transforms is not empty, it dictactes how the kernel parameters
%	are to be transformed (for example by a exponential to keep them
%	positive).
%	
%	
%
%	See also
%	KERNEXTRACTPARAM, SCG, CONJGRAD


%	Copyright (c) 2003, 2004, 2005, 2006 Neil D. Lawrence
% 	kernExpandParam.m CVS version 1.5
% 	kernExpandParam.m SVN version 1
% 	last update 2006-10-25T10:53:00.000000Z

% Check if parameters are being optimised in a transformed space.
if ~isempty(kern.transforms)
  for i = 1:length(kern.transforms)
    index = kern.transforms(i).index;
    fhandle = str2func([kern.transforms(i).type 'Transform']);
    params(index) = fhandle(params(index), 'atox');
  end
end
fhandle = str2func([kern.type 'KernExpandParam']);
kern = fhandle(kern, params);

