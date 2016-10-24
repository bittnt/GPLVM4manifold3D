clear;

randn('seed', 1e5);
rand('seed', 1e5);

load dct3ds_sofa;

optionsSofa = fgplvmOptions('ftc');
optionsSofa.optimiser = 'scg';
optionsSofa.back = 'kbr';
optionsSofa.backOptions = kbrOptions(dct3ds_dt);
optionsSofa.backOptions.kern = kernCreate(dct3ds_dt, 'rbf');
optionsSofa.backOptions.kern.inverseWidth = 0.0001;

modelSofa_02D = fgplvmCreate(2, dct3ds_dt, optionsSofa);
modelSofa_02D = fgplvmOptimise(modelSofa_02D, 1, 500);
varsigmaSofa = fgplvmCreatePlotDataVariance2D(modelSofa_02D);

save('Sofa_02.mat');

clear modelSofa_02D modelSofa_02D varsigmaSofa;

modelSofa_05D = fgplvmCreate(5, dct3ds_dt, optionsSofa);
modelSofa_05D = fgplvmOptimise(modelSofa_05D, 1, 750);
 
save('Sofa_05.mat');