function []=fromWorldToCamera(Erotation, Etrans,pointW)


realPointW=[pointW;1]

%temp=(-Erotation)*Etrans;



A=[Erotation,Etrans;zeros(1,3),1];

A


pointCamera=A*realPointW;

pointCamera











end