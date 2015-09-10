function [Tendend left] = fLeftHand(thetas)

%shoulderpitch,shoulderroll,elbowyaw,elbowroll
global shoulderOffsetY
global shoulderOffsetZ
global elbowOffsetY
global LowerArmLength
global HandOffsetX
global upperArmLength
global HandOffsetZ
global MOTION

name1='LElbowRoll';
name2='LElbowYaw';
name3='LShoulderPitch';
name4='LShoulderRoll';
NAMES={name1, name2, name3, name4};

% angoli(1)=1.2323;
% angoli(2)=0;
% angoli(3)=1.0432;
% angoli(4)=0.1113;

 IP='10.79.5.170';
 PORT=9559;
 MOTION=ALMotionProxy(IP, PORT);

base = eye(4,4);
base(2,4) = shoulderOffsetY;
base(3,4) = shoulderOffsetZ;

T1 = DH(0,-pi/2,0,thetas(1));
T2 = DH(0,pi/2,0,thetas(2)+pi/2);
T3 = DH(elbowOffsetY,pi/2,upperArmLength,thetas(3));
T4 = DH(0,-pi/2,0,thetas(4));

R = RotXYZMatrix(0,0,-pi/2);

Tend1 = eye(4,4);
Tend1(1,4) = HandOffsetX+LowerArmLength;
Tend1(3,4) = -HandOffsetZ;
Tend = R*Tend1;
Tendend = base*T1*T2*T3*T4*Tend;


rotZ = atan2(Tendend(2,1),Tendend(1,1));
rotY = atan2(-Tendend(3,1),sqrt(Tendend(3,2)^2 + Tendend(3,3)^2));
rotX = atan2(Tendend(3,2),Tendend(3,3));
left = [Tendend(1:3,4)./1000;rotX;rotY;rotZ];
left
%left=[0.01,0,0.01,0,0,0];
MOTION.setPosition('LArm',int16(0),left,0.8,int16(63))
current=MOTION.getPosition('LArm',int16(0),false);
current
%MOTION.angleInterpolationWithSpeed(NAMES, angoli, 0.4);

end
