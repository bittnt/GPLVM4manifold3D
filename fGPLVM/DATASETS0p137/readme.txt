DATASETS software
Version 0p137		Sunday 06 Sep 2009 at 06:37

This toolbox stores datasets and gives commands for accessing them.

Version 0.137
-------------

Added loaders for speech grid corpus data.

Version 0.136
-------------

Added loader for  Agarwal and Triggs silhouette data back in, slight modifications of robot wireless datasets.

Version 0.135
-------------

Added loader for Swiss Jura data and toy data for multiple output GPs.

Version 0.134
-------------

Added movielens data loaders.

Version 0.133
-------------

Added variants of swiss roll data.

Version 0.132
-------------

Added loader for Spellman data and Ripley's crabs data. 

Version 0.131
-------------

Moved functionality from mappingLoadData, ivmLoadData and ncnmLoadData into mapLoadData.

Version 0.13
------------

Added processing for CMU data base motion capture figure 35. To load, the data should be downloaded from the CMU motion capture data base, http://mocap.cs.cmu.edu, and placed in baseDir/mocap/cmu/35/, where baseDir is the directory where you have placed 'datasetsDirectory.m'. You need the amc files and the asf file. 

Removed Example 86 motion 10 from the CMU motion capture data base.

Version 0.121
-------------

Modified robot traces example to reflect the fact that the data which is missing is genuinely missing rather than just reading low.

Version 0.12
------------

Added example 86 motion 10 in xyz format from CMU motion capture database: please credit the source of this data: http://mocap.cs.cmu.edu.

Added the datasetsDirectory.m command which makes use of the matlab which.m command to find out what directory it is in and returns this as the base directory for the datasets.

Added a command for reading in Excel spreadsheets as part of the same family as the other commands.

Version 0.11
------------

Added motion capture from Ohio State of a man running and vowel data from Jon Malkin at University of Washington.

Version 0.1
-----------

First release.


MATLAB Files
------------

Matlab files associated with the toolbox are:

datasetsDirectory.m: Returns directory where data is stored.
generateCrescentData.m: Generate crescent data.
parseWirelessData.m: Load wireless strength data.
datasetsToolboxes.m: Loads in toolboxes for DATASETS.
parseNobleKernelFile.m: Parse a kernel file from Bill Stafford Noble.
mocapParseText.m: Parse a motion capture text file.
xlsLoadData.m: Wrapper function for xlsread to get files from the datasets directory.
lvmLoadData.m: Load a latent variable model dataset.
mapLoadData.m: Load a mapping model dataset (e.g. classification, regression).
mocapConnections.m: Give a connection matrix for the motion capture data.
htkLoadMmf.m: File for loading synthesis data from HTK files.
mocapLoadTextData.m: Load a motion capture data set from a text file.
