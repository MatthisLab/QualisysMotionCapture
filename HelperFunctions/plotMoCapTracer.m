function plotMoCapTracer(segCenter)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plotMoCapTracer outputs plot of segCenters for subject
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Should holdon be used after each new set of plotting instructions? y
% How do you plot multiple figures

%% COM for the all body segments in 3D
    %Head and Neck Markers
    plot3(segCenter.headCenter_mar_dim_frame(1,fr),...
        segCenter.headCenter_mar_dim_frame(2,fr),...
        segCenter.headCenter_mar_dim_frame(3,fr),'p','DisplayName','HeadXYZ');
%      
    %Shoulder Markers
    plot3(segCenter.LShoulderCenter_mar_dim_frame(1,fr),...
        segCenter.LShoulderCenter_mar_dim_frame(2,fr),...
        segCenter.LShoulderCenter_mar_dim_frame(3,fr),'p','DisplayName','LShoulderXYZ'); %,'kp','MarkerFaceColor','m', 'MarkerSize',12)    
    plot3(segCenter.RShoulderCenter_mar_dim_frame(1,fr),...
        segCenter.RShoulderCenter_mar_dim_frame(2,fr),...
        segCenter.RShoulderCenter_mar_dim_frame(3,fr),'p','DisplayName','RShoulderXYZ');
    
    %Chest Markers
    plot3(segCenter.chestCenter_mar_dim_frame(1,fr),...
        segCenter.chestCenter_mar_dim_frame(2,fr),...
        segCenter.chestCenter_mar_dim_frame(3,fr),'p','DisplayName','ChestXYZ');
    
    %Arm Markers
    plot3(segCenter.LUpperArmCenter_mar_dim_frame(1,fr),...
        segCenter.LUpperArmCenter_mar_dim_frame(2,fr),...
        segCenter.LUpperArmCenter_mar_dim_frame(3,fr),'p','DisplayName','LUpperArmXYZ'); %,'kp','MarkerFaceColor','m', 'MarkerSize',12)
    plot3(segCenter.RUpperArmCenter_mar_dim_frame(1,fr),...
        segCenter.RUpperArmCenter_mar_dim_frame(2,fr),...
        segCenter.RUpperArmCenter_mar_dim_frame(3,fr),'p','DisplayName','RUpperArmXYZ');
     
    %Forearm Markers
    plot3(segCenter.LForearmCenter_mar_dim_frame(1,fr),...
        segCenter.LForearmCenter_mar_dim_frame(2,fr),...
        segCenter.LForearmCenter_mar_dim_frame(3,fr),'p','DisplayName','LForearmXYZ'); %,'kp','MarkerFaceColor','m', 'MarkerSize',12)
    plot3(segCenter.RForearmCenter_mar_dim_frame(1,fr),...
        segCenter.RForearmCenter_mar_dim_frame(2,fr),...
        segCenter.RForearmCenter_mar_dim_frame(3,fr),'p','DisplayName','RForearmXYZ');

    %Hand Markers
    plot3(segCenter.LHandCenter_mar_dim_frame(1,fr),...
        segCenter.LHandCenter_mar_dim_frame(2,fr),...
        segCenter.LHandCenter_mar_dim_frame(3,fr),'p','DisplayName','LHandXYZ'); %,'kp','MarkerFaceColor','m', 'MarkerSize',12)
    plot3(segCenter.RHandCenter_mar_dim_frame(1,fr),...
        segCenter.RHandCenter_mar_dim_frame(2,fr),...
        segCenter.RHandCenter_mar_dim_frame(3,fr),'p','DisplayName','RHandXYZ');
    
    %Hip Markers
    plot3(segCenter.hipCenter_mar_dim_frame(1,fr),...
        segCenter.hipCenter_mar_dim_frame(2,fr),...
        segCenter.hipCenter_mar_dim_frame(3,fr),'p','DisplayName','HipXYZ');
    
    %Thigh Markers
    plot3(segCenter.LThighCenter_mar_dim_frame(1,fr),...
        segCenter.LThighCenter_mar_dim_frame(2,fr),...
        segCenter.LThighCenter_mar_dim_frame(3,fr),'p','DisplayName','LThighXYZ');
    plot3(segCenter.RThighCenter_mar_dim_frame(1,fr),...
        segCenter.RThighCenter_mar_dim_frame(2,fr),...
        segCenter.RThighCenter_mar_dim_frame(3,fr),'p','DisplayName','RThighXYZ');
    
    %Leg Markers
    plot3(segCenter.LLegCenter_mar_dim_frame(1,fr),...
        segCenter.LLegCenter_mar_dim_frame(2,fr),...
        segCenter.LLegCenter_mar_dim_frame(3,fr),'p','DisplayName','LLegXYZ');
    plot3(segCenter.RLegCenter_mar_dim_frame(1,fr),...
        segCenter.RLegCenter_mar_dim_frame(2,fr),...
        segCenter.RLegCenter_mar_dim_frame(3,fr),'p','DisplayName','RLegXYZ');
     
    %Foot Markers
    plot3(segCenter.LFootCenter_mar_dim_frame(1,fr),...
        segCenter.LFootCenter_mar_dim_frame(2,fr),...
        segCenter.LFootCenter_mar_dim_frame(3,fr),'p','DisplayName','LFootXYZ');
    plot3(segCenter.RFootCenter_mar_dim_frame(1,fr),...
        segCenter.RFootCenter_mar_dim_frame(2,fr),...
        segCenter.RFootCenter_mar_dim_frame(3,fr),'p','DisplayName','RFootXYZ');      
    
% plot(segCenter.hipCenter_mar_dim_frame)
% hold on
% plot(fr, segCenter.hipCenter_mar_dim_frame(fr,1), 'ko')
% plot(fr, segCenter.hipCenter_mar_dim_frame(fr,2), 'ro')
% plot(fr, segCenter.hipCenter_mar_dim_frame(fr,3), 'bo')

%Equivalent to previous code except written concisely
%    plot([fr fr fr], segCenter.hipCenter_mar_dim_frame(fr,:), 'ko') 

end

