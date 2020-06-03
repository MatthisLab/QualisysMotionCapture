function [markerLabels,numMarkers,marker_mar_dim_frame,Force] ... 
    = loadMoCapData(fileName)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%loadMoCapData outputs various variables from the file name 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Load acquired motion capture data
%load file type of fileName and store into data variable
data = load([fileName '.mat']);

%strrep replaces substring of fileName with consistent naming convention
data = data.(['qtm_' strrep(fileName, '-', '_')]);

%% Initial conditions
Force = [];
order = 4;
cutoff = 7;
numFrames = data.Frames;
moCap_framerate = data.FrameRate;
forceplate_framerate = data.Force.Frequency;

%% Data filtering and restructuring
marker_mar_dim_frameRAW = data.Trajectories.Labeled.Data;
[marker_mar_dim_frame] = butterLowZero(order, cutoff, forceplate_framerate, marker_mar_dim_frameRAW);
markerLabels = data.Trajectories.Labeled.Labels;
numMarkers = data.Trajectories.Labeled.Count;

%% Filter acquired force plate data
%Final force plate data
Force.force_plate1 = data.Force(1).Force;
Force.force_plate2 = data.Force(2).Force;
Force.force_plate3 = data.Force(3).Force;
Force.force_plate4 = data.Force(4).Force;
Force.force_plate5 = data.Force(5).Force;

%Filter for force plate data if needed
% force_plate2 = data.Force(2).Force;
% [force_plate2] = butterLowZero(order, cutoff, forceplate_framerate, force_plate2);
% 
% force_plate3 = data.Force(3).Force;
% [force_plate3] = butterLowZero(order, cutoff, forceplate_framerate, force_plate3);
% 
% force_plate4 = data.Force(4).Force;
% [force_plate4] = butterLowZero(order, cutoff, forceplate_framerate, force_plate4);
% 
% force_plate5 = data.Force(5).Force;
% [force_plate5] = butterLowZero(order, cutoff, forceplate_framerate, force_plate5);
end

