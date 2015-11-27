function angles = getHeadAngles(camera_id)

mem= ALMemoryProxy('192.168.1.100',9559);
angles(1) = 0;
if(camera_id==0)
     angles(2) =mem.getData('Device/SubDeviceList/HeadPitch/Position/Sensor/Value');
else
     angles(2) =mem.getData('Device/SubDeviceList/HeadPitch/Position/Sensor/Value');
end 
angles(3)= mem.getData('Device/SubDeviceList/HeadYaw/Position/Sensor/Value');
end

