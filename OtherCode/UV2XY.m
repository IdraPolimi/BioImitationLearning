function point=UV2XY(coords, Ifc, Icc, Ialpha, Erotation, Etrans, z)
%   UV2XY transform 2D pixel coordinates [U,V] into 3D cartesian coordinate
% [x,y,z], with fixed known z (height)
% INPUT: coordinates [u;v] in pixel as column vector;
%        focal lenght as column vector (intrisic)
%        principal point as column vector (intrisic)
%        skew coefficient as float (intrisic)
%        3x3 rotation matrix (extrinsic)
%        3x1 translation vector (extrinsic)        
%        known height z as float 
% OUTPUT: 3D vector [x;y;z] as column vector

cameraMat=[Ifc(1,1), Ialpha, Icc(1,1); 0, Ifc(2,1), Icc(2,1); 0 0 1];
uvMat=[coords;1];

temp=inv(Erotation)*inv(cameraMat)*uvMat;
temp2=inv(Erotation)*Etrans;

s=z+temp2(3,1);
s=s/temp(3,1);
point=inv(Erotation)*(s*inv(cameraMat)*uvMat-Etrans);

end