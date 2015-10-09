function cameraPos=Camera2Torso(anglesHead,camera_id)

global CAMERA_ANGLES_UP
global CAMERA_ANGLES_DOWN
global NeckOffsetZ

%roll=anglesHead(1);
%pitch=anglesHead(2);
%yaw=anglesHead(3);

%cp = cos(pitch);
%sp = sin(pitch);
%cr = cos(roll); 
%sr = sin(roll);
%cy = cos(yaw); 
%sy = sin(yaw);

%R=[cy*cp, cy*sp*sr-sy*cr, cy*sp*cr+sy*sr;
 %  sy*cp, sy*sp*sr+cy*cr, sy*sp*cr-cy*sr;
 %  -sp, cp*sr,cp*cr];

rollCP=anglesHead(1);
pitchCP=-anglesHead(2);
yawCP=anglesHead(3);

cpCP = cos(pitchCP);
spCP = sin(pitchCP);
crCP = cos(rollCP); 
srCP = sin(rollCP);
cyCP = cos(yawCP); 
syCP = sin(yawCP);

RCP=[cyCP*cpCP, cyCP*spCP*srCP-syCP*crCP, cyCP*spCP*crCP+syCP*srCP;
   syCP*cpCP, syCP*spCP*srCP+cyCP*crCP, syCP*spCP*crCP-cyCP*srCP;
   -spCP, cpCP*srCP,cpCP*crCP];

if(camera_id==0)
    %pointCameraTrans=pointCamera+[CAMERA_ANGLES_UP;0]
    cameraPos=(CAMERA_ANGLES_UP'*RCP)'
    %A=[R,cameraPos;zeros(1,3),1];
else
    %pointCameraTrans=pointCamera+[CAMERA_ANGLES_DOWN;0]
    cameraPos=(CAMERA_ANGLES_DOWN'*RCP)'
    %A=[R,cameraPos;zeros(1,3),1];
end

%pointCamera=[pointCamera;1];
%pointTorso=A*pointCamera

%pointTorso=A*pointCamera

%pointTorso(3)=pointTorso(3)+NeckOffsetZ;
cameraPos(3) = cameraPos(3)+NeckOffsetZ;

end