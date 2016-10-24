function dct3DDrawIsosfc(voxels)
figure1 = figure;
clf;

% axes1 = axes('Parent',figure1,'ZColor',[1 1 1],'YColor',[1 1 1],...
%     'XColor',[1 1 1],...
%     'Position',[0 0 1 1],...
%     'DataAspectRatio',[1 1 1]);
% xlim(axes1,[-100 400]);
% ylim(axes1,[0 300]);
% zlim(axes1,[0 200]);
% view([0 -90]);
% % patch(isosfc, axes1, 'Facecolor', [0.75 0.75 0.75], 'EdgeColor', 'none');
% p2 = patch(isosfc, 'Facecolor', [0.75 0.75 0.75], 'EdgeColor', 'none');
% isonormals(voxels,p2);

% camlight('headlight');
% daspect([1 1 1]);

%  voxels = smooth3(voxels, 'box', 5);

p2 = patch(isosurface(voxels,0),...
    'FaceColor','red','EdgeColor','none');
myisonormals(voxels,p2)
view(3); daspect([1 1 1]); axis tight
camlight;  camlight(-80,-10); lighting phong; 