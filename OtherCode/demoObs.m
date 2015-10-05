function demoObs()

global FC
global CC
global ALPHA_C
global rot

grabAFrame('NaoEmptyTable.jpg');


textproxy = ALTextToSpeechProxy('10.79.5.60',9559);

textproxy.say('Put the objects on the table!');
%%%%%attesa 
grabAFrame('NaoTableWObjects.jpg');

[major,minor,cent,filtSaturTh]=findObstacle('NaoEmptyTable.jpg', 'NaoTableWObjects.jpg', 1);

stats=regionprops(filtSaturTh,'Centroid','MajorAxisLength','MinorAxislength');

[centerC,majorC,minorC,indexC]=selectTarget('NaoTableWObjects.jpg',stats);


point=UV2XY(centerC, FC, CC, ALPHA_C, ERot, ETran, 0);

pointCamera=fromWorldToCamera(ERot, ETran,point);
pointCamera=(pointCamera'*rot)';
%angleshead
pointTorso=Camera2Torso(pointCamera,anglesHead);

moveArm(ERot,ETran,headangles,pointTorso);

end