function fusionImg()

imup=imread('UpCameraNao.jpg');
imdown=imread('DownCameraNao.jpg');


pitch=0.6720;
yaw=0;
roll=0;

cp = cos(pitch);
sp = sin(pitch);
cr = cos(roll); 
sr = sin(roll);
cy = cos(yaw); 
sy = sin(yaw);

R=[cy*cp, cy*sp*sr-sy*cr, cy*sp*cr+sy*sr;
   sy*cp, sy*sp*sr+cy*cr, sy*sp*cr-cy*sr;
   -sp, cp*sr,cp*cr];



x=45.9;

y=0;

z=8;%mm

RTMatrix=[R,[x;y;z];zeros(1,3),1];

tformM=projective2d(R);
im2t=imwarp(imdown,tformM);
size(im2t)
imshow(im2t);















end