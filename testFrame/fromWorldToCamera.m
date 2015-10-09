function [pointCamera]=fromWorldToCamera(Erotation, Etrans,pointW)


realPointW=[pointW;1];
A=[Erotation,Etrans;zeros(1,3),1];
pointCamera=A*realPointW;

end