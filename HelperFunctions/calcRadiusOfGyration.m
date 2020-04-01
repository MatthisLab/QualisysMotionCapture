function [momentInertia,density] = calcRadiusOfGyration(bodySegMass)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calcRadiusOfGyration function calculates radius of gyration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Establishing output parameters
%radiusGyration = [];
momentInertia = [];
density = [];

%% Head radius of gyration COG, proximal, distal
%Includes: Head and Neck
headCOG =                           0.495;
momentInertia.headCOG =             bodySegMass.headMass .* ...
                                    (bodySegLength.headTotalLength .* headCOG)^2;
                                
headProximal =                      0.116;
momentInertia.headProximal =        bodySegMass.headMass .* ...
                                    (bodySegLength.headTotalLength .* headProximal)^2;
                                
headDistal =                        0.00;
momentInertia.headDistal =          bodySegMass.headMass .* ...
                                    (bodySegLength.headTotalLength .* headDistal)^2;
                                
density.head =                      1.11;

%% Trunk and head radius of gyration COG, proximal, distal
%Includes: Thorax, Abdomen, Pelvis, and Head
trunk_HeadCOG =                     0.503;
momentInertia.trunk_HeadCOG =       bodySegMass.trunkMass .* ...
                                    (bodySegLength.trunkTotalLength .* trunk_HeadCOG)^2;
                                
trunk_HeadProximal =                0.830;
momentInertia.trunk_HeadProximal =  bodySegMass.trunkMass .* ...
                                    (bodySegLength.trunkTotalLength .* trunk_HeadProximal)^2;
                                
trunk_HeadDistal =                  0.607;
momentInertia.trunk_HeadDistal =    bodySegMass.trunkMass .* ...
                                    (bodySegLength.trunkTotalLength .* trunk_HeadDistal)^2;
                                
density.trunk =                     1.03;

%% Head, arms, and trunk (HAT) radius of gyration COG, proximal, distal
%Includes: Thorax, Abdomen, Pelvis, and Head
HATCOG =                            0.903;
HATProximal =                       1.456;
HATDistal =                         0.00;

%Unsure if needed
% momentInertia.HATCOG = bodySegMass.HATMass...
%     .* (bodySegLength.chestTotalWidth .* HATCOG)^2;

%% UpperArm radius of gyration COG, proximal, distal and density
upperArmCOG =                       0.322;
momentInertia.upperArmCOG =         bodySegMass.upperArmMass .* ...
                                    (bodySegLength.upperArmTotalLength .* upperArmCOG)^2;
                                
upperArmProximal =                  0.542;
momentInertia.upperArmProximal =    bodySegMass.upperArmMass .* ...
                                    (bodySegLength.upperArmTotalLength .* upperArmProximal)^2;
                                
upperArmDistal =                    0.645;
momentInertia.upperArmDistal =      bodySegMass.upperArmMass .* ...
                                    (bodySegLength.upperArmTotalLength .* upperArmDistal)^2;
                                
density.upperArm =                  1.07;

%% Forearm radius of gyration COG, proximal, distal and density
forearmCOG =                        0.303;
momentInertia.forearmCOG =          bodySegMass.forearmMass .* ...
                                    (bodySegLength.forearmTotalLength .* forearmCOG)^2;
                                
forearmProximal =                   0.526;
momentInertia.forearmProximal =     bodySegMass.forearmMass .* ...
                                    (bodySegLength.forearmTotalLength .* forearmProximal)^2;
                                
forearmDistal =                     0.647;
momentInertia.forearmDistal =       bodySegMass.forearmMass .* ...
                                    (bodySegLength.forearmTotalLength .* forearmDistal)^2;

density.forearm =                   1.13;

%% Hand radius of gyration COG, proximal, distal and density
handCOG =                           0.297;
momentInertia.forearmProximal =     bodySegMass.handMass .* ...
                                    (bodySegLength.handTotalLength .* handCOG)^2;

handProximal =                      0.587;
momentInertia.handProximal =        bodySegMass.handMass .* ...
                                    (bodySegLength.handTotalLength .* handProximal)^2;

handDistal =                        0.577;
momentInertia.handDistal =          bodySegMass.handMass .* ...
                                    (bodySegLength.handTotalLength .* handDistal)^2;

density.hand =                      1.16;

%% Thigh radius of gyration COG, proximal, distal and density
thighCOG =                          0.323;
momentInertia.thighCOG =            bodySegMass.thighMass .* ...
                                    (bodySegLength.thighTotalLength .* thighCOG)^2;

thighProximal =                     0.540;
momentInertia.thighProximal =       bodySegMass.thighMass .* ...
                                    (bodySegLength.thighTotalLength .* thighProximal)^2;

thighDistal =                       0.653;
momentInertia.thighDistal =         bodySegMass.thighMass .* ...
                                    (bodySegLength.thighTotalLength .* thighDistal)^2;

density.thigh =                     1.05;

%% Leg radius of gyration COG, proximal, distal and density
legCOG =                            0.302;
momentInertia.legCOG =              bodySegMass.legMass .* ...
                                    (bodySegLength.legTotalLength .* legCOG)^2;

legProximal =                       0.528;
momentInertia.legProximal =         bodySegMass.legMass .* ...
                                    (bodySegLength.legTotalLength .* legProximal)^2;
                                
legDistal =                         0.643;
momentInertia.legDistal =           bodySegMass.legMass .* ...
                                    (bodySegLength.legTotalLength .* legDistal)^2;
                                
density.leg =                       1.09;

%% Foot radius of gyration COG, proximal, distal and density
footCOG =                           0.475;
momentInertia.footCOG =             bodySegMass.footMass .* ...
                                    (bodySegLength.footTotalLength .* footCOG)^2;

footProximal =                      0.690;
momentInertia.footProximal =        bodySegMass.footMass .* ...
                                    (bodySegLength.footTotalLength .* footProximal)^2;

footDistal =                        0.690;
momentInertia.footDistal =          bodySegMass.footMass .* ...
                                    (bodySegLength.footTotalLength .* footDistal)^2;

density.foot =                      1.10;

end
