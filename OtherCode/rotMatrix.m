function [pointRot]=rotMatrix(points)

rotx=[1 0 0 0;0 cos(pi/2) -sin(pi/2) 0;0 sin(pi/2) cos(pi/2) 0;0 0 0 1];

roty=[cos(-pi/2) 0 sin(-pi/2) 0;0 1 0 0;-sin(-pi/2) 0 cos(-pi/2) 0;0 0 0 1];



roty*rotx
pointRot(:,1)=(roty*rotx)*points(:,1)
pointRot(:,2)=(roty*rotx)*points(:,2)
pointRot(:,3)=(roty*rotx)*points(:,3)
pointRot(:,4)=(roty*rotx)*points(:,4)



pointRot

end