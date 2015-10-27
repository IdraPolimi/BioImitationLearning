function [] = set_goal( ID,goals )
%GET_GOAL Summary of this function goes here
%   Detailed explanation goes here


global DOF

for i=1:DOF
    dcp('set_goal',ID(i),goals(i,1),1);
end

end

