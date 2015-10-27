function [ g ] = get_goal( ID )
%GET_GOAL Summary of this function goes here
%   Detailed explanation goes here

global dcps

g=[dcps(ID(1)).G, dcps(ID(2)).G, dcps(ID(3)).G];

end

