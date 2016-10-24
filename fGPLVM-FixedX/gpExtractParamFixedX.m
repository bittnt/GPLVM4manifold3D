function [params, names] = gpExtractParamFixedX(model)

if nargout > 1
  returnNames = true;
else
  returnNames = false;
end

if returnNames
  [params, names] = kernExtractParam(model.kern);
  for i = 1:length(names)
    names{i} = ['Kernel, ' names{i}];
  end
else
  params = kernExtractParam(model.kern);
end