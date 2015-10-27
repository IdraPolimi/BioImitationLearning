function [ output_args ] = movimenti( ID )
%MOVIMENTI Summary of this function goes here
%   Detailed explanation goes here

global MOTION
global NAMES
global dcps
%NAMES={'LArm'};
name1='LElbowRoll';
name2='LElbowYaw';
name3='LShoulderPitch';
name4='LShoulderRoll';
NAMES={name1, name2, name3, name4};
MOTION=ALMotionProxy('10.79.5.60', 9559);
dt        = 0.001;
g=[dcps(ID(1)).G, dcps(ID(2)).G, dcps(ID(3)).G, dcps(ID(4)).G];
timeLists=[ 0.04000, 0.08000, 0.12000, 0.16000, 0.20000, 0.24000, 0.28000, 0.32000, 0.36000, 0.40000, 0.44000, 0.48000, 0.52000, 0.56000, 0.60000, 0.64000, 0.68000, 0.72000, 0.76000, 0.80000, 0.84000, 0.88000, 0.92000, 0.96000, 1.00000, 1.04000, 1.08000, 1.12000, 1.16000, 1.20000, 1.24000, 1.28000, 1.32000, 1.36000, 1.40000, 1.44000, 1.48000, 1.52000, 1.56000, 1.60000, 1.64000, 1.68000, 1.72000, 1.76000, 1.80000, 1.84000, 1.88000, 1.92000, 1.96000, 2.00000, 2.04000, 2.08000, 2.12000, 2.16000, 2.20000, 2.24000, 2.28000, 2.32000, 2.36000, 2.40000, 2.44000, 2.48000, 2.52000, 2.56000, 2.60000, 2.64000, 2.68000, 2.72000, 2.76000, 2.80000, 2.84000, 2.88000, 2.92000, 2.96000, 3.00000, 3.04000, 3.08000, 3.12000, 3.16000, 3.20000, 3.24000, 3.28000, 3.32000, 3.36000, 3.40000, 3.44000, 3.48000, 3.52000, 3.56000, 3.60000, 3.64000, 3.68000, 3.72000, 3.76000, 3.80000, 3.84000, 3.88000, 3.92000, 3.96000, 4.00000, 4.04000, 4.08000, 4.12000, 4.16000, 4.20000, 4.24000, 4.28000, 4.32000, 4.36000, 4.40000, 4.44000, 4.48000, 4.52000, 4.56000, 4.60000, 4.64000, 4.68000, 4.72000, 4.76000, 4.80000, 4.84000, 4.88000, 4.92000, 4.96000, 5.00000, 5.04000, 5.08000, 5.12000, 5.16000, 5.20000, 5.24000, 5.28000, 5.32000, 5.36000, 5.40000, 5.44000, 5.48000, 5.52000, 5.56000, 5.60000, 5.64000, 5.68000, 5.72000, 5.76000, 5.80000, 5.84000, 5.88000, 5.92000, 5.96000, 6.00000, 6.04000, 6.08000, 6.12000, 6.16000, 6.20000, 6.24000, 6.28000, 6.32000, 6.36000, 6.40000, 6.44000, 6.48000, 6.52000, 6.56000, 6.60000, 6.64000, 6.68000, 6.72000, 6.76000, 6.80000, 6.84000, 6.88000, 6.92000, 6.96000, 7.00000, 7.04000, 7.08000, 7.12000, 7.16000, 7.20000, 7.24000, 7.28000, 7.32000, 7.36000, 7.40000, 7.44000, 7.48000, 7.52000, 7.56000, 7.60000, 7.64000, 7.68000, 7.72000, 7.76000, 7.80000, 7.84000, 7.88000, 7.92000, 7.96000, 8.00000, 8.04000, 8.08000, 8.12000, 8.16000, 8.20000, 8.24000, 8.28000, 8.32000, 8.36000, 8.40000, 8.44000, 8.48000, 8.52000, 8.56000, 8.60000, 8.64000, 8.68000, 8.72000, 8.76000, 8.80000, 8.84000, 8.88000, 8.92000, 8.96000, 9.00000, 9.04000, 9.08000, 9.12000, 9.16000, 9.20000, 9.24000, 9.28000, 9.32000, 9.36000, 9.40000, 9.44000, 9.48000, 9.52000, 9.56000, 9.60000, 9.64000, 9.68000, 9.72000, 9.76000, 9.80000, 9.84000, 9.88000, 9.92000, 9.96000, 10.00000, 10.04000, 10.08000, 10.12000, 10.16000, 10.20000, 10.24000, 10.28000, 10.32000, 10.36000, 10.40000, 10.44000, 10.48000, 10.52000, 10.56000, 10.60000, 10.64000, 10.68000, 10.72000, 10.76000, 10.80000, 10.84000, 10.88000, 10.92000, 10.96000, 11.00000, 11.04000, 11.08000, 11.12000, 11.16000, 11.20000, 11.24000, 11.28000, 11.32000, 11.36000, 11.40000, 11.44000, 11.48000, 11.52000, 11.56000, 11.60000, 11.64000, 11.68000, 11.72000, 11.76000, 11.80000, 11.84000, 11.88000, 11.92000, 11.96000, 12.00000, 12.04000, 12.08000, 12.12000, 12.16000, 12.20000, 12.24000, 12.28000, 12.32000, 12.36000, 12.40000, 12.44000, 12.48000, 12.52000, 12.56000, 12.60000, 12.64000, 12.68000, 12.72000, 12.76000, 12.80000, 12.84000, 12.88000, 12.92000, 12.96000, 13.00000, 13.04000, 13.08000, 13.12000, 13.16000, 13.20000, 13.24000, 13.28000, 13.32000, 13.36000, 13.40000, 13.44000, 13.48000, 13.52000, 13.56000, 13.60000, 13.64000, 13.68000, 13.72000, 13.76000, 13.80000, 13.84000, 13.88000, 13.92000, 13.96000, 14.00000, 14.04000, 14.08000, 14.12000, 14.16000, 14.20000, 14.24000, 14.28000, 14.32000, 14.36000, 14.40000, 14.44000, 14.48000, 14.52000, 14.56000, 14.60000, 14.64000, 14.68000, 14.72000, 14.76000, 14.80000, 14.84000, 14.88000, 14.92000, 14.96000, 15.00000, 15.04000, 15.08000, 15.12000, 15.16000, 15.20000, 15.24000, 15.28000, 15.32000, 15.36000, 15.40000, 15.44000, 15.48000, 15.52000, 15.56000, 15.60000, 15.64000, 15.68000, 15.72000, 15.76000, 15.80000, 15.84000, 15.88000, 15.92000, 15.96000, 16.00000, 16.04000, 16.08000, 16.12000, 16.16000, 16.20000, 16.24000, 16.28000, 16.32000, 16.36000, 16.40000, 16.44000, 16.48000, 16.52000, 16.56000, 16.60000, 16.64000, 16.68000, 16.72000, 16.76000, 16.80000, 16.84000, 16.88000, 16.92000, 16.96000, 17.00000, 17.04000, 17.08000, 17.12000, 17.16000, 17.20000, 17.24000, 17.28000, 17.32000, 17.36000, 17.40000, 17.44000, 17.48000, 17.52000, 17.56000, 17.60000, 17.64000, 17.68000, 17.72000, 17.76000, 17.80000, 17.84000, 17.88000, 17.92000, 17.96000, 18.00000, 18.04000, 18.08000, 18.12000, 18.16000, 18.20000, 18.24000, 18.28000, 18.32000, 18.36000, 18.40000, 18.44000, 18.48000, 18.52000, 18.56000, 18.60000, 18.64000, 18.68000, 18.72000, 18.76000, 18.80000, 18.84000, 18.88000, 18.92000, 18.96000, 19.00000, 19.04000, 19.08000, 19.12000, 19.16000, 19.20000, 19.24000, 19.28000, 19.32000, 19.36000, 19.40000, 19.44000, 19.48000, 19.52000, 19.56000, 19.60000, 19.64000, 19.68000, 19.72000, 19.76000, 19.80000, 19.84000, 19.88000, 19.92000, 19.96000, 20.00000];
tau=0.5;
pos_corrente = cell2mat( MOTION.getAngles(NAMES, false))
for k=1:4
        dcp('reset_state',ID(k));
        dcp('set_goal',ID(k),g(k),1);
        dcp('Change',ID(k),'y',pos_corrente(k));
        dcp('Change',ID(k),'y0',pos_corrente(k));
    for i=0:2*tau/dt,
        [y,yd,ydd]=dcp('run',ID(k),tau,dt);
        Z(i+1,:)   = [dcps(ID(k)).z dcps(ID(k)).zd];
        Y(i+1,:)   = [y yd ydd];
        angoli(k,i+1)=y;
        X(i+1,:)   = [dcps(ID(k)).x dcps(ID(k)).xd];
        V(i+1,:)   = [dcps(ID(k)).v dcps(ID(k)).vd];
        PSI(i+1,:) = dcps(ID(k)).psi';
        W(i+1,:)   = dcps(ID(k)).w';
    end;
    
end

n=i+1;

m=size(timeLists,2);

for k=1:4
    for i=1:m
        if(floor((n/m)*i)<=1001)
            angoli_finali(k,i)=angoli(k,floor((n/m)*i));
        end
    end
end

grandezza_dmp = n;
grandezza_timeLists=m;
grandezza=size(angoli_finali);
angoli_finali;

k=300;
j=1:k;

%angoli_finali = mat2cell([angoli_finali(1,j),angoli_finali(2,j),angoli_finali(3,j),angoli_finali(4,j)],1,[k k k k]);
%MOTION.angleInterpolation(NAMES, angoli_finali, mat2cell([timeLists(j),timeLists(j),timeLists(j),timeLists(j)],1,[k k k k]),true);

% for i=1:500
%     angoli=mat2cell([angoli_finali1(i), angoli_finali2(i),angoli_finali3(i), angoli_finali4(i)],1,[1 1 1 1]);
%     MOTION.setAngles(NAMES, angoli, 0.02);
%     pause(0.05)
% end

for i=1:300
    angoli=num2cell([angoli_finali(1,i), angoli_finali(2,i),angoli_finali(3,i), angoli_finali(4,i)]);
    MOTION.angleInterpolationWithSpeed(NAMES, angoli, 0.4);
end


end

