function [segCenter,skeleton] = indexMars_Segs(marker_mar_dim_frame,markerLabels,skeleton_mar_dim_frame,skeleton_seg_names,trial_start_end,use_MarkerClusters)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%indexMars_Segs indexs mars and segs by start and end of trial
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Define output
%Update code using getMarker function to find location of segs for skeleton
segCenter = [];
skeleton = [];

%% Head markers indexing
%Index marker
segCenter.HeadL =               getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'HeadL');
segCenter.HeadTop =             getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'HeadTop');
segCenter.HeadR =               getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'HeadR');
segCenter.HeadFront =           getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'HeadFront');
segCenter.SpineTop =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'SpineTop');
segCenter.Chest =               getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'Chest');
segCenter.BackL =               getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'BackL');
segCenter.BackR =               getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'BackR');
segCenter.LHipFront =           getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'WaistLFront');
segCenter.LHipBack =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'WaistLBack');
segCenter.RHipFront =           getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'WaistRFront');
segCenter.RHipBack =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'WaistRBack');

%% Upper markers indexing
%Index markers
segCenter.LShoulderTop =        getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LShoulderTop');
segCenter.LShoulderBack =       getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LShoulderBack');
segCenter.RShoulderTop =        getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RShoulderTop');
segCenter.RShoulderBack =       getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RShoulderBack');
segCenter.LArm =                getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LArm');
segCenter.RArm =                getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RArm');
segCenter.LElbow =              getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LElbowOut');
segCenter.RElbow =              getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RElbowOut');
segCenter.LWristOut =           getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LWristOut');
segCenter.LWristIn =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LWristIn');
segCenter.LHandOut =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LHandOut');
segCenter.RWristOut =           getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RWristOut');
segCenter.RWristIn =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RWristIn');
segCenter.RHandOut =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RHandOut');

%% Lower marker indexing
%Index markers
segCenter.LThigh =              getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LThigh');
segCenter.RThigh =              getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RThigh');
segCenter.LKnee =               getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LKneeOut');
segCenter.RKnee =               getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RKneeOut');
segCenter.LLeg =                getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LShin');
segCenter.RLeg =                getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RShin');
segCenter.LAnkle =              getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LAnkleOut');
segCenter.RAnkle =              getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RAnkleOut');
segCenter.LHeel =               getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LHeelBack');
segCenter.RHeel =               getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RHeelBack');
segCenter.LForefoot =           getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LForefootOut');
segCenter.RForefoot =           getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RForefootOut');
segCenter.LToeTip =             getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LToeTip');
segCenter.RToeTip =             getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RToeTip');

%% Lower marker clusters indexing
if use_MarkerClusters
    segCenter.LUpLegCluster1 =      getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LeftUpLegCluster1');
    segCenter.LUpLegCluster2 =      getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LeftUpLegCluster2');
    segCenter.LUpLegCluster3 =      getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LeftUpLegCluster3');
    segCenter.LUpLegCluster4 =      getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LeftUpLegCluster4');
    segCenter.RUpLegCluster1 =      getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RightUpLegCluster1');
    segCenter.RUpLegCluster2 =      getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RightUpLegCluster2');
    segCenter.RUpLegCluster3 =      getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RightUpLegCluster3');
    segCenter.RUpLegCluster4 =      getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RightUpLegCluster4');
    
    segCenter.LLegCluster1 =        getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LeftLegCluster1');
    segCenter.LLegCluster2 =        getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LeftLegCluster2');
    segCenter.LLegCluster3 =        getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LeftLegCluster3');
    segCenter.LLegCluster4 =        getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LeftLegCluster4');
    segCenter.RLegCluster1 =        getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RightLegCluster1');
    segCenter.RLegCluster2 =        getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RightLegCluster2');
    segCenter.RLegCluster3 =        getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RightLegCluster3');
    segCenter.RLegCluster4 =        getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RightLegCluster4');
end

%% Torso segCenter indexing
%Includes: HeadL, HeadTop, HeadR, and HeadFront
head_MarkerNames =              {'HeadL' 'HeadTop' 'HeadR' 'HeadFront'};
[markerNum] =                   findMarNum(markerLabels,head_MarkerNames);

HeadL =                         getMarker(marker_mar_dim_frame,markerLabels,'HeadL');
HeadTop =                       getMarker(marker_mar_dim_frame,markerLabels,'HeadTop');
HeadR =                         getMarker(marker_mar_dim_frame,markerLabels,'HeadR');
HeadFront =                     getMarker(marker_mar_dim_frame,markerLabels,'HeadFront');

%For loop takes markerNames and restructues x,y,z dimensions to get their
%mean. Next step would be to have for loop reference head_MarkerNames and
%organize them accordingly

for jj = 1:3 %ref num dim
    headPos_raw{1,jj} =         cat(1,HeadL(jj,:),HeadTop(jj,:),HeadR(jj,:),HeadFront(jj,:));
    headPos(jj,:) =             mean(headPos_raw{1,jj},1);
end

%%Index head marker into struct
segCenter.HeadCenter =          headPos(:,trial_start_end);

%Identify the chest marker center
%Includes: Chest, SpineTop, BackL, and BackR
Chest_MarkerNames =             {'Chest' 'SpineTop' 'BackL' 'BackR'};
Chest =                         getMarker(marker_mar_dim_frame,markerLabels,'Chest');
SpineTop =                      getMarker(marker_mar_dim_frame,markerLabels,'SpineTop');
BackL =                         getMarker(marker_mar_dim_frame,markerLabels,'BackL');
BackR =                         getMarker(marker_mar_dim_frame,markerLabels,'BackR');

for jj = 1:3 %ref num dim
    ChestPos_raw{1,jj} =        cat(1,Chest(jj,:),SpineTop(jj,:),BackL(jj,:),BackR(jj,:));
    ChestPos(jj,:) =            mean(ChestPos_raw{1,jj},1);
end

%Index ChestCenter data into struct
segCenter.ChestCenter =         ChestPos(:,trial_start_end);

%Index Torso Center
%Includes: Chest, BackL, BackR
Neck_MarkerNames =             {'SpineTop' 'Chest'};
for jj = 1:3 %ref num dim
    NeckPos_raw{1,jj} =        cat(1,Chest(jj,:),SpineTop(jj,:));
    NeckPos(jj,:) =            mean(NeckPos_raw{1,jj},1);
end

segCenter.NeckCenter =         NeckPos(:,trial_start_end);

%Index Torso Center
%Includes: Chest, BackL, BackR
Torso_MarkerNames =             {'Chest' 'BackL' 'BackR'};
for jj = 1:3 %ref num dim
    TorsoPos_raw{1,jj} =        cat(1,Chest(jj,:),BackL(jj,:),BackR(jj,:));
    TorsoPos(jj,:) =            mean(TorsoPos_raw{1,jj},1);
end

segCenter.TorsoCenter =         TorsoPos(:,trial_start_end);

%Index Back Center
%Includes: BackL, BackR
Back_MarkerNames =              {'BackL' 'BackR'};
for jj = 1:3 %ref num dim
    BackPos_raw{1,jj} =         cat(1,BackL(jj,:),BackR(jj,:));
    BackPos(jj,:) =             mean(BackPos_raw{1,jj},1);
end

segCenter.BackCenter =          BackPos(:,trial_start_end);

%Index HipCenter
%Includes: WaistLFront, WaistLBack, WaistRFront, WaistRBack
Hip_MarkerNames =               {'WaistLFront' 'WaistLBack' 'WaistRFront' 'WaistRBack'};
WaistLFront =                   getMarker(marker_mar_dim_frame,markerLabels,'WaistLFront');
WaistLBack=                     getMarker(marker_mar_dim_frame,markerLabels,'WaistLBack');
WaistRFront =                   getMarker(marker_mar_dim_frame,markerLabels,'WaistRFront');
WaistRBack =                    getMarker(marker_mar_dim_frame,markerLabels,'WaistRBack');

for jj = 1:3 %ref num dim
    HipPos_raw{1,jj} =          cat(1,WaistLFront(jj,:),WaistLBack(jj,:),WaistRFront(jj,:),WaistRBack(jj,:));
    HipPos(jj,:) =              mean(HipPos_raw{1,jj},1);
end

segCenter.HipCenter =           HipPos(:,trial_start_end);

%Index LHipCenter
for jj = 1:3 %ref num dim
    LHipPos_raw{1,jj} =         cat(1,WaistLFront(jj,:),WaistLBack(jj,:));
    LHipPos(jj,:) =             mean(LHipPos_raw{1,jj},1);
end

%Output LHipCenter data into struct
segCenter.LHipCenter =          LHipPos(:,trial_start_end);

for jj = 1:3 %ref num dim
    RHipPos_raw{1,jj} =         cat(1,WaistRFront(jj,:),WaistRBack(jj,:));
    RHipPos(jj,:) =             mean(RHipPos_raw{1,jj},1);
end

%Output RHipCenter data into struct
segCenter.RHipCenter =          RHipPos(:,trial_start_end);

%% Shoulder segCenter indexing
%Index LShoulderCenter
%Includes: LShoulderTop and LShoulderBack
LShoulder_MarkerNames =         {'LShoulderTop' 'LShoulderBack'};
LShoulderTop =                  getMarker(marker_mar_dim_frame,markerLabels,'LShoulderTop');
LShoulderBack =                 getMarker(marker_mar_dim_frame,markerLabels,'LShoulderBack');

for jj = 1:3 %ref num dim
    LShoulderPos_raw{1,jj} =    cat(1,LShoulderTop(jj,:),LShoulderBack(jj,:));
    LShoulderPos(jj,:) =        mean(LShoulderPos_raw{1,jj},1);
end

segCenter.LShoulderCenter =     LShoulderPos(:,trial_start_end);

%Index RUpper
%Includes: RShoulderTop and RShoulderBack
RShoulder_MarkerNames =         {'RShoulderTop' 'RShoulderBack'};
RShoulderTop =                  getMarker(marker_mar_dim_frame,markerLabels,'RShoulderTop');
RShoulderBack =                 getMarker(marker_mar_dim_frame,markerLabels,'RShoulderBack');

for jj = 1:3 %ref num dim
    RShoulderPos_raw{1,jj} =    cat(1,RShoulderTop(jj,:),RShoulderBack(jj,:));
    RShoulderPos(jj,:) =        mean(RShoulderPos_raw{1,jj},1);
end

segCenter.RShoulderCenter =     RShoulderPos(:,trial_start_end);

%% UpperArm segCenter indexing
%Index LUpperArmCenter
%Includes: LUpperArm Mean, LArm, and LElbowOut
LUpperArm_MarkerNames =         {'LShoulderPos' 'LArm' 'LElbowOut'};
LArm =                          getMarker(marker_mar_dim_frame,markerLabels,'LArm');
LElbowOut =                     getMarker(marker_mar_dim_frame,markerLabels,'LElbowOut');

for jj = 1:3 %ref num dim
    LUpperArmPos_raw{1,jj} =    cat(1,LShoulderPos(jj,:),LArm(jj,:),LElbowOut(jj,:));
    LUpperArmPos(jj,:) =        mean(LUpperArmPos_raw{1,jj},1);
end

segCenter.LUpperArmCenter =     LUpperArmPos(:,trial_start_end);


%Index RUpperArmCenter
%Includes: RUpperArm Mean, RArm, and RElbowOut
RUpperArm_MarkerNames =         {'RShoulderPos' 'RArm' 'RElbowOut'};
RArm =                          getMarker(marker_mar_dim_frame,markerLabels,'RArm');
RElbowOut =                     getMarker(marker_mar_dim_frame,markerLabels,'RElbowOut');

for jj = 1:3 %ref num dim
    RUpperArmPos_raw{1,jj} =    cat(1,RShoulderPos(jj,:),RArm(jj,:),RElbowOut(jj,:));
    RUpperArmPos(jj,:) =        mean(RUpperArmPos_raw{1,jj},1);
end

%Output RUpperArmCenter data into struct
segCenter.RUpperArmCenter =     RUpperArmPos(:,trial_start_end);

%% Forearm segCenter indexing
%Index LForearmCenter
%Includes: LElbowOut, LWristOut, LWristIn
LForearm_MarkerNames =          {'LElbowOut' 'LWristOut' 'LWristIn'};
LWristOut =                     getMarker(marker_mar_dim_frame,markerLabels,'LWristOut');
LWristIn =                      getMarker(marker_mar_dim_frame,markerLabels,'LWristIn');

for jj = 1:3 %ref num dim
    LForearmPos_raw{1,jj} =     cat(1,LElbowOut(jj,:),LWristOut(jj,:),LWristIn(jj,:));
    LForearmPos(jj,:) =         mean(LForearmPos_raw{1,jj},1);
end

segCenter.LForearmCenter =      LForearmPos(:,trial_start_end);

%Index RForearmCenter
%Includes: RElbowOut, RWristOut, RWristIn
RForearm_MarkerNames =          {'RElbowOut' 'RWristOut' 'RWristIn'};
RWristOut =                     getMarker(marker_mar_dim_frame,markerLabels,'RWristOut');
RWristIn =                      getMarker(marker_mar_dim_frame,markerLabels,'RWristIn');

for jj = 1:3 %ref num dim
    RForearmPos_raw{1,jj} =     cat(1,RElbowOut(jj,:),RWristOut(jj,:),RWristIn(jj,:));
    RForearmPos(jj,:) =         mean(RForearmPos_raw{1,jj},1);
end

segCenter.RForearmCenter =      RForearmPos(:,trial_start_end);

%% Wrist segCenter indexing
%Index LWristCenter
%Includes: LWristOut, LWristIn
LWrist_MarkerNames =            {'LWristOut' 'LWristIn'};

for jj = 1:3 %ref num dim
    LWristPos_raw{1,jj} =       cat(1,LWristOut(jj,:),LWristIn(jj,:));
    LWristPos(jj,:) =           mean(LWristPos_raw{1,jj},1);
end

segCenter.LWristCenter =        LWristPos(:,trial_start_end);

%Index RWristCenter
%Includes: RWristOut, RWristIn
RWrist_MarkerNames =            {'RWristOut' 'RWristIn'};

for jj = 1:3 %ref num dim
    RWristPos_raw{1,jj} =       cat(1,RWristOut(jj,:),RWristIn(jj,:));
    RWristPos(jj,:) =           mean(RWristPos_raw{1,jj},1);
end

segCenter.RWristCenter =        RWristPos(:,trial_start_end);

%% Hand segCenter indexing
%Index LHandCenter
%Includes: LWristOut, LWristIn, LHandOut
LHand_MarkerNames =             {'LWristOut' 'LWristIn' 'LHandOut'};
LHandOut =                      getMarker(marker_mar_dim_frame,markerLabels,'LHandOut');

for jj = 1:3 %ref num dim
    LHandPos_raw{1,jj} =        cat(1,LWristOut(jj,:),LWristIn(jj,:),LHandOut(jj,:));
    LHandPos(jj,:) =            mean(LHandPos_raw{1,jj},1);
end

segCenter.LHandCenter =         LHandPos(:,trial_start_end);

%Index RHandCenter
%Includes: RWristOut, RWristIn, RHandOut
RHand_MarkerNames =             {'RWristOut' 'RWristIn' 'RHandOut'};
RHandOut =                      getMarker(marker_mar_dim_frame,markerLabels,'RHandOut');

for jj = 1:3 %ref num dim
    RHandPos_raw{1,jj} =        cat(1,RWristOut(jj,:),RWristIn(jj,:),RHandOut(jj,:));
    RHandPos(jj,:) =            mean(RHandPos_raw{1,jj},1);
end

segCenter.RHandCenter =         RHandPos(:,trial_start_end);

%% Thigh segCenter indexing
%Index LThighCenter
%Includes: WaistLFront, WaistLBack, LThigh, LKneeOut
LThigh_MarkerNames =            {'WaistLFront' 'WaistLBack' 'LThigh' 'LKneeOut'};
if use_MarkerClusters
    LUpLegCluster1 =            getMarker(marker_mar_dim_frame,markerLabels,'LeftUpLegCluster1');
    LUpLegCluster2 =            getMarker(marker_mar_dim_frame,markerLabels,'LeftUpLegCluster2');
    LUpLegCluster3 =            getMarker(marker_mar_dim_frame,markerLabels,'LeftUpLegCluster3');
    LUpLegCluster4 =            getMarker(marker_mar_dim_frame,markerLabels,'LeftUpLegCluster4');
end
LThigh =                        getMarker(marker_mar_dim_frame,markerLabels,'LThigh');
LKneeOut =                      getMarker(marker_mar_dim_frame,markerLabels,'LKneeOut');

for jj = 1:3 %ref num dim
    if use_MarkerClusters
        LThighPos_raw{1,jj} = cat(1,LUpLegCluster1(jj,:),LUpLegCluster2(jj,:),...
            LUpLegCluster3(jj,:),LUpLegCluster4(jj,:),WaistLFront(jj,:),...
            WaistLBack(jj,:),LThigh(jj,:),LKneeOut(jj,:));
    else
        LThighPos_raw{1,jj} = cat(1,WaistLFront(jj,:),WaistLBack(jj,:),...
            LThigh(jj,:),LKneeOut(jj,:));        
    end
    LThighPos(jj,:) =           mean(LThighPos_raw{1,jj},1);
end

segCenter.LThighCenter =        LThighPos(:,trial_start_end);

%Index RThighCenter
%Includes: WaistRFront, WaistRBack, RThigh, RKneeOut
RThigh_MarkerNames =            {'WaistRFront' 'WaistRBack' 'RThigh' 'RKneeOut'};
if use_MarkerClusters
    RUpLegCluster1 =            getMarker(marker_mar_dim_frame,markerLabels,'RightUpLegCluster1');
    RUpLegCluster2 =            getMarker(marker_mar_dim_frame,markerLabels,'RightUpLegCluster2');
    RUpLegCluster3 =            getMarker(marker_mar_dim_frame,markerLabels,'RightUpLegCluster3');
    RUpLegCluster4 =            getMarker(marker_mar_dim_frame,markerLabels,'RightUpLegCluster4');
end
RThigh =                        getMarker(marker_mar_dim_frame,markerLabels,'RThigh');
RKneeOut =                      getMarker(marker_mar_dim_frame,markerLabels,'RKneeOut');

for jj = 1:3 %ref num dim
    if use_MarkerClusters
        RThighPos_raw{1,jj} =   cat(1,RUpLegCluster1(jj,:),RUpLegCluster2(jj,:),...
            RUpLegCluster3(jj,:),RUpLegCluster4(jj,:),WaistRFront(jj,:),...
            WaistRBack(jj,:),RThigh(jj,:),RKneeOut(jj,:));
    else
        RThighPos_raw{1,jj} =   cat(1,WaistRFront(jj,:),WaistRBack(jj,:),...
        RThigh(jj,:),RKneeOut(jj,:));
    end
    RThighPos(jj,:) =           mean(RThighPos_raw{1,jj},1);
end

segCenter.RThighCenter =        RThighPos(:,trial_start_end);

%% Leg segCenter indexing
%Index LLegCenter
%Includes: LKneeOut, LShin, LAnkleOut, LeftLegCluster 1:4
%Should marker plates be sure to add them
LLeg_MarkerNames =              {'LeftLegCluster1' 'LeftLegCluster2' 'LeftLegCluster3'...
    'LeftLegCluster4' 'LKneeOut' 'LShin' 'LAnkleOut'};
if use_MarkerClusters
    LLegCluster1 =              getMarker(marker_mar_dim_frame,markerLabels,'LeftLegCluster1');
    LLegCluster2 =              getMarker(marker_mar_dim_frame,markerLabels,'LeftLegCluster2');
    LLegCluster3 =              getMarker(marker_mar_dim_frame,markerLabels,'LeftLegCluster3');
    LLegCluster4 =              getMarker(marker_mar_dim_frame,markerLabels,'LeftLegCluster4');
end
LShin =                         getMarker(marker_mar_dim_frame,markerLabels,'LShin');
LAnkleOut =                     getMarker(marker_mar_dim_frame,markerLabels,'LAnkleOut');

for jj = 1:3 %ref num dim
    if use_MarkerClusters
        LLegPos_raw{1,jj} =     cat(1,LLegCluster1(jj,:),LLegCluster2(jj,:),...
            LLegCluster3(jj,:),LLegCluster4(jj,:),LKneeOut(jj,:),...
            LShin(jj,:),LAnkleOut(jj,:));
    else
        LLegPos_raw{1,jj} =     cat(1,LKneeOut(jj,:),LShin(jj,:),...
            LAnkleOut(jj,:));
    end    
    LLegPos(jj,:) =             mean(LLegPos_raw{1,jj},1);
end

segCenter.LLegCenter =          LLegPos(:,trial_start_end);

%Index RLegCenter
%Includes: RKneeOut, RShin, RAnkleOut
RLeg_MarkerNames =              {'RightLegCluster1' 'RightLegCluster2' 'RightLegCluster3'...
    'RightLegCluster4' 'RKneeOut' 'RShin' 'RAnkleOut'};
if use_MarkerClusters
    RLegCluster1 =              getMarker(marker_mar_dim_frame,markerLabels,'RightLegCluster1');
    RLegCluster2 =              getMarker(marker_mar_dim_frame,markerLabels,'RightLegCluster2');
    RLegCluster3 =              getMarker(marker_mar_dim_frame,markerLabels,'RightLegCluster3');
    RLegCluster4 =              getMarker(marker_mar_dim_frame,markerLabels,'RightLegCluster4');
end
RShin =                         getMarker(marker_mar_dim_frame,markerLabels,'RShin');
RAnkleOut =                     getMarker(marker_mar_dim_frame,markerLabels,'RAnkleOut');

for jj = 1:3 %ref num dim
    if use_MarkerClusters
        RLegPos_raw{1,jj} =     cat(1,RLegCluster1(jj,:),RLegCluster2(jj,:),...
            RLegCluster3(jj,:),RLegCluster4(jj,:),RKneeOut(jj,:),...
            RShin(jj,:),RAnkleOut(jj,:));
    else
        RLegPos_raw{1,jj} =     cat(1,RKneeOut(jj,:),RShin(jj,:),...
            RAnkleOut(jj,:));
    end
    RLegPos(jj,:) =             mean(RLegPos_raw{1,jj},1);
end

segCenter.RLegCenter =          RLegPos(:,trial_start_end);

%% Foot segCenter indexing
%Index LFootCenter
%Includes: LAnkleOut, LHeelBack, LForefootOut, LToeTip, LForefootIn
LFoot_MarkerNames =             {'LAnkleOut' 'LHeelBack' 'LForefootOut' 'LToeTip' 'LForefootIn'};
LHeelBack =                     getMarker(marker_mar_dim_frame,markerLabels,'LHeelBack');
LForefootOut =                  getMarker(marker_mar_dim_frame,markerLabels,'LForefootOut');
LToeTip =                       getMarker(marker_mar_dim_frame,markerLabels,'LToeTip');
LForefootIn =                   getMarker(marker_mar_dim_frame,markerLabels,'LForefootIn');

for jj = 1:3 %ref num dim
    LFootPos_raw{1,jj} =        cat(1,LAnkleOut(jj,:),LHeelBack(jj,:),LForefootOut(jj,:),LToeTip(jj,:),LForefootIn(jj,:));
    LFootPos(jj,:) =            mean(LFootPos_raw{1,jj},1);
end

segCenter.LFootCenter =         LFootPos(:,trial_start_end);

%Index RFootCenter
%Includes: RAnkleOut, RHeelBack, RForefootOut, RToeTip, RForefootIn
RFoot_MarkerNames =             {'RAnkleOut' 'RHeelBack' 'RForefootOut' 'RToeTip' 'RForefootIn'};
RHeelBack =                     getMarker(marker_mar_dim_frame,markerLabels,'RHeelBack');
RForefootOut =                  getMarker(marker_mar_dim_frame,markerLabels,'RForefootOut');
RToeTip =                       getMarker(marker_mar_dim_frame,markerLabels,'RToeTip');
RForefootIn =                   getMarker(marker_mar_dim_frame,markerLabels,'RForefootIn');

for jj = 1:3 %ref num dim
    RFootPos_raw{1,jj} =        cat(1,RAnkleOut(jj,:),RHeelBack(jj,:),RForefootOut(jj,:),RToeTip(jj,:),RForefootIn(jj,:));
    RFootPos(jj,:) =            mean(RFootPos_raw{1,jj},1);
end

segCenter.RFootCenter =         RFootPos(:,trial_start_end);


%% Skeleton Segments
skeleton.Head =         squeeze(skeleton_mar_dim_frame(14,:,trial_start_end));
skeleton.Neck =         squeeze(skeleton_mar_dim_frame(13,:,trial_start_end));
skeleton.LowerSpine =   squeeze(skeleton_mar_dim_frame(2,:,trial_start_end));
skeleton.MiddleSpine =  squeeze(skeleton_mar_dim_frame(3,:,trial_start_end));
skeleton.UpperSpine =   squeeze(skeleton_mar_dim_frame(4,:,trial_start_end));
skeleton.HipCenter =    squeeze(skeleton_mar_dim_frame(1,:,trial_start_end));
skeleton.LShoulder =    squeeze(skeleton_mar_dim_frame(5,:,trial_start_end));
skeleton.RShoulder =    squeeze(skeleton_mar_dim_frame(9,:,trial_start_end));
skeleton.LElbow =       squeeze(skeleton_mar_dim_frame(6,:,trial_start_end));
skeleton.RElbow =       squeeze(skeleton_mar_dim_frame(10,:,trial_start_end));
skeleton.LWrist =       squeeze(skeleton_mar_dim_frame(7,:,trial_start_end));
skeleton.RWrist =       squeeze(skeleton_mar_dim_frame(11,:,trial_start_end));
skeleton.LHandTip =     squeeze(skeleton_mar_dim_frame(8,:,trial_start_end));
skeleton.RHandTip =     squeeze(skeleton_mar_dim_frame(12,:,trial_start_end));
skeleton.LHipCenter =   squeeze(skeleton_mar_dim_frame(15,:,trial_start_end));
skeleton.RHipCenter =   squeeze(skeleton_mar_dim_frame(19,:,trial_start_end));
skeleton.LKnee =        squeeze(skeleton_mar_dim_frame(16,:,trial_start_end));
skeleton.RKnee =        squeeze(skeleton_mar_dim_frame(20,:,trial_start_end));
skeleton.LAnkle =       squeeze(skeleton_mar_dim_frame(17,:,trial_start_end));
skeleton.RAnkle =       squeeze(skeleton_mar_dim_frame(21,:,trial_start_end));
skeleton.LToeBase =     squeeze(skeleton_mar_dim_frame(18,:,trial_start_end));
skeleton.RToeBase =     squeeze(skeleton_mar_dim_frame(22,:,trial_start_end));

end