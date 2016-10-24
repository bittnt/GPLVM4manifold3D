function handle = vectorModify(handle, vals, latentPos, params)

% VECTORMODIFY Helper code for visualisation of vectorial data.
%
%	Description:
%	handle = vectorModify(handle, values)
%% 	vectorModify.m CVS version 1.2
% 	vectorModify.m SVN version 24
% 	last update 2007-03-27T18:20:37.409099Z

set(handle, 'YData', vals);
fprintf('%f %f \n', params(1), params(2));