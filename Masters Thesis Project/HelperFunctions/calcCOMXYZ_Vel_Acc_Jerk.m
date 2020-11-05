function [totalCOM_metrics,trial_start_end] = calcCOMXYZ_Vel_Acc_Jerk(totalCOMXYZ,num_frames)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function calculates vel,acc,and jerk using segCenter of respective foot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%differences might be magnified in diff dimensions
%free walking people walk faster
%limited walking people walk slower but evaluate diff dimension 

%% Define output structure
totalCOM_metrics = [];
vel_frames = (num_frames-1);
accl_frames = (num_frames-2);

%% COM vel, acc, and jerk calculations
%movement of totalCOM used to ID start of trial
marVelx =                       diff(totalCOMXYZ(1,:));
marVely_calc =                  diff(totalCOMXYZ(2,:));
marVelz =                       diff(totalCOMXYZ(3,:));

for ii = 1:vel_frames
    if mean(marVely_calc) <= 0
        marVely(1,ii) = -marVely_calc(1,ii);
    else
        marVely = marVely_calc;
    end
end

calc_totalmarVel =              plus(marVelx,marVely);
trial_start_end =               find(calc_totalmarVel > 2);

% figure(1)
% plot(calc_totalmarVel)

%velx, accx, and jerkx
totalCOM_metrics.marVelx =         marVelx(trial_start_end);
totalCOM_metrics.marAccx =         diff(totalCOM_metrics.marVelx);
totalCOM_metrics.absMarJerkx =     abs(diff(totalCOM_metrics.marAccx));

%vely, accy, and jerky 
totalCOM_metrics.marVely =         marVely(trial_start_end);
totalCOM_metrics.marAccy =         diff(totalCOM_metrics.marVely);
totalCOM_metrics.absMarJerky =     abs(diff(totalCOM_metrics.marAccy));

%velz, accz, and jerkz
totalCOM_metrics.marVelz =         marVelz(trial_start_end);
totalCOM_metrics.marAccz =         diff(totalCOM_metrics.marVelz);
totalCOM_metrics.absMarJerkz =     abs(diff(totalCOM_metrics.marAccz));

%total marker vel, acc, and jerk calc
totalCOM_metrics.totalmarVel =         calc_totalmarVel(trial_start_end);
totalCOM_metrics.totalmarAcc =         diff(totalCOM_metrics.totalmarVel);
totalCOM_metrics.totalmarJerk =        diff(totalCOM_metrics.totalmarAcc);
totalCOM_metrics.totalmarJerk_abs =    abs(totalCOM_metrics.totalmarJerk);

end

