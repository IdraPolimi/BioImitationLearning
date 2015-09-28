global CAMERA_ANGLES
global FC
global CC
global KC
global ALPHA_C
global shoulderOffsetY
global elbowOffsetY
global upperArmLength
global shoulderOffsetZ
global LowerArmLength
global HandOffsetX
global HandOffsetZ
global HipOffsetZ
global HipOffsetY
global ThighLength
global TibiaLength
global FootHeight
global NeckOffsetZ
global rot

shoulderOffsetY = 98;
elbowOffsetY = 15;
upperArmLength = 105;
shoulderOffsetZ = 100;
HandOffsetX = 57.75;
HandOffsetZ = 12.31;
LowerArmLength = 55.95;
HipOffsetZ = 85; 
HipOffsetY = 50;
ThighLength = 100;
TibiaLength = 102.90;
FootHeight = 45.11;
NeckOffsetZ = 126.5;


CAMERA_ANGLES=[58.71;0;63.64];

%%INTRISIC PARAM OF TOP CAMERA
FC = [ 1131.12272 ;  1127.87988 ]; 
CC = [ 625.10527 ;  457.75935 ] ;
KC = [ -0.0313 ; 0.0521 ; -0.0037 ; -0.0034 ; 0];
ALPHA_C=0;


%%ROTATION MATRIX FROM CAMERA REFERENCE TO OUR CAMERA REFERENCE
rot = [cos(-pi/2) 0 sin(-pi/2) 0;0 1 0 0;-sin(-pi/2) 0 cos(-pi/2) 0;0 0 0 1]*[1 0 0 0;0 cos(pi/2) -sin(pi/2) 0;0 sin(pi/2) cos(pi/2) 0;0 0 0 1];