randn('seed', 1e5);
rand('seed', 1e5);

YChP2DCT3D = dct3ds_dt;

optionsChP2DCT3D = fgplvmOptions('ftc');
optionsChP2DCT3D.optimiser = 'scg';
optionsChP2DCT3D.back = 'kbr';
optionsChP2DCT3D.backOptions = kbrOptions(YChP2DCT3D);
optionsChP2DCT3D.backOptions.kern = kernCreate(YChP2DCT3D, 'rbf');
optionsChP2DCT3D.backOptions.kern.inverseWidth = 0.0001;

itersChP2DCT3D = 1000;

latentDimChP2DCT3D = 2;
modelChP2SmallDCT3D_2D = fgplvmCreate(latentDimChP2DCT3D, YChP2DCT3D, optionsChP2DCT3D);
modelChP2SmallDCT3D_2D = fgplvmOptimise(modelChP2SmallDCT3D_2D, 1, itersChP2DCT3D);

varsigmaChP2DCT3D_2D = fgplvmCreatePlotDataVariance2D(modelChP2SmallDCT3D_2D);

clear YChP2DCT3D itersChP2DCT3D;