
% DEMSUBSKELS Load in the walk1 skeleton and motion capture, then break up into sub skels and learn models on each sub skel.
%
%	Description:
%	

%	Copyright (c) 2007 Neil D. Lawrence
% 	demSubskels.m version 1.2


global visualiseInfo;


skel = acclaimReadSkel('examples/walk1.asf');
[channels, skel] = acclaimLoadChannels('examples/walk1.amc', skel);
[subskel, subchans] = skelGetSubSkel(skel, 'root', channels, {'lhipjoint'});

%remove x and z global movement, and sub sample
subchans(:, [1 3]) = zeros(size(channels, 1), 2);
Y = subchans(1:4:end, :);


%Set up model, use Full Training Conditional (ftc)
options = fgplvmOptions('ftc');
latentDim = 2;
d = size(Y, 2);

model1 = fgplvmCreate(latentDim, d, Y, options);
%set all labels to 1 (they seem to be that for bvh examples)
labels = ones(size(model1.y, 1), 1);

%Optimise
%iters = 1000;
%display = 1;
%model = fgplvmOptimise(model, display, iters);

%find the max value of the channels index
maxInd = 0;
for i=1:length(subskel.tree)
    for j=1:length(subskel.tree(i).rotInd)
        if subskel.tree(i).rotInd(j) > maxInd
            maxInd = subskel.tree(i).rotInd(j);
        end
    end
    for j=1:length(subskel.tree(i).posInd)
        if subskel.tree(i).posInd(j) > maxInd
            maxInd = subskel.tree(i).posInd(j);
        end
    end
end
padding = maxInd - size(model1.y, 2);

figure(1);
%define a main 'canvas' axes for plotting lines joining up subplots
main = axes('Position', [0 0 1 1], 'Visible', 'Off', 'Xlim', [0 1], 'YLim', [0 1]);

set(gcf, 'WindowButtonMotionFcn', 'testFunc(''move'')');
set(gcf, 'WindowButtonDownFcn', 'testFunc(''click'')');
%global subPlotHandle;
%spWidth = (fWidth - 2*fPadding) / 2;
%spHeight = (fHeight - 2*fPadding) / 2;
%[fWidth/3 + fPadding, fHeight/2 + fPadding, spWidth, spHeight]

plot1 = axes('Position', [0.1, 1/6, 0.25, 0.25]);
title('Left Leg');
%subplot(2, 2, 3);
%subPlotHandle = gca;
%sub1Handle = gca;
set(gca, 'UserData', 1);
%set(gca, 'ButtonDownFcn', 'testFunc(''click'', sub1Handle)')
fgplvmVisualise(model1, labels, [skel.type 'Visualise'], 'skelModify', ...
                1, subskel, padding);
visualiseInfo(1).visualiseFunction = str2func([skel.type 'Visualise']);
visualiseInfo(1).visHandle = plotSubskel(visualiseInfo(1), model1, subskel);
            

[subskel, subchans] = skelGetSubSkel(skel, 'root', channels, {'rhipjoint'});

%remove x and z global movement, and sub sample
subchans(:, [1 3]) = zeros(size(channels, 1), 2);
Y = subchans(1:4:end, :);


%Set up model, use Full Training Conditional (ftc)
options = fgplvmOptions('ftc');
latentDim = 2;
d = size(Y, 2);

model2 = fgplvmCreate(latentDim, d, Y, options);
%set all labels to 1 (they seem to be that for bvh examples)
labels = ones(size(model2.y, 1), 1);

%Optimise
%iters = 1000;
%display = 1;
%model = fgplvmOptimise(model, display, iters);

%find the max value of the channels index
maxInd = 0;
for i=1:length(subskel.tree)
    for j=1:length(subskel.tree(i).rotInd)
        if subskel.tree(i).rotInd(j) > maxInd
            maxInd = subskel.tree(i).rotInd(j);
        end
    end
    for j=1:length(subskel.tree(i).posInd)
        if subskel.tree(i).posInd(j) > maxInd
            maxInd = subskel.tree(i).posInd(j);
        end
    end
end
padding = maxInd - size(model2.y, 2);

figure(1);

%subplot(2, 2, 4);
plot2 = axes('Position', [0.65, 1/6, 0.25, 0.25]);
title('Right Leg');
%subPlotHandle = gca;
%sub2Handle = gca;
set(gca, 'UserData', 2);
%set(gca, 'ButtonDownFcn', 'testFunc(''click'', sub2Handle)')
fgplvmVisualise(model2, labels, [skel.type 'Visualise'], 'skelModify', ...
                2, subskel, padding);
visualiseInfo(2).visualiseFunction = str2func([skel.type 'Visualise']);
visualiseInfo(2).visHandle = plotSubskel(visualiseInfo(2), model2, subskel);           
            
%Latent space for both legs, learned from each leg's latent space :-o
%Set up model, use Full Training Conditional (ftc)
options = fgplvmOptions('ftc');
Y = [model1.X model2.X];
latentDim = 2;
d = size(Y, 2);

model3 = fgplvmCreate(latentDim, d, Y, options);
%set all labels to 1 (they seem to be that for bvh examples)
labels = ones(size(model3.X, 1), 1);

figure(1);

%subplot(2, 2, 1:2);
plot3 = axes('Position', [0.375, 0.5833, 0.25, 0.25]);
title('Both Legs');
%subPlotHandle = gca;
%sub2Handle = gca;
set(gca, 'UserData', 3);

%set(gca, 'ButtonDownFcn', 'testFunc(''click'', sub2Handle)')
fgplvmVisualise(model3, labels, [skel.type 'Visualise'], 'skelModify', ...
                3, subskel, padding);
            
                
%plot connecting lines
plot1Rect = get(plot1, 'Position');
plot2Rect = get(plot2, 'Position');
plot3Rect = get(plot3, 'Position');
parentX = plot3Rect(1) + plot3Rect(3)/2;

set(gcf, 'CurrentAxes', main);
line([parentX, plot1Rect(1) + plot1Rect(3)/2], ...
    [plot3Rect(2), plot1Rect(2) + plot1Rect(4)], 'Color', 'k');
line([parentX, plot2Rect(1) + plot2Rect(3)/2], ...
    [plot3Rect(2), plot2Rect(2) + plot2Rect(4)], 'Color', 'k');
            
                

            
