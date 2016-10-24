function fileName = modelWriteResult(model, dataset, number)

% MODELWRITERESULT Write a model to file.
%
%	Description:
%
%	FILENAME = MODELWRITERESULT(MODEL, DATASETNAME, NUMBER) writes a
%	model to file.
%	 Returns:
%	  FILENAME - the file name used.
%	 Arguments:
%	  MODEL - the model to be written to file.
%	  DATASETNAME - data set name.
%	  NUMBER - the experiment number.
%	
%
%	See also
%	MODELCREATE


%	Copyright (c) 2009 Neil D. Lawrence
% 	modelWriteResult.m SVN version 545
% 	last update 2009-10-08T12:21:14.096755Z

  dataset(1) = upper(dataset(1));
  type = model.type;
  type(1) = upper(type(1));
  fileName = ['dem' dataset type num2str(number)];

  fhandle = [model.type 'WriteResult'];
  if exist(fhandle)==2
    % There is write file code, use it.
    fhandle = str2func(fhandle);
    fileName = fhandle(model, dataset, number);
  else
    fhandle = [model.type 'Deconstruct'];
    if exist(fhandle)==2
      % There is deconstruct code, use it to deconstruct.
      varName = [model.type 'Info'];
      eval([varName ' = ' fhandle '(model);'])
      save(fileName, varName);
    else
      % No code is provided, just save model.
      save(fileName, 'model');
    end
  end
end