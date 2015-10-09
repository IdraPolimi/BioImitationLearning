function pointT=testFrame(pointS,ERot,ETran)

global rot
global CAMERA_ANGLES_UP
global NeckOffsetZ

%punto mondo in sistema camera,con sistema riferimento sballato
pointC=ERot*pointS+ETran;
pointC

%sistema riferimento camera ruotato
pointD=[pointC;1]'*rot;
pointD

angles=getHeadAngles(0);
rollH=angles(1);
yawH=angles(3);
pitchH=-angles(2);
cpCP = cos(pitchH);
spCP = sin(pitchH);
crCP = cos(rollH);
srCP = sin(rollH);
cyCP = cos(yawH);
syCP = sin(yawH);

RCP=[cyCP*cpCP, cyCP*spCP*srCP-syCP*crCP, cyCP*spCP*crCP+syCP*srCP;
syCP*cpCP, syCP*spCP*srCP+cyCP*crCP, syCP*spCP*crCP-cyCP*srCP;
-spCP, cpCP*srCP,cpCP*crCP];

%giro la camera che era ancora storta
pointR=pointD(1:3)*RCP;
cameraPos=(CAMERA_ANGLES_UP'*RCP)';

cameraPos(3)=cameraPos(3)+NeckOffsetZ
pointT=pointR'+cameraPos












end