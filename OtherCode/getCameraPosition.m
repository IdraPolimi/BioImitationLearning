function cameraPosition=getCameraPosition(angles)
% getCameraPosition: from pitch and yaw of neck, computes
% camera pose wrt torso frame.
% INPUT: a vector like this: [roll,pitch,yaw], in radians;
% OUTPUT: a vector like this: [x,y,z], in mm

global CAMERA_ANGLES

vec=CAMERA_ANGLES;

roll=angles(1);
pitch=angles(2);
yaw=angles(3);

cp = cos(pitch);
sp = sin(pitch);
cr = cos(roll); 
sr = sin(roll);
cy = cos(yaw); 
sy = sin(yaw);

R=[cy*cp, cy*sp*sr-sy*cr, cy*sp*cr+sy*sr;
   sy*cp, sy*sp*sr+cy*cr, sy*sp*cr-cy*sr;
   -sp, cp*sr,cp*cr];

cameraPosition = R*vec;

end