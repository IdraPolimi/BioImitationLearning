function [p]=fromxy_to3d(u,v)

%parametri intrinsechi camera Nao
%-- Focal length:
fc = [ 1114.195904015574600 ; 1111.819509408135900 ];

%-- Principal point:
cc = [ 608.598486063577410 ; 463.659865874863100 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%altezza 
z=0;

cameraMat=[fc(1,1) alpha_c cc(1,1);0 fc(2,1) cc(2,1);0 0 1];

uvMat=[u;v;1];
% rotationMat=[ 0.012409 	 0.999874 	 -0.009859;
%               0.541829 	 -0.015010 	 -0.840355;
%              -0.840397 	 0.005086 	 -0.541947 ];
% 
% traslationVec=[ -135.826580 ;-13.012343 ; 504.172462 ];

traslationVec =[-137.1091;
   -38.2138;
   434.6896];

rotationMat=[ -0.3124    0.9494   -0.0337;
     0.4523    0.1175   -0.8841;
    -0.8354   -0.2914   -0.4661];


temp=inv(rotationMat)*inv(cameraMat)*uvMat;
temp2=inv(rotationMat)*traslationVec;

s=z+temp2(3,1);
s=s/temp(3,1);
p=inv(rotationMat)*(s*inv(cameraMat)*uvMat-traslationVec);

p




















end