function [segXYZ] = segXYZ(marker_mar_dim_frame) %markerLabels)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SegXYZPosition function outputs XYZ position for body segments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% XYZ head position
%initial conditions for head position

% if markerLabels{1} == ('HeadL');
%     headL = data.
    
headA = 1;
headB = 4;
headIDs = headA:headB;

%headXYZ acquisition
headXYZ =  squeeze(marker_mar_dim_frame(headIDs, 1:3, :))';
%segWeight2bodyWeight = bodySegWeight.handWeight * headXYZ;


%Start of segXYZ struct
segXYZ = [];
segXYZ.headXYZ = headXYZ;

%% XYZ shoulder positions
%LShoulder initial position
LShoulderA = 5;
LShoulderB = 6;
LShoulderIDs = LShoulderA:LShoulderB;

%LShoulderXYZ calculation
LShoulderXYZ =  squeeze(XYZ(marker_mar_dim_frame(LShoulderIDs, 1:3, :),1))';
segXYZ.LShoulderXYZ = LShoulderXYZ;

%RShoulder initial position
RShoulderA = 12;
RShoulderB = 13;
RShoulderIDs = RShoulderA:RShoulderB;

%RShoulderXYZ calculation
RShoulderXYZ =  squeeze(XYZ(marker_mar_dim_frame(RShoulderIDs, 1:3, :),1))';
segXYZ.RShoulderXYZ = RShoulderXYZ;

%% XYZ chest positions
%Chest initial conditions
chestA = 19;
chestB = 21;
chestC = 22;
chestIDs = [chestA chestB chestC];

%LArmXYZ calculation
chestXYZ =  squeeze(XYZ(marker_mar_dim_frame(chestIDs, 1:3, :),1))';
segXYZ.chestXYZ = chestXYZ; 

%% XYZ upper arm positions
%LArm initial conditions
LUpperArmA = 7;
LUpperArmB = 8;
LUpperArmIDs = LUpperArmA:LUpperArmB;

%LArmXYZ calculation
LUpperArmXYZ =  squeeze(XYZ(marker_mar_dim_frame(LUpperArmIDs, 1:3, :),1))';
segXYZ.LUpperArmXYZ = LUpperArmXYZ; 

%RArm initial conditions
RUpperArmA = 14;
RUpperArmB = 15;
RUpperArmIDs = RUpperArmA:RUpperArmB;

%RArmXYZ calculation
RUpperArmXYZ =  squeeze(XYZ(marker_mar_dim_frame(RUpperArmIDs, 1:3, :),1))';
segXYZ.RUpperArmXYZ = RUpperArmXYZ;

%% XYZ forearm positions
%LForearm initial conditions
LForearmA = 8;
LForearmB = 10;
LForearmIDs = LForearmA:LForearmB;

%LForearmXYZ calculation
LForearmXYZ =  squeeze(XYZ(marker_mar_dim_frame(LForearmIDs, 1:3, :),1))';
segXYZ.LForearmXYZ = LForearmXYZ;

%RForearm initial conditions
RForearmA = 15;
RForearmB = 17;
RForearmIDs = RForearmA:RForearmB;

%RForearmXYZ calculation
RForearmXYZ =  squeeze(XYZ(marker_mar_dim_frame(RForearmIDs, 1:3, :),1))';
segXYZ.RForearmXYZ = RForearmXYZ;

%% XYZ hand positions
%LHand initial conditions
LHandA = 9;
LHandB = 11;
LHandIDs = LHandA:LHandB;

%LHandXYZ calculation
LHandXYZ =  squeeze(XYZ(marker_mar_dim_frame(LHandIDs, 1:3, :),1))';
segXYZ.LHandXYZ = LHandXYZ;

%RHand initial conditions
RHandA = 16;
RHandB = 18;
RHandIDs = RHandA:RHandB;

%RHandXYZ calculation
RHandXYZ =  squeeze(XYZ(marker_mar_dim_frame(RHandIDs, 1:3, :),1))';
segXYZ.RHandXYZ = RHandXYZ;

%% XYZ hip positions
%hip initial conditions
hipA = 23;
hipB = 26;
hipsIDs = hipA:hipB;

%hipsXYZ calculation
hipsXYZ =  squeeze(XYZ(marker_mar_dim_frame(hipsIDs, 1:3, :),1))';
segXYZ.hipsXYZ = hipsXYZ;

%% XYZ thigh calculations 
%LThigh initial conditions
LThighA = 27;
LThighB = 28;
LThighIDs = [LThighA LThighB];

%LThighXYZ calculation
LThighXYZ =  squeeze(XYZ(marker_mar_dim_frame(LThighIDs, 1:3, :),1))';
segXYZ.LThighXYZ = LThighXYZ;

%RThigh initial conditions
RThighA = 35;
RThighB = 36;
RThighIDs = [RThighA RThighB];

%RThighXYZ calculation
RThighXYZ =  squeeze(XYZ(marker_mar_dim_frame(RThighIDs, 1:3, :),1))';
segXYZ.RThighXYZ = RThighXYZ;

%% XYZ leg calculations
%LLeg initial conditions
LLegA = 28;
LLegB = 30;
LLegIDs = [LLegA LLegB];

%LLegXYZ calculations
LLegXYZ =  squeeze(XYZ(marker_mar_dim_frame(LLegIDs, 1:3, :),1))';
segXYZ.LLegXYZ = LLegXYZ;

%RLeg initial conditions
RLegA = 36;
RLegB = 38;
RLegIDs = [RLegA RLegB];

%RLegXYZ calculations
RLegXYZ =  squeeze(XYZ(marker_mar_dim_frame(RLegIDs, 1:3, :),1))';
segXYZ.RLegXYZ = RLegXYZ;

%% XYZ foot calculations
%LFoot initial conditions
LFootA = 30;
LFootB = 34;
LFootIDs = LFootA:LFootB;

%LFootXYZ calculation
LFootXYZ =  squeeze(XYZ(marker_mar_dim_frame(LFootIDs, 1:3, :),1))';
segXYZ.LFootXYZ = LFootXYZ;

%RFoot initial conditions
RFootA = 38;
RFootB = 42;
RFootIDs = RFootA:RFootB;

%RFootXYZ calculation
RFootXYZ =  squeeze(XYZ(marker_mar_dim_frame(RFootIDs, 1:3, :),1))';
segXYZ.RFootXYZ = RFootXYZ;

end

