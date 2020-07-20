function [JointCenterError] = JointCenterErrorFun(segCenter,markers,figNum,weights,numOfWeights,segCenterVariable,visualize)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Function ID's the errors of joint center loc given specific markers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Markers Needed for JointCenter Eval
%Femur markers & segCenters
LHipFront =         segCenterVariable.LHipFront;
RHipFront =         segCenterVariable.RHipFront;
LHipBack =          segCenterVariable.LHipBack;
RHipBack =          segCenterVariable.RHipBack;
LThigh =            segCenterVariable.LThigh;
LThighCenter =      segCenterVariable.LThighCenter;
RThigh =            segCenterVariable.RThigh;
RThighCenter =      segCenterVariable.RThighCenter;
LUpperLegCluster1 = segCenterVariable.LUpLegCluster1;
LUpperLegCluster2 = segCenterVariable.LUpLegCluster2;
RUpperLegCluster1 = segCenterVariable.RUpLegCluster1;
RUpperLegCluster2 = segCenterVariable.RUpLegCluster2;

%Tibia markers & segCenters
LKnee =             segCenterVariable.LKnee;
RKnee =             segCenterVariable.RKnee;
LLegCenter =        segCenterVariable.LLegCenter;
RLegCenter =        segCenterVariable.RLegCenter;

%Foot markers & segCenters
LAnkle =            segCenterVariable.LAnkle;
RAnkle =            segCenterVariable.RAnkle;
LFootCenter =       segCenterVariable.LFootCenter;
RFootCenter =       segCenterVariable.RFootCenter;
LHeel =             segCenterVariable.LHeel;
RHeel =             segCenterVariable.RHeel;
LToeTip =           segCenterVariable.LToeTip;
RToeTip =           segCenterVariable.RToeTip;

%% Find the weighted average of markers
for ii = 1:numOfWeights
    weightedMarkers(:,:,ii)= markers(:,:,ii)*weights(ii);
end
weightedMarkerAverage = sum(weightedMarkers,3);

%% Create variables for JointCenterGuess
%Establish joint center as origin
NormalizedSeg(1,:) = weightedMarkerAverage(1,:) - segCenter(1,:);
NormalizedSeg(2,:) = weightedMarkerAverage(2,:) - segCenter(2,:);
NormalizedSeg(3,:) = weightedMarkerAverage(3,:) - segCenter(3,:);

%% Convert cartesian to spherical coordinates
%Function output = distance from the joint center to the segment center
[azi,Elevation,SegmentDistance] = cart2sph(NormalizedSeg(1,:),NormalizedSeg(2,:),NormalizedSeg(3,:));

%Segment center from frame-to-frame difference
frame_to_frame_diff = diff(SegmentDistance);

%Create error as the sum of the distance -- this is what is being optimized
%because if this error is zero that would mean that the length of the
%segment from joint center to segment center would be the same in every
%frame
% error = sum(abs(diff((SegmentDistance))));
JointCenterError = sum(diff(SegmentDistance).^2);

% Take sum squared error divided by frames
%Plot the differences
figure(figNum)
% open(v)

%% Visualization of optimization
for ii = 1:3
    segVisual(ii,:) = NormalizedSeg(ii,:) + segCenter(ii,:);  
end

if visualize
    for ii = 5
        %Plot of right side of human skeleton
        plot3([RHipFront(1,ii);RKnee(1,ii);RAnkle(1,ii);RFootCenter(1,ii);RToeTip(1,ii)],...
            [RHipFront(2,ii);RKnee(2,ii);RAnkle(2,ii);RFootCenter(2,ii);RToeTip(2,ii)],...
            [RHipFront(3,ii);RKnee(3,ii);RAnkle(3,ii);RFootCenter(3,ii);RToeTip(3,ii)],'-r','LineWidth',2)
        hold on
        %Plot of left side of human skeleton
        plot3([LHipFront(1,ii);LKnee(1,ii);LAnkle(1,ii);LFootCenter(1,ii);LToeTip(1,ii)],...
            [LHipFront(2,ii);LKnee(2,ii);LAnkle(2,ii);LFootCenter(2,ii);LToeTip(2,ii)],...
            [LHipFront(3,ii);LKnee(3,ii);LAnkle(3,ii);LFootCenter(3,ii);LToeTip(3,ii)],'-b','LineWidth',2)
        
        %LLower Markers
        plot3(LHipFront(1,ii),LHipFront(2,ii),LHipFront(3,ii),'k.','MarkerSize',5)
        plot3(LHipBack(1,ii),LHipBack(2,ii),LHipBack(3,ii),'k.','MarkerSize',5)
        plot3(LKnee(1,ii),LKnee(2,ii),LKnee(3,ii),'k.','MarkerSize',5);
        plot3(LAnkle(1,ii),LAnkle(2,ii),LAnkle(3,ii),'k.','MarkerSize',5);
        plot3(LHeel(1,ii),LHeel(2,ii),LHeel(3,ii),'k.','MarkerSize',5);
        plot3(LToeTip(1,ii),LToeTip(2,ii),LToeTip(3,ii),'k.','MarkerSize',5);
        
        plot3(RHipFront(1,ii),RHipFront(2,ii),RHipFront(3,ii),'k.','MarkerSize',5)
        plot3(RHipBack(1,ii),RHipBack(2,ii),RHipBack(3,ii),'k.','MarkerSize',5)
        plot3(RKnee(1,ii),RKnee(2,ii),RKnee(3,ii),'k.','MarkerSize',5);
        plot3(RAnkle(1,ii),RAnkle(2,ii),RAnkle(3,ii),'k.','MarkerSize',5);
        plot3(RHeel(1,ii),RHeel(2,ii),RHeel(3,ii),'k.','MarkerSize',5);
        plot3(RToeTip(1,ii),RToeTip(2,ii),RToeTip(3,ii),'k.','MarkerSize',5);
        
        plot3(segVisual(1,ii),segVisual(2,ii),segVisual(3,ii),'*r','MarkerSize',8);
        
        axis equal
        grid on
        xlim([-500  1.5e3])
        ylim([-500   3e3])
        zlim([0     1.95e3])
        
        %     %left side view
        %     az = -30.8155;
        %     el = 6.8338;
        
        %right side view
        az = 50.9926;
        el = 9.9634;
        
        view(az,el)
        drawnow
    end
end
%     
%     frame = getframe(gcf);
% 
% plot(frame_to_frame_diff)
% xlabel('Frame')
% ylabel('Segment length difference (mm)')
% title('Segment Length Optimization')
% drawnow

% frame = getframe(gcf);
% writeVideo(v,frame);

end