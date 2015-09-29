function pointTorso=Camera2Torso(pointCamera,anglesHead)

global CAMERA_ANGLES
global NeckOffsetZ

roll=anglesHead(1);
pitch=anglesHead(2);%+backAngles(2)
yaw=anglesHead(3);%-backAngles(1)

cp = cos(pitch);
sp = sin(pitch);
cr = cos(roll); 
sr = sin(roll);
cy = cos(yaw); 
sy = sin(yaw);

R=[cy*cp, cy*sp*sr-sy*cr, cy*sp*cr+sy*sr;
   sy*cp, sy*sp*sr+cy*cr, sy*sp*cr-cy*sr;
   -sp, cp*sr,cp*cr];

A=[R,CAMERA_ANGLES;zeros(1,3),1];

%pointCamera=[pointCamera;1];
pointTorso=A*pointCamera;

pointTorso(3)=pointTorso(3)+NeckOffsetZ;

end