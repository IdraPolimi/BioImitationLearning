function backStraight()


 mem= ALMemoryProxy('10.79.5.60',9559);
 mot= ALMotionProxy('10.79.5.60',9559);
 backVal=mem.getData('Device/SubDeviceList/InertialSensor/AngleY/Sensor/Value')


while(abs(backVal)>0.001)
 
 delta=backVal;
 actual_left=mot.getAngles('LHipPitch',true);
 actual_right=mot.getAngles('RHipPitch',true);

 newleft=cell2mat(actual_left)+delta;
 newright=cell2mat(actual_right)+delta;
 
 
 mot.angleInterpolationWithSpeed('LHipPitch',newleft,0.4);
 mot.angleInterpolationWithSpeed('RHipPitch',newleft,0.4);
 
 
 
 backVal=mem.getData('Device/SubDeviceList/InertialSensor/AngleY/Sensor/Value')


end

end