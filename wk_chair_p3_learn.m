randn('seed', 1e5);
rand('seed', 1e5);

YChP3DCT3D = dct3ds_dt;

optionsChP3DCT3D = fgplvmOptions('ftc');
optionsChP3DCT3D.optimiser = 'scg';
optionsChP3DCT3D.back = 'kbr';
optionsChP3DCT3D.backOptions = kbrOptions(YChP3DCT3D);
optionsChP3DCT3D.backOptions.kern = kernCreate(YChP3DCT3D, 'rbf');
optionsChP3DCT3D.backOptions.kern.inverseWidth = 0.0001;

itersChP3DCT3D = 1000;

latentDimChP3DCT3D = 2;
modelChP3SmallDCT3D_2D = fgplvmCreate(latentDimChP3DCT3D, YChP3DCT3D, optionsChP3DCT3D);
modelChP3SmallDCT3D_2D = fgplvmOptimise(modelChP3SmallDCT3D_2D, 1, itersChP3DCT3D);

varsigmaChP3DCT3D_2D = fgplvmCreatePlotDataVariance2D(modelChP3SmallDCT3D_2D);

clear YChP3DCT3D itersChP3DCT3D;