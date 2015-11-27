function angles = getHeadAngles()

mem= ALMemoryProxy('192.168.1.102',9559);
angles(1) = 0;
angles(2) =mem.getData('Device/SubDeviceList/HeadPitch/Position/Sensor/Value');
angles(3)= mem.getData('Device/SubDeviceList/HeadYaw/Position/Sensor/Value');
end

