function angles = getBackAngles()

mem= ALMemoryProxy('10.79.5.60',9559);
angles(1) = mem.getData('Device/SubDeviceList/InertialSensor/AngleX/Sensor/Value')
angles(2) =mem.getData('Device/SubDeviceList/InertialSensor/AngleY/Sensor/Value')
end

