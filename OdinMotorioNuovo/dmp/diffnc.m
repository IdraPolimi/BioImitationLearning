function [ derivata ] = diffnc( T,dt )
%DIFFNC Summary of this function goes here
%   Detailed explanation goes here

for i=1:size(T,1)-1
derivata(i,1) = (T(i+1)-T(i))/dt;
end
derivata(size(T,1),1)=0;

end

