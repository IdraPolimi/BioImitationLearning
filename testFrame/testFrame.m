function [pointT,cameraPos]=testFrame(pointS,ERot,ETran)

global rot

global NeckOffsetZ
global CAMERA_ANGLES_UP

%punto mondo in sistema camera,con sistema riferimento sballato
pointC=ERot*pointS+ETran;
pointC

%sistema riferimento camera ruotato
pointD=[pointC;1]'*rot;
pointD

[pointR,cameraPos]=cameraPosition(getHeadAngles(0),0,pointD);%UP CAMERA
%[pointR,cameraPos]=cameraPosition([0;0.408002138137817;-0.018450021743774],1,pointD);%DOWN CAMERA

% cameraPos(3)=cameraPos(3)+NeckOffsetZ
% 
% pointT=pointR'+cameraPos

angles=getHeadAngles(0);
% rollH=0;
% yawH=-0.018450021743774;
% pitchH=- 0.408002138137817-0.021;%- 1.2�
rollH=angles(1);
yawH=angles(3);
pitchH=-angles(2)-0.021;
%pitchH=- 0.408002138137817-0.6928957;%- 39.7�
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

% rollH=0;
% yawH=-0.018450021743774;
% pitchH=- 0.408002138137817;%- 1.2�
rollH=angles(1);
yawH=angles(3);
pitchH=-angles(2);
%pitchH=- 0.408002138137817;%- 39.7�
cpCP = cos(pitchH);
spCP = sin(pitchH);
crCP = cos(rollH);
srCP = sin(rollH);
cyCP = cos(yawH);
syCP = sin(yawH);

R=[cyCP*cpCP, cyCP*spCP*srCP-syCP*crCP, cyCP*spCP*crCP+syCP*srCP;
syCP*cpCP, syCP*spCP*srCP+cyCP*crCP, syCP*spCP*crCP-cyCP*srCP;
-spCP, cpCP*srCP,cpCP*crCP];

%giro la camera che era ancora storta

cameraPos=(CAMERA_ANGLES_UP'*R)';
%cameraPos=(CAMERA_ANGLES_DOWN'*R)';

cameraPos(3)=cameraPos(3)+NeckOffsetZ
pointT=pointR'+cameraPos


%%%%
% [0;0;0]
% [62;62;0]
% [93;62;0]
% [124;93;0]
% [93;155;0]

%radianti testa 29.5
% ans =
% 
%          0    0.5092   -0.0123



%%%%
%newangles=[0 ;0.532256126403809 ;-0.029187917709351]

%angles con scacchiera stampata
%[0 ;0.408002138137817 ;-0.018450021743774]

%ultimi angoli

%[0    0.5261    0.0184]


end