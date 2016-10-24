function [msg,nx,ny,nz] = xyzvcheck(x,y,z,data)
%XYZVCHECK  Check arguments to 3D scalar data routines.
%   [MSG,X,Y,Z] = XYZVCHECK(X,Y,Z,V) checks the input arguments
%   and returns either an error message structure in MSG or valid
%   X,Y,Z. The ERROR function describes the format and use of the
%   error structure.
%
%   See also ERROR

%   Copyright 1984-2005 The MathWorks, Inc. 
%   $Revision: 1.6.4.2 $  $Date: 2009/11/13 04:37:58 $

msg = struct([]);
nx = x;
ny = y;
nz = z;

sz = size(data);

if ndims(data)~=3
  msg = makemsg('VNot3D','V must be a 3D array.');
  return
end
if min(sz)<2
  msg = makemsg('VPlanar','V must be size 2x2x2 or greater.'); 
  return
end

nonempty = ~[isempty(x) isempty(y) isempty(z)];
if any(nonempty) && ~all(nonempty)
  msg = makemsg('XYZMixedEmpty','X,Y,Z must all be empty or all non-empty.');
  return;
end

if ~isempty(nx) && ~isequal(size(nx), sz)
  nx = nx(:);
  if length(nx)~=sz(2)
    msg = makemsg('XVSizeMismatch','The size of X must match the size of V or the number of columns of V.');
    return
  else
    nx = repmat(nx',[sz(1) 1 sz(3)]);
  end
end

if ~isempty(ny) && ~isequal(size(ny), sz)
  ny = ny(:);
  if length(ny)~=sz(1)
    msg = makemsg('YVSizeMismatch','The size of Y must match the size of V or the number of rows of V.');
    return
  else
    ny = repmat(ny,[1 sz(2) sz(3)]);
  end
end

if ~isempty(nz) && ~isequal(size(nz), sz)
  nz = nz(:);
  if length(nz)~=sz(3)
    msg = makemsg('ZVsizeMismatch','The size of Z must match the size of V or the number of pages of V.');
    return
  else
    nz = repmat(reshape(nz,[1 1 length(nz)]),[sz(1) sz(2) 1]);
  end
end

function msg = makemsg(id,str)
msg.identifier = ['MATLAB:xyzvcheck:' id];
msg.message = str;
