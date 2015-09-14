function  [R]=rot()

roll=0;
pitch=0;
yaw=2.0857;

x=58.71;
y=0;
z=63.64;

vec=[x;y;z];

cp = cos(pitch); sp = sin(pitch);
cr = cos(roll); sr = sin(roll);
cy = cos(yaw); sy = sin(yaw);

R=[cy*cp cy*sp*sr-sy*cr cy*sp*cr+sy*sr;
   sy*cp sy*sp*sr+cy*cr sy*sp*cr-cy*sr;
   -sp   cp*sr          cp*cr];


res=R*vec;

res
   










end