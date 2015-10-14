function [pointR,cameraPos]=cameraPosition(angles,camera_id,pointD)


global CAMERA_ANGLES_UP
global CAMERA_ANGLES_DOWN

if(camera_id==0)
    %up camera
    pitchH=- angles(2)-0.021;%- 1.2°
else
     %down camera
    pitchH=- angles(2)-0.6928957;%- 39.7°
end

     rollH=angles(1);
     yawH=angles(3);
     
     
     cpCP = cos(pitchH);
     spCP = sin(pitchH);
     crCP = cos(rollH);
     srCP = sin(rollH);
     cyCP = cos(yawH);
     syCP = sin(yawH);

     RCP=[cyCP*cpCP, cyCP*spCP*srCP-syCP*crCP, cyCP*spCP*crCP+syCP*srCP;
          syCP*cpCP, syCP*spCP*srCP+cyCP*crCP, syCP*spCP*crCP-cyCP*srCP;
          -spCP, cpCP*srCP,cpCP*crCP];
      
     pointR=pointD(1:3)*RCP;
     
     %%%%%%%%%%%%%%%%%%%%%%%%%
     rollH=angles(1);
     pitchH=- angles(2);
     yawH=angles(3);

     
     cpCP = cos(pitchH);
     spCP = sin(pitchH);
     crCP = cos(rollH);
     srCP = sin(rollH);
     cyCP = cos(yawH);
     syCP = sin(yawH);

     R=[cyCP*cpCP, cyCP*spCP*srCP-syCP*crCP, cyCP*spCP*crCP+syCP*srCP;
         syCP*cpCP, syCP*spCP*srCP+cyCP*crCP, syCP*spCP*crCP-cyCP*srCP;
         -spCP, cpCP*srCP,cpCP*crCP];

if(camera_id==0)
     %up camera
     
     cameraPos=(CAMERA_ANGLES_UP'*R)';
else
     %down camera
     
    cameraPos=(CAMERA_ANGLES_DOWN'*R)';
end










end