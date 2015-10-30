function [ r ] = Calcola_reward(  )
%REWARD Summary of this function goes here
%   Detailed explanation goes here
global POS_EFF_REWARD
global MOTION
global R_ANG
global R_CAR
global COMPLETATO
global pos_arrivo

global ax
pos_arrivo=cell2mat(MOTION.getPosition('LArm', int8(0), false));
dist_cart=exp(norm(POS_EFF_REWARD(1:3)-pos_arrivo(1:3),2)^(1/3));
dist_ango=abs(POS_EFF_REWARD(4)-pos_arrivo(4));
R_ANG=dist_ango;
%distanza_cartesiana_exp=dist_cart
R_CAR=dist_cart;
r=dist_cart+dist_ango;

% %plot
figure(2)
plot(ax,norm(POS_EFF_REWARD(1:3)-pos_arrivo(1:3),2), '*-');
ax=ax+1;
axis equal
hold on
drawnow

end

