function [params, names] = fgplvmExtractParamFixedX(model)

if nargout > 1
  returnNames = true;
else
  returnNames = false;
end  

if returnNames
  [params, names] = gpExtractParamFixedX(model);
else
  params = gpExtractParamFixedX(model);
end