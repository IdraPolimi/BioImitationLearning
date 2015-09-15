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
% OUTPUT: 3D vector [x,y,z]



cameraMat=[fc(1,1), alpha, cc(1,1); 0, fc(2,1), cc(2,1); 0 0 1];
uvMat=[coords;1];

temp=inv(rotationMat)*inv(cameraMat)*uvMat;
temp2=rotationMat\traslationVec;%inv(rotationMat)*traslationVec is slower;

s=z+temp2(3,1);
s=s/temp(3,1);
point=rotationMat\(s\cameraMat*uvMat-traslationVec); %inv(rotationMat)*(s*inv(cameraMat)*uvMat-traslationVec) is slower;

end