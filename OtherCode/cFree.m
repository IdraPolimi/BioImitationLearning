function []=cFree()

MOTION=ALMotionProxy('192.168.1.100',9559);
minshoulderroll = -0.3142;
maxshoulderroll = 1.3265;

minshoulderpitch = -2.0857;
maxshoulderpitch = 2.0857;

minelbowroll =  -1.5446;
maxelbowroll =  -0.0349;

minelbowyaw=-2.0857;
maxelbowyaw=2.0857;

passo=0.01;

for i=minshoulderroll:passo:maxshoulderroll
    for j=minshoulderpitch:passo:maxshoulderpitch
        for k=minelbowroll:passo:maxelbowroll
            for w=minelbowyaw:passo:maxelbowyaw
                MOTION.angleInterpolationWithSpeed('LShoulderRoll',i,0.4);
                MOTION.angleInterpolationWithSpeed('LElbowYaw',w,0.4);
                MOTION.angleInterpolationWithSpeed('LElbowRoll',k,0.4);
                MOTION.angleInterpolationWithSpeed('LShoulderPitch',j,0.4);
                pause(0.01);
            end
        end
    end
end
    









end