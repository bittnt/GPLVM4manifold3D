clear;

randn('seed', 1e5);
rand('seed', 1e5);

load dct3ds_toilets;

optionsTlt = fgplvmOptions('ftc');
optionsTlt.optimiser = 'scg';
optionsTlt.back = 'kbr';
optionsTlt.backOptions = kbrOptions(dct3ds_dt);
optionsTlt.backOptions.kern = kernCreate(dct3ds_dt, 'rbf');
optionsTlt.backOptions.kern.inverseWidth = 0.0001;

modelTlt_02D = fgplvmCreate(2, dct3ds_dt, optionsTlt);
modelTlt_02D = fgplvmOptimise(modelTlt_02D, 1, 500);
varsigmaTlt = fgplvmCreatePlotDataVariance2D(modelTlt_02D);

save('Tlt_02.mat');

clear modelTlt_02D modelTlt_02D varsigmaTlt;

modelTlt_05D = fgplvmCreate(5, dct3ds_dt, optionsTlt);
modelTlt_05D = fgplvmOptimise(modelTlt_05D, 1, 750);
 
save('Tlt_05.mat');