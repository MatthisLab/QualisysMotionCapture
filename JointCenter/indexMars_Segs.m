function [segCenter] = indexMars_Segs(marker_mar_dim_frame,markerLabels,trial_start_end)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%indexMars_Segs indexs mars and segs by start and end of trial
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Define output
segCenter = [];

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

%% LUpper markers indexing
%Index markers
segCenter.LShoulderTop =        getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LShoulderTop');
segCenter.LShoulderBack =       getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LShoulderBack');
segCenter.LArm =                getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LArm');
segCenter.LElbow =              getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LElbowOut');
segCenter.LWristOut =           getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LWristOut');
segCenter.LWristIn =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LWristIn');
segCenter.LHandOut =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LHandOut');

%% RUpper markers indexing
%Index RUpper markers
segCenter.RShoulderTop =        getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RShoulderTop');
segCenter.RShoulderBack =       getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RShoulderBack');
segCenter.RArm =                getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RArm');
segCenter.RElbow =              getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RElbowOut');
segCenter.RWristOut =           getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RWristOut');
segCenter.RWristIn =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RWristIn');
segCenter.RHandOut =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RHandOut');

%% LLower marker indexing
%Index markers
segCenter.LHipFront =           getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'WaistLFront');
segCenter.LHipBack =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'WaistLBack');
segCenter.LKnee =               getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LKneeOut');
segCenter.LAnkle =              getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LAnkleOut');
segCenter.LToeTip =             getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'LToeTip');

%% RLower marker indexing
%Index markers
segCenter.RHipFront =           getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'WaistRFront');
segCenter.RHipBack =            getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'WaistRBack');
segCenter.RKnee =               getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RKneeOut');
segCenter.RAnkle =              getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RAnkleOut');
segCenter.RToeTip =             getMarker(marker_mar_dim_frame(:,:,trial_start_end),markerLabels,'RToeTip');

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

%% LUpper segCenter indexing
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

%Index LWristCenter
%Includes: LWristOut, LWristIn
LWrist_MarkerNames =            {'LWristOut' 'LWristIn'};

for jj = 1:3 %ref num dim
    LWristPos_raw{1,jj} =       cat(1,LWristOut(jj,:),LWristIn(jj,:));
    LWristPos(jj,:) =           mean(LWristPos_raw{1,jj},1);
end

segCenter.LWristCenter =        LWristPos(:,trial_start_end);

%Index LHandCenter
%Includes: LWristOut, LWristIn, LHandOut
LHand_MarkerNames =             {'LWristOut' 'LWristIn' 'LHandOut'};
LHandOut =                      getMarker(marker_mar_dim_frame,markerLabels,'LHandOut');

for jj = 1:3 %ref num dim
    LHandPos_raw{1,jj} =        cat(1,LWristOut(jj,:),LWristIn(jj,:),LHandOut(jj,:));
    LHandPos(jj,:) =            mean(LHandPos_raw{1,jj},1);
end

segCenter.LHandCenter =         LHandPos(:,trial_start_end);

%% RUpperArm segCenter indexing
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

%Index RWristCenter
%Includes: RWristOut, RWristIn
RWrist_MarkerNames =            {'RWristOut' 'RWristIn'};

for jj = 1:3 %ref num dim
    RWristPos_raw{1,jj} =       cat(1,RWristOut(jj,:),RWristIn(jj,:));
    RWristPos(jj,:) =           mean(RWristPos_raw{1,jj},1);
end

segCenter.RWristCenter =        RWristPos(:,trial_start_end);

%Index RHandCenter
%Includes: RWristOut, RWristIn, RHandOut
RHand_MarkerNames =             {'RWristOut' 'RWristIn' 'RHandOut'};
RHandOut =                      getMarker(marker_mar_dim_frame,markerLabels,'RHandOut');

for jj = 1:3 %ref num dim
    RHandPos_raw{1,jj} =        cat(1,RWristOut(jj,:),RWristIn(jj,:),RHandOut(jj,:));
    RHandPos(jj,:) =            mean(RHandPos_raw{1,jj},1);
end

segCenter.RHandCenter =         RHandPos(:,trial_start_end);

%% LLower SegCenters extremities calibration
%Index LThighCenter
%Includes: WaistLFront, WaistLBack, LThigh, LKneeOut
LThigh_MarkerNames =            {'WaistLFront' 'WaistLBack' 'LThigh' 'LKneeOut'};
LThigh =                        getMarker(marker_mar_dim_frame,markerLabels,'LThigh');
LKneeOut=                       getMarker(marker_mar_dim_frame,markerLabels,'LKneeOut');

for jj = 1:3 %ref num dim
    LThighPos_raw{1,jj} =       cat(1,WaistLFront(jj,:),WaistLBack(jj,:),LThigh(jj,:),LKneeOut(jj,:));
    LThighPos(jj,:) =           mean(LThighPos_raw{1,jj},1);
end

segCenter.LThighCenter =        LThighPos(:,trial_start_end);

%Index LLegCenter
%Includes: LKneeOut, LShin, LAnkleOut
%Should marker plates be sure to add them
LLeg_MarkerNames =              {'LKneeOut' 'LShin' 'LAnkleOut'};
LShin =                         getMarker(marker_mar_dim_frame,markerLabels,'LShin');
LAnkleOut=                      getMarker(marker_mar_dim_frame,markerLabels,'LAnkleOut');

for jj = 1:3 %ref num dim
    LLegPos_raw{1,jj} =         cat(1,LKneeOut(jj,:),LShin(jj,:),LAnkleOut(jj,:));
    LLegPos(jj,:) =             mean(LLegPos_raw{1,jj},1);
end

segCenter.LLegCenter =          LLegPos(:,trial_start_end);

%Index LFootCenter
%Includes: LAnkleOut, LHeelBack, LForefootOut, LToeTip, LForefootIn
LFoot_MarkerNames =             {'LAnkleOut' 'LHeelBack' 'LForefootOut' 'LToeTip' 'LForefootIn'};
LHeelBack =                     getMarker(marker_mar_dim_frame,markerLabels,'LHeelBack');
LForefootOut=                   getMarker(marker_mar_dim_frame,markerLabels,'LForefootOut');
LToeTip =                       getMarker(marker_mar_dim_frame,markerLabels,'LToeTip');
LForefootIn =                   getMarker(marker_mar_dim_frame,markerLabels,'LForefootIn');

for jj = 1:3 %ref num dim
    LFootPos_raw{1,jj} =        cat(1,LAnkleOut(jj,:),LHeelBack(jj,:),LForefootOut(jj,:),LToeTip(jj,:),LForefootIn(jj,:));
    LFootPos(jj,:) =            mean(LFootPos_raw{1,jj},1);
end

segCenter.LFootCenter =         LFootPos(:,trial_start_end);

%% Reformat RLower extremities data
%Index RThighCenter
%Includes: WaistRFront, WaistRBack, RThigh, RKneeOut
RThigh_MarkerNames =            {'WaistRFront' 'WaistRBack' 'RThigh' 'RKneeOut'};
RThigh =                        getMarker(marker_mar_dim_frame,markerLabels,'RThigh');
RKneeOut=                       getMarker(marker_mar_dim_frame,markerLabels,'RKneeOut');

for jj = 1:3 %ref num dim
    RThighPos_raw{1,jj} =       cat(1,WaistRFront(jj,:),WaistRBack(jj,:),RThigh(jj,:),RKneeOut(jj,:));
    RThighPos(jj,:) =           mean(RThighPos_raw{1,jj},1);
end

segCenter.RThighCenter =        RThighPos(:,trial_start_end);

%Index RLegCenter
%Includes: RKneeOut, RShin, RAnkleOut
%Should marker plates be sure to add them
RLeg_MarkerNames =              {'RKneeOut' 'RShin' 'RAnkleOut'};
RShin =                         getMarker(marker_mar_dim_frame,markerLabels,'RShin');
RAnkleOut=                      getMarker(marker_mar_dim_frame,markerLabels,'RAnkleOut');

for jj = 1:3 %ref num dim
    RLegPos_raw{1,jj} =         cat(1,RKneeOut(jj,:),RShin(jj,:),RAnkleOut(jj,:));
    RLegPos(jj,:) =             mean(RLegPos_raw{1,jj},1);
end

segCenter.RLegCenter =          RLegPos(:,trial_start_end);

%Index RFootCenter
%Includes: RAnkleOut, RHeelBack, RForefootOut, RToeTip, RForefootIn
RFoot_MarkerNames =             {'RAnkleOut' 'RHeelBack' 'RForefootOut' 'RToeTip' 'RForefootIn'};
RHeelBack =                     getMarker(marker_mar_dim_frame,markerLabels,'LHeelBack');
RForefootOut=                   getMarker(marker_mar_dim_frame,markerLabels,'LForefootOut');
RToeTip =                       getMarker(marker_mar_dim_frame,markerLabels,'LToeTip');
RForefootIn =                   getMarker(marker_mar_dim_frame,markerLabels,'LForefootIn');

for jj = 1:3 %ref num dim
    RFootPos_raw{1,jj} =        cat(1,RAnkleOut(jj,:),RHeelBack(jj,:),RForefootOut(jj,:),RToeTip(jj,:),RForefootIn(jj,:));
    RFootPos(jj,:) =            mean(RFootPos_raw{1,jj},1);
end

segCenter.RFootCenter =         RFootPos(:,trial_start_end);

end