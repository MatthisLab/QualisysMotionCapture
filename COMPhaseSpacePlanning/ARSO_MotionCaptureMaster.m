%ARSO_MotionCaptureMaster
clc
clear all
close all

cd('/Users/MT/Documents/GitHub/MotionCapture_MATLABCode/COMPhaseSpacePlanning');

addpath(genpath(cd)) %%add the current folder & subfolders to the path (so Matlab can see the BTK methods)

%% Initial conditions
mmHeight = 1;
kgMass   = 1;

%% bodySegLength function
% Function outputs length for individual body segs
[bodySegLength] = calcBodySegLength(mmHeight);

%% calcBodySegMass function
% Function outputs mass for individual body segs
[bodySegMass,segPropWeight] = calcBodySegMass(kgMass);

%% loadPhaseSpaceMoCapData function loads Phase Space Planning data
% [data,startFrames,numFrames,framerate,markerLabels,data_mar_dim_frame,comXYZ] ... 
%     = loadPhaseSpaceMoCapData(fileName);

for iter = 1:3
    %% Identify location where files are stored
    cd('/Users/MT/Documents/GitHub/MotionCapture_MATLABCode/COMPhaseSpacePlanning');
    %     cd('C:\Users\jonma\Dropbox\ResearchProjects\COMPhaseSpacePlanning\sub01\c3d')
     
    switch iter
        
        case 1
            condTitle = 'Free Walking';
            fid = 'trial011';
            
        case 2
            condTitle = 'Full Vision';
            fid = 'trial042';
            
        case 3
            condTitle = 'Limited Vision';
            fid = 'trial015';
    end
    
    %% Load data from specific fid
    [framerate,markerLabels,data_mar_dim_frame,comXYZ] ... 
    = loadPhaseSpaceMoCapData(fid);
    
%     clf(f)
%     close all
    
    %% Filter data using butterworth
    order   = 4;
    cutoff  = 7;
    
    [data_mar_dim_frame] = butterLowZero(order,cutoff,framerate,data_mar_dim_frame); %left(1:numel(markerLabels),:,:) right(1:numel(markerLabels),1:3,:) Butterworth filter each marker's data and load it into the trial
    %take markers from filtered and unfiltered data and compare velocity
    %data
    %% Identify all heel-toe step locations
%     [allSteps,step_hs_to_ft_XYZ,peaks,calcData] = ZeniStepFinder_ccpVid_modified(data_mar_dim_frame, markerLabels,framerate);

    %% Store trials data in struct
    if fid == 'trial011' %condTitle == 'Free Walking'
        processedData.FreeWalkingData.filteredData =            data_mar_dim_frame;
%         processedData.FreeWalkingData.allSteps =                allSteps;
%         processedData.FreeWalkingData.step_hs_to_ft_XYZ =       step_hs_to_ft_XYZ;
%         processedData.FreeWalkingData.peaks =                   peaks;
        
        %% calcSegCOM function
        % Function outputs totalCOM considering marker location
        [segCenter] = calcPhaseSpaceSegCOM(data_mar_dim_frame,markerLabels); %,markerID)
        FreeWalking.segCenter = segCenter; %{iter}
        
        %% calcSegWeightCOM function
        %Function outputs totalCOM depending on seg weight
        [totalCOMXYZ] = calcSegWeightCOM(segCenter,segPropWeight);
        FreeWalking.totalCOMXYZ = totalCOMXYZ;
        
%         %% locEmptySegFrames function
%         % Function outputs marker frames evaluation
%         clc
%         [emptyFrames] = locEmptySegFrames(segCenter,totalCOMXYZ);
        
        %% calcMarVel
        [marVel] = calcMarVel(FreeWalking.totalCOMXYZ);
        FreeWalking.COMVel = marVel.';
        
%         %right ankle velocity, acceleration, and jerk
%         processedData.FreeWalkingData.rAnkVel2D =               calcData.rAnkVel2D;
%         processedData.FreeWalkingData.rAnkAcc2D =               calcData.rAnkAcc2D;
%         processedData.Jerk.FreeWalkingRAnkJerk2D =              sum(calcData.rAnkJerk2D);
%         
%         %left ankle velocity, acceleration, and jerk
%         processedData.FreeWalkingData.lAnkVel2D =               calcData.lAnkVel2D;
%         processedData.FreeWalkingData.lAnkAcc2D =               calcData.lAnkAcc2D;
%         processedData.Jerk.FreeWalkingLAnkJerk2D =              sum(calcData.lAnkJerk2D);
%         processedData.Jerk.SumFreeWalkingJerk2D =               processedData.Jerk.FreeWalkingRAnkJerk2D + processedData.Jerk.FreeWalkingLAnkJerk2D;
        
%         %% Plots for debugging velocity
%         figure(11)
%         subplot(3,2,1)
%         plot(calcData.rAnkVel2D,'r-o','MarkerSize',2)
%         hold on
%         plot(calcData.rTO,0,'mo')
%         plot(calcData.rHS,0,'mx')
%         grid on
%         title('Right Ankle Velocity')
%         % ylim([-10 10])
%         
%         subplot(3,2,2)
%         plot(calcData.lAnkVel2D, 'b-o','MarkerSize',2)
%         hold on
%         plot(calcData.lTO,0,'mo')
%         plot(calcData.lHS,0,'mx')
%         grid on
%         title('Left Ankle Velocity')
%         ylim([-10 10])
%         hold on
%         
%         %% Plots for debugging acceleration code
%         subplot(3,2,3)
%         plot(calcData.rAnkAcc2D,'r-o','MarkerSize',2)
%         hold on
%         plot(calcData.rTO,0,'mo')
%         plot(calcData.rHS,0,'mx')
%         title('Right Ankle Acceleration')
%         % ylim([-1 1])
%         
%         subplot(3,2,4)
%         plot(calcData.lAnkAcc2D, 'b-o','MarkerSize',2)
%         hold on
%         plot(calcData.lTO,0,'mo')
%         plot(calcData.lHS,0,'mx')
%         title('Left Ankle Acceleration')
%         % ylim([-1 1])
%         
%         %% Plots for debugging jerk code
%         subplot(3,2,5)
%         plot(calcData.rAnkJerk2D,'r-o','MarkerSize',2)
%         hold on
%         plot(calcData.rTO,0,'mo')
%         plot(calcData.rHS,0,'mx')
%         title('Right Ankle Jerk')
%         % ylim([0 0.008])
%         
%         subplot(3,2,6)
%         plot(calcData.lAnkJerk2D, 'b-o','MarkerSize',2)
%         hold on
%         plot(calcData.lTO,0,'mo')
%         plot(calcData.lHS,0,'mx')
%         title('Left Ankle Jerk')
%         % ylim([0 0.035])
%         
    end

    if fid == 'trial042' %condTitle == 'Full Vision'
%         processedData.FullVisionData.filteredData =             data_mar_dim_frame;
%         processedData.FullVisionData.allSteps =                 allSteps;
%         processedData.FullVisionData.step_hs_to_ft_XYZ =        step_hs_to_ft_XYZ;
%         processedData.FullVisionData.peaks =                    peaks;
        
        %% calcSegCOM function
        % Function outputs totalCOM considering marker location
        [segCenter] = calcPhaseSpaceSegCOM(data_mar_dim_frame,markerLabels); %,markerID)
        FullVision.segCenter = segCenter; %{iter(1,2)}
        
        %% calcSegWeightCOM function
        %Function outputs totalCOM depending on seg weight
        [totalCOMXYZ] = calcSegWeightCOM(segCenter,segPropWeight);
        FullVision.totalCOMXYZ = totalCOMXYZ;
        
        %% calcMarVel
        [marVel] = calcMarVel(FullVision.totalCOMXYZ);
        FullVision.COMVel = marVel.';
        
%         %right ankle velocity, acceleration, and jerk
%         processedData.FullVisionData.rAnkVel2D =                calcData.rAnkVel2D;
%         processedData.FullVisionData.rAnkAcc2D =                calcData.rAnkAcc2D;
%         processedData.Jerk.FullVisionRAnkJerk2D =               sum(calcData.rAnkJerk2D);
%         
%         %left ankle velocity, acceleration, and jerk
%         processedData.FullVisionData.lAnkVel2D =                calcData.lAnkVel2D;
%         processedData.FullVisionData.lAnkAcc2D =                calcData.lAnkAcc2D;
%         processedData.Jerk.FullVisionLAnkJerk2D =               sum(calcData.lAnkJerk2D);
%         processedData.Jerk.SumFullVisionJerk2D =                processedData.Jerk.FullVisionRAnkJerk2D + processedData.Jerk.FullVisionLAnkJerk2D;
        
%         %% Plots for debugging velocity
%         figure(42)
%         subplot(3,2,1)
%         plot(calcData.rAnkVel2D,'r-o','MarkerSize',2)
%         hold on
%         plot(calcData.rTO,0,'mo')
%         plot(calcData.rHS,0,'mx')
%         grid on
%         title('Right Ankle Velocity')
%         % ylim([-10 10])
%         
%         subplot(3,2,2)
%         plot(calcData.lAnkVel2D, 'b-o','MarkerSize',2)
%         hold on
%         plot(calcData.lTO,0,'mo')
%         plot(calcData.lHS,0,'mx')
%         grid on
%         title('Left Ankle Velocity')
%         ylim([-10 10])
%         hold on
%         
%         %% Plots for debugging acceleration code
%         subplot(3,2,3)
%         plot(calcData.rAnkAcc2D,'r-o','MarkerSize',2)
%         hold on
%         plot(calcData.rTO,0,'mo')
%         plot(calcData.rHS,0,'mx')
%         title('Right Ankle Acceleration')
%         % ylim([-1 1])
%         
%         subplot(3,2,4)
%         plot(calcData.lAnkAcc2D, 'b-o','MarkerSize',2)
%         hold on
%         plot(calcData.lTO,0,'mo')
%         plot(calcData.lHS,0,'mx')
%         title('Left Ankle Acceleration')
%         % ylim([-1 1])
%         
%         %% Plots for debugging jerk code
%         subplot(3,2,5)
%         plot(calcData.rAnkJerk2D,'r-o','MarkerSize',2)
%         hold on
%         plot(calcData.rTO,0,'mo')
%         plot(calcData.rHS,0,'mx')
%         title('Right Ankle Jerk')
%         % ylim([0 0.008])
%         
%         subplot(3,2,6)
%         plot(calcData.lAnkJerk2D, 'b-o','MarkerSize',2)
%         hold on
%         plot(calcData.lTO,0,'mo')
%         plot(calcData.lHS,0,'mx')
%         title('Left Ankle Jerk')
%         % ylim([0 0.035])
%         
%     
    end
    
    if fid == 'trial015' %condTitle == 'Limited Vision'
%         processedData.LimitedVisionData.filteredData =          data_mar_dim_frame;
%         processedData.LimitedVisionData.allSteps =              allSteps;
%         processedData.LimitedVisionData.step_hs_to_ft_XYZ =     step_hs_to_ft_XYZ;
%         processedData.LimitedVisionData.peaks =                 peaks;
        
        %% calcSegCOM function
        % Function outputs totalCOM considering marker location
        [segCenter] = calcPhaseSpaceSegCOM(data_mar_dim_frame,markerLabels); %,markerID)
        LimitedVision.segCenter = segCenter;
        
        %% calcSegWeightCOM function
        %Function outputs totalCOM depending on seg weight
        [totalCOMXYZ] = calcSegWeightCOM(segCenter,segPropWeight);
        LimitedVision.totalCOMXYZ = totalCOMXYZ;
        
        %% calcMarVel
        [marVel] = calcMarVel(LimitedVision.totalCOMXYZ);
        LimitedVision.COMVel = marVel.';
        
%         %right ankle velocity, acceleration, and jerk
%         processedData.LimitedVisionData.rAnkVel2D =             calcData.rAnkVel2D;
%         processedData.LimitedVisionData.rAnkAcc2D =             calcData.rAnkAcc2D;
%         processedData.Jerk.LimitedVisionRAnkJerk2D =            sum(calcData.rAnkJerk2D);
%         
%         %left ankle velocity, acceleration, and jerk
%         processedData.LimitedVisionData.lAnkVel2D =             calcData.lAnkVel2D;
%         processedData.LimitedVisionData.lAnkAcc2D =             calcData.lAnkAcc2D;
%         processedData.Jerk.LimitedVisionLAnkJerk2D =            sum(calcData.lAnkJerk2D);
%         processedData.Jerk.SumLimitedVisionJerk2D =             processedData.Jerk.LimitedVisionRAnkJerk2D + processedData.Jerk.LimitedVisionLAnkJerk2D;
%         
%         %% Plots for debugging velocity
%         figure(15)
%         subplot(3,2,1)
%         plot(calcData.rAnkVel2D,'r-o','MarkerSize',2)
%         hold on
%         plot(calcData.rTO,0,'mo')
%         plot(calcData.rHS,0,'mx')
%         grid on
%         title('Right Ankle Velocity')
%         % ylim([-10 10])
%         
%         subplot(3,2,2)
%         plot(calcData.lAnkVel2D, 'b-o','MarkerSize',2)
%         hold on
%         plot(calcData.lTO,0,'mo')
%         plot(calcData.lHS,0,'mx')
%         grid on
%         title('Left Ankle Velocity')
%         ylim([-10 10])
%         hold on
%         
%         %% Plots for debugging acceleration code
%         subplot(3,2,3)
%         plot(calcData.rAnkAcc2D,'r-o','MarkerSize',2)
%         hold on
%         plot(calcData.rTO,0,'mo')
%         plot(calcData.rHS,0,'mx')
%         title('Right Ankle Acceleration')
%         % ylim([-1 1])
%         
%         subplot(3,2,4)
%         plot(calcData.lAnkAcc2D, 'b-o','MarkerSize',2)
%         hold on
%         plot(calcData.lTO,0,'mo')
%         plot(calcData.lHS,0,'mx')
%         title('Left Ankle Acceleration')
%         % ylim([-1 1])
%         
%         %% Plots for debugging jerk code
%         subplot(3,2,5)
%         plot(calcData.rAnkJerk2D,'r-o','MarkerSize',2)
%         hold on
%         plot(calcData.rTO,0,'mo')
%         plot(calcData.rHS,0,'mx')
%         title('Right Ankle Jerk')
%         % ylim([0 0.008])
%         
%         subplot(3,2,6)
%         plot(calcData.lAnkJerk2D, 'b-o','MarkerSize',2)
%         hold on
%         plot(calcData.lTO,0,'mo')
%         plot(calcData.lHS,0,'mx')
%         title('Left Ankle Jerk')
%         % ylim([0 0.035])
%         
%         
    end   
    
end
% close all

%% butterworth filter application
% order   = 4;
% cutoff  = 7;
% clc
% close all
% [data_mar_dim_frame(1:numel(markerLabels),:,:)] = butterLowZero(order,cutoff,framerate,data_mar_dim_frame(1:numel(markerLabels),1:3,:)); %Butterworth filter each marker's data and load it into the trial

% for m = 1:numel(markerLabels)
%     if sum(sum(data_mar_dim_frame(m,1:3,:))) == 0
%         data_mar_dim_frame(m,:,:) = nan(size(data_mar_dim_frame(m,1:3,:)));
%     else
%         data_mar_dim_frame(m,1:3,:)(data_mar_dim_frame(m,1:3,:))==0) == nan;
%         data_mar_dim_frame(m,:,:) = butterLowZero(order,cutoff,framerate,(data_mar_dim_frame(m,1:3,:))); %Butterworth filter each marker's data and load it into the trial
%     end
% end

% [allSteps,step_hs_to_ft_XYZ,peaks] = ZeniStepFinder_ccpVid_modified(data_mar_dim_frame, markerLabels,framerate);
% [allSteps, step_fr_ft_XYZ]= ZeniStepFinder_ccpVid(data_mar_dim_frame, markerLabels);

%% Insert function that detects the subjects movement


% %% bodySegLength function
% % Function outputs length for individual body segs
% [bodySegLength] = calcBodySegLength(mmHeight);
% 
% %% calcBodySegMass function
% % Function outputs mass for individual body segs
% [bodySegMass,segPropWeight] = calcBodySegMass(kgMass);
% 
% %% calcSegCOM function
% % Function outputs totalCOM considering marker location 
% [segCenter] = calcPhaseSpaceSegCOM(data_mar_dim_frame,markerLabels); %,markerID)
% 
% %% calcSegWeightCOM function
% % Function outputs totalCOM depending on seg weight
% [totalCOMXYZ] = calcSegWeightCOM(segCenter,segPropWeight);

% %% Plot data
% figure(6801)
% 
% for fr = 1:10:numFrames
%     %Clear current frame
%     clf
% 
%     %Plot all markers in x,y, and z
%     plot3(data_mar_dim_frame(:, 1, fr),...
%         data_mar_dim_frame(:, 2, fr),...
%         data_mar_dim_frame(:, 3, fr),'k.','MarkerFaceColor','k')
%     
%     hold on
%     
% %     %% Uncover the unknown marker location
% %     plot3(unknownID(1,fr),...
% %         unknownID(2,fr),...
% %         unknownID(3,fr),'p','DisplayName','LSHO');
% 
%     %% Total Body COM in 3D
%     %plot of total anatomical COM
%     plot3(comXYZ(1,fr),...
%         comXYZ(2,fr),...
%         comXYZ(3,fr),'p','DisplayName','COMXYZ');
%     
%     %% Total Body COM in 3D
%     %plot of total anatomical COM
% %     plot3(totalCOMXYZ(1,fr),...
% %         totalCOMXYZ(2,fr),...
% %         totalCOMXYZ(3,fr),'p','DisplayName','TotalCOMXYZ');
%     
%     %% Plotting parameters
%     axis equal
%     grid on
%     legend
%     
%     %optimal x y z graph limits 
%     xlim([-1e3 5e3])
%     ylim([-1e3 1e3]) %full lab
% %    ylim([1e3 3e3]) %smaller space
%     zlim([0 3e3])
%     
%     %unsure of what this section XYZs
%     az = -84.362;
%     el =  20.417;
%     view(az,el)
%     
%     
%    drawnow
% end

