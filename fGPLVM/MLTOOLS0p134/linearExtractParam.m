function [params, names] = linearExtractParam(model);

% LINEAREXTRACTPARAM Extract weights from a linear model.
%
%	Description:
%	[params, names] = linearExtractParam(model);
%% 	linearExtractParam.m CVS version 1.3
% 	linearExtractParam.m SVN version 24
% 	last update 2007-03-27T18:20:27.224632Z

  params = [model.W(:)' model.b];
if nargout > 1
  counter = 0;
  for j = 1:size(model.W, 2)
    for i = 1:size(model.W, 1)
      counter = counter + 1;
      names{counter} = ['Weight ' num2str(i) '-' num2str(j)];
    end
  end
    for j = 1:size(model.b, 2)
    counter = counter + 1;
    names{counter} = ['Bias ' num2str(j)];
  end
end
  