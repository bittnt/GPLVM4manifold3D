randn('seed', 1e5);
rand('seed', 1e5);

optionsChF = fgplvmOptions('ftc');
optionsChF.optimiser = 'scg';
optionsChF.back = 'kbr';
optionsChF.backOptions = kbrOptions(dct3ds_dt);
optionsChF.backOptions.kern = kernCreate(dct3ds_dt, 'rbf');
optionsChF.backOptions.kern.inverseWidth = 0.0001;

modelChF_02D = fgplvmCreate(2, dct3ds_dt, optionsChF);
modelChF_02D = fgplvmOptimise(modelChF_02D, 1, 500);
varsigmaChF = fgplvmCreatePlotDataVariance2D(modelChF_02D);

% save('02.mat');

% modelChF_04D = fgplvmCreate(4, dct3ds_dt, optionsChF);
% modelChF_04D = fgplvmOptimise(modelChF_04D, 1, 1000);

% save('04.mat');

% modelChF_06D = fgplvmCreate(6, dct3ds_dt, optionsChF);
% modelChF_06D = fgplvmOptimise(modelChF_06D, 1, 750);

% save('06.mat');
% 
% modelChF_08D = fgplvmCreate(8, dct3ds_dt, optionsChF);
% modelChF_08D = fgplvmOptimise(modelChF_08D, 1, 750);
% 
% save('08.mat');
% 
% modelChF_10D = fgplvmCreate(10, dct3ds_dt, optionsChF);
% modelChF_10D = fgplvmOptimise(modelChF_10D, 1, 750);
% 
% save('10.mat');
% 
% modelChF_03D = fgplvmCreate(3, dct3ds_dt, optionsChF);
% modelChF_03D = fgplvmOptimise(modelChF_03D, 1, 750);
% 
% save('03.mat');
% 
% modelChF_05D = fgplvmCreate(5, dct3ds_dt, optionsChF);
% modelChF_05D = fgplvmOptimise(modelChF_05D, 1, 750);
% 
% save('05.mat');
% 
% modelChF_07D = fgplvmCreate(7, dct3ds_dt, optionsChF);
% modelChF_07D = fgplvmOptimise(modelChF_07D, 1, 1000);
% 
% save('07.mat');
% 
% modelChF_09D = fgplvmCreate(9, dct3ds_dt, optionsChF);
% modelChF_09D = fgplvmOptimise(modelChF_09D, 1, 1000);
% 
% save('09.mat');
