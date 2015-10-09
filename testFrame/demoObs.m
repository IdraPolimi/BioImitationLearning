function demoObs()

IP='10.79.5.60';
load('globalvar.m');

[ETran,ERot]=preCalibration();

global FC
global CC
global ALPHA_C
global rot

grabAFrame('NaoEmptyTable.jpg');

textproxy = ALTextToSpeechProxy(IP,9559);
mem= ALMemoryProxy(IP,9559);


textproxy.say('Put the objects on the table!');
while(mem.getData('Device/SubDeviceList/Head/Touch/Front/Sensor/Value')==1.0 || mem.getData('Device/SubDeviceList/Head/Touch/Rear/Sensor/Value')==1.0 || ...
    mem.getData('Device/SubDeviceList/Head/Touch/Middle/Sensor/Value')==1.0)
         grabAFrame('NaoTableWObjects.jpg');

         [major,minor,cent,filtSaturTh]=findObstacle('NaoEmptyTable.jpg', 'NaoTableWObjects.jpg', 1);

         stats=regionprops(filtSaturTh,'Centroid','MajorAxisLength','MinorAxislength');
         
         [centerC,majorC,minorC,indexC]=selectTarget('NaoTableWObjects.jpg',stats);


         point=UV2XY(centerC, FC, CC, ALPHA_C, ERot, ETran, 0);

         pointCamera=fromWorldToCamera(ERot, ETran,point);
         pointCamera=(pointCamera'*rot)';
    
         pointTorso=Camera2Torso(pointCamera,getHeadAngles());

         moveArm(ERot,ETran,getHeadAngles(),pointTorso);
         
end

end