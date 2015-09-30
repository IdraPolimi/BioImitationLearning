function []=moveArm(ERot,ETran,headangles)

global FC
global CC
global ALPHA_C
global rot


pointsPred=selectPointsInImage('TableAndNao.jpg',1);
pointPredMM=UV2XY(pointsPred,FC,CC,ALPHA_C,ERot,ETran,0);

pointsCamera=fromWorldToCamera(ERot,ETran, pointPredMM);

pointsCamera=(pointsCamera'*rot)';

pointsTorso=Camera2Torso(pointsCamera,headangles);

MOTION=ALMotionProxy('192.168.1.100',9559);
pointsPos=[pointsTorso(1)/1000,pointsTorso(2)/1000,pointsTorso(3)/1000,0,0,0];
pointsPos
MOTION.positionInterpolation('LArm',int16(0),pointsPos,int16(7),[5],true);



end