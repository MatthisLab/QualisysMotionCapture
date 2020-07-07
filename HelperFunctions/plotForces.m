function plotForces(Force_cal,segCenter_cal)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function plots the force output for the force plates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Reformatting of segCenter data
%LLower markers & segCenters
LHipFront =         segCenter_cal.LHipFront_loc_fil;
LHipBack =          segCenter_cal.LHipBack_loc_fil;
LHipCenter =        segCenter_cal.LHipCenter_loc_fil;
LThigh =            segCenter_cal.LThigh_loc_fil;
LKnee =             segCenter_cal.LKnee_loc_fil;
LLeg =              segCenter_cal.LLeg_loc_fil;
LAnkle =            segCenter_cal.LAnkle_loc_fil;
LFoot =             segCenter_cal.LFoot_loc_fil;
LToeTip =           segCenter_cal.LToeTip_loc_fil;

%RLower markers & segCenters
RHipFront =         segCenter_cal.RHipFront_loc_fil;
RHipBack =          segCenter_cal.RHipBack_loc_fil;
RHipCenter =        segCenter_cal.RHipCenter_loc_fil;
RThigh =            segCenter_cal.RThigh_loc_fil;
RKnee =             segCenter_cal.RKnee_loc_fil;
RLeg =              segCenter_cal.RLeg_loc_fil;
RAnkle =            segCenter_cal.RAnkle_loc_fil;
RFoot =             segCenter_cal.RFoot_loc_fil;
RToeTip =           segCenter_cal.RToeTip_loc_fil;

%% Plot settings for different force plate plots
plot_individual_FPlates =   false;
plot_combined_FPlates =     false;
plot_LExtr =                true;

%% Plot force plate data
if plot_LExtr == true
    figure(10);
    stepA = VideoWriter('Lower Extremities Motion Tracker.mp4');
    open(stepA);
    
    for ii = 1:10:length(LHipCenter)
        hold on
        
        %Tracer for the movement of LLower extremities
        plot3([LHipCenter(1,ii);LThigh(1,ii);LKnee(1,ii);LAnkle(1,ii);LFoot(1,ii);LToeTip(1,ii)],...                                           %;LAnkle(1,ii);LFoot(1,ii);LToeTip(1,ii)]
            [LHipCenter(2,ii);LThigh(2,ii);LKnee(2,ii);LAnkle(2,ii);LFoot(2,ii);LToeTip(2,ii)],...                                            %;LAnkle(2,ii);LFoot(2,ii);LToeTip(2,ii)]
            [LHipCenter(3,ii);LThigh(3,ii);LKnee(3,ii);LAnkle(3,ii);LFoot(3,ii);LToeTip(3,ii)],'-k','MarkerSize',15)
        
        pause(0.5);
        
        %Real-time movement of LLower extremities
        plot3([LHipCenter(1,ii);LThigh(1,ii);LKnee(1,ii);LAnkle(1,ii);LFoot(1,ii);LToeTip(1,ii)],...                                           %;LAnkle(1,ii);LFoot(1,ii);LToeTip(1,ii)]
            [LHipCenter(2,ii);LThigh(2,ii);LKnee(2,ii);LAnkle(2,ii);LFoot(2,ii);LToeTip(2,ii)],...                                            %;LAnkle(2,ii);LFoot(2,ii);LToeTip(2,ii)]
            [LHipCenter(3,ii);LThigh(3,ii);LKnee(3,ii);LAnkle(3,ii);LFoot(3,ii);LToeTip(3,ii)],'-b','MarkerSize',15)                          %;LAnkle(3,ii);LFoot(3,ii);LToeTip(3,ii)]
        
        %Tracer for the movement of LLower extremities
        plot3([RHipCenter(1,ii);RThigh(1,ii);RKnee(1,ii);RAnkle(1,ii);RFoot(1,ii);RToeTip(1,ii)],...                                           %;LAnkle(1,ii);LFoot(1,ii);LToeTip(1,ii)]
            [RHipCenter(2,ii);RThigh(2,ii);RKnee(2,ii);RAnkle(2,ii);RFoot(2,ii);RToeTip(2,ii)],...                                            %;LAnkle(2,ii);LFoot(2,ii);LToeTip(2,ii)]
            [RHipCenter(3,ii);RThigh(3,ii);RKnee(3,ii);RAnkle(3,ii);RFoot(3,ii);RToeTip(3,ii)],'-k','MarkerSize',15)
        
        pause(0.5);
        
        %Real-time movement of RLower extremities
        plot3([RHipCenter(1,ii);RThigh(1,ii);RKnee(1,ii);RAnkle(1,ii);RFoot(1,ii);RToeTip(1,ii)],...                                           %;LAnkle(1,ii);LFoot(1,ii);LToeTip(1,ii)]
            [RHipCenter(2,ii);RThigh(2,ii);RKnee(2,ii);RAnkle(2,ii);RFoot(2,ii);RToeTip(2,ii)],...                                            %;LAnkle(2,ii);LFoot(2,ii);LToeTip(2,ii)]
            [RHipCenter(3,ii);RThigh(3,ii);RKnee(3,ii);RAnkle(3,ii);RFoot(3,ii);RToeTip(3,ii)],'-r','MarkerSize',15)      
        
        %Quiver for Force Plate#1
        quiver3(Force_cal.COP1(1,ii),...
            Force_cal.COP1(2,ii),...
            Force_cal.COP1(3,ii),...
            Force_cal.fp1(1,ii),...
            Force_cal.fp1(2,ii),...
            Force_cal.fp1(3,ii),'LineWidth',2.25,'Color','g')
        
        %Quiver for Force Plate#2
        quiver3(Force_cal.COP2(1,ii),...
            Force_cal.COP2(2,ii),...
            Force_cal.COP2(3,ii),...
            Force_cal.fp2(1,ii),...
            Force_cal.fp2(2,ii),...
            Force_cal.fp2(3,ii),'LineWidth',2.25,'Color','g')
        
        %Quiver for Force Plate#3
        quiver3(Force_cal.COP3(1,ii),...
            Force_cal.COP3(2,ii),...
            Force_cal.COP3(3,ii),...
            Force_cal.fp3(1,ii),...
            Force_cal.fp3(2,ii),...
            Force_cal.fp3(3,ii),'LineWidth',2.25,'Color','g')
        
        %Quiver for Force Plate#4
        quiver3(Force_cal.COP4(1,ii),...
            Force_cal.COP4(2,ii),...
            Force_cal.COP4(3,ii),...
            Force_cal.fp4(1,ii),...
            Force_cal.fp4(2,ii),...
            Force_cal.fp4(3,ii),'LineWidth',2.25,'Color','g')
        
        %Quiver for Force Plate#5
        quiver3(Force_cal.COP5(1,ii),...
            Force_cal.COP5(2,ii),...
            Force_cal.COP5(3,ii),...
            Force_cal.fp5(1,ii),...
            Force_cal.fp5(2,ii),...
            Force_cal.fp5(3,ii),'LineWidth',2.25,'Color','g')
        
        axis equal
        grid on
        xlim([0 2e3])
        ylim([-5e3 10e3])
        zlim([0 3e3])
        %left side view
        az = -88.5681;
        el = 0.7189;
        view(az,el)
        drawnow
        frame = getframe(gcf);
        writeVideo(stepA,frame);
    end
    close(stepA)
    
end


    
    
    
%     %Plot right side of lower extremities
%     plot3([LHip(1,ii);LKnee(1,ii);LAnkle(1,ii);LFoot(1,ii);LToeTip(1,ii)],...
%         [LHip(2,ii);LKnee(2,ii);LAnkle(2,ii);LFoot(2,ii);LToeTip(2,ii)],...
%         [LHip(3,ii);LKnee(3,ii);LAnkle(3,ii);LFoot(3,ii);LToeTip(3,ii)],'bo')


%% Plot lower extremities position data
% plot_lowExtrems = false;
% plot_movement = true;
% plot3d_movement = false;
% if plot_lowExtrems == true
%     figure(23232)
%     for ii = 1:length(RHip_loc_fil)
%         if plot_movement == true
%             plot(RHip_loc_fil(2,ii),RHip_loc_fil(3,ii),'ko')
%             hold on
%             plot(RKnee_loc_fil(2,ii),RKnee_loc_fil(3,ii),'ko')
%             plot(RAnkle_loc_fil(2,ii),RAnkle_loc_fil(3,ii),'ko')
%             plot(RFoot_loc_fil(2,ii),RFoot_loc_fil(3,ii),'ko')
%         elseif plot3d_movement == true
%             plot3(RHip_loc_fil(1,ii),RHip_loc_fil(2,ii),RHip_loc_fil(3,ii),'ko')
%             hold on
%             plot3(RKnee_loc_fil(1,ii),RKnee_loc_fil(2,ii),RKnee_loc_fil(3,ii),'ko')
%             plot3(RAnkle_loc_fil(1,ii),RAnkle_loc_fil(2,ii),RAnkle_loc_fil(3,ii),'ko')
%             plot3(RFoot_loc_fil(1,ii),RFoot_loc_fil(2,ii),RFoot_loc_fil(3,ii),'ko')
%         end
%     end
% 
%     
%     xlabel('Position of X')
%     ylabel('Marker Cartisian Position')
%     hold off
% end

%% Plot combined force plate data
if plot_combined_FPlates == true
    figure(54322)
    plot(fp3)
    title('Force Plate Data')
    xlabel('Number of Frames')
    ylabel('Force (N)')
    hold on
    plot(fp1);
    plot(fp2);
    plot(fp5);
    
%     plot(RKnee_locx,RKnee_locy)
%     plot(RAnkle_locx,RAnkle_locy)
%     plot(RFoot_locx,RFoot_locy)
%     plot(RAnkle_loc(2:3,:))
%     plot(RFoot_loc(2:3,:))
%     hold off
    hold off
end

%% Plot individual force plate data
if plot_individual_FPlates == true
    %First force plate
    subplot(4,1,1)
    plot(fp3);
    title('Force Plate #1')
    xlabel('Number of Frames')
    ylabel('Force (N)')
    hold on
    
    %Second force plate
    subplot(4,1,2)
    plot(fp1);
    title('Force Plate #2')
    xlabel('Number of Frames')
    ylabel('Force (N)')
    
    %Third force plate
    subplot(4,1,3)
    plot(fp2);
    title('Force Plate #3')
    xlabel('Number of Frames')
    ylabel('Force (N)')
    
    %Fourth force plate
    subplot(4,1,4)
    plot(fp5);
    title('Force Plate #4')
    xlabel('Number of Frames')
    ylabel('Force (N)')
    
    % %Fifth force plate
    % subplot(5,1,5)
    % plot(fp5);
    % title('Force Plate #5')
    % hold on
end

end