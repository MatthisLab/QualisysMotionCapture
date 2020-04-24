function [numFrames,framerate,markerLabels,data_mar_dim_frame] ... 
    = loadPhaseSpaceMoCapData(fileName)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%loadPhaseSpaceMoCapData outputs various variables from the file name 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Load file based on fileName
load([fileName '.mat']);

%% Extract variables from data and put into struct

% startFrames = data.startFrame;
% endFrames = data.endFrame;
numFrames = endFrame;  % - startFrames;
% framerate = framerate;
markerLabels = (marNames).';
data_mar_dim_frame = permute(c3dData.c3dData_fr_mar_dim,[2,3,1]);     %major data set
% comXYZ = permute(comXYZ,[2,1]);   %load com of points


% unknownID = 13;
% unknownID = squeeze(data_mar_dim_frame(15, 1:3, :)); %(nanmean


%% Modifications to be done 
% function [collectedData] ... 
%     = loadPhaseSpaceMoCapData(fileName)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %loadPhaseSpaceMoCapData outputs various variables from the file name 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% %% Load file based on fileName
% collectedData.data = load([fileName '.mat']);
% 
% %% Extract variables from data and put into struct
% 
% collectedData.startFrames = data.startFrame;
% % endFrames = data.endFrame;
% collectedData.numFrames = data.endFrame;  % - startFrames;
% collectedData.framerate = data.c3dData.framerate;
% collectedData.markerLabels = (data.c3dData.markerNames).';
% collectedData.marker_mar_dim_frame = permute(data.c3d_fr_mar_dim,[2,3,1]);     %major data set
% collectedData.comXYZ = permute(data.comXYZ, [2,1]);   %load com of points

end
