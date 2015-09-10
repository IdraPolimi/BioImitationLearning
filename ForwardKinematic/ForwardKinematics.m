function [] = ForwardKinematics()
close all;
clc;

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


%shoulderpitch,shoulderroll,elbowyaw,elbowroll
thetasL(1)=0;%59.80
thetasL(2)=0;%6,38
thetasL(3)=0;
thetasL(4)=-0.5149;%70,64
fLeftHand(thetasL);



end







