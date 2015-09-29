function angles = getBackAngles()

mem= ALMemoryProxy('10.79.5.60',9559);
x =mem.getData('Device/SubDeviceList/InertialSensor/AngleX/Sensor/Value')
y =mem.getData('Device/SubDeviceList/InertialSensor/AngleY/Sensor/Value')
z =mem.getData('Device/SubDeviceList/InertialSensor/AngleZ/Sensor/Value')
end

