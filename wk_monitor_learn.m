randn('seed', 1e5);
rand('seed', 1e5);

load dct3ds_monitor;

optionsMtr = fgplvmOptions('ftc');
optionsMtr.optimiser = 'scg';
optionsMtr.back = 'kbr';
optionsMtr.backOptions = kbrOptions(dct3ds_dt);
optionsMtr.backOptions.kern = kernCreate(dct3ds_dt, 'rbf');
optionsMtr.backOptions.kern.inverseWidth = 0.0001;

modelMtr_02D = fgplvmCreate(2, dct3ds_dt, optionsMtr);
modelMtr_02D = fgplvmOptimise(modelMtr_02D, 1, 500);
varsigmaMtr = fgplvmCreatePlotDataVariance2D(modelMtr_02D);

save('Mtr_02.mat');

clear modelMtr_02D modelMtr_02D varsigmaMtr;

modelMtr_05D = fgplvmCreate(5, dct3ds_dt, optionsMtr);
modelMtr_05D = fgplvmOptimise(modelMtr_05D, 1, 750);
 
save('Mtr_05.mat');