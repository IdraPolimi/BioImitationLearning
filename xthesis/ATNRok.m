function [dcps, goalRel] = ATNRok(T,dt,tau, names, threshold)
  %  T1=[ -0.15336, -0.15336, -0.15336, -0.15489, -0.15336, -0.15336, -0.15336, -0.15336, -0.15336, -0.15336, -0.15336, -0.15336, -0.15336, -0.15336, -0.15336, -0.15336, -0.15336, -0.15336, -0.15336, -0.15336, -0.15336, -0.15336, -0.15336, -0.15336, -0.15336, -0.15336, -0.15336, -0.15336, -0.15336, -0.15336, -0.15336, -0.15336, -0.15336, -0.15336, -0.15336, -0.15336, -0.15336, -0.15336, -0.15336, -0.15182, -0.15182, -0.15029, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13188, -0.13188, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13188, -0.13188, -0.13188, -0.13188, -0.13342, -0.13342, -0.13188, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13188, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13188, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13188, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13188, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13495, -0.13342, -0.13342, -0.13342, -0.13342, -0.13342, -0.13495, -0.13495, -0.13495, -0.13495, -0.13342, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13648, -0.13495, -0.13648, -0.13495, -0.13648, -0.13648, -0.13495, -0.13648, -0.13648, -0.13648, -0.13648, -0.13648, -0.13648, -0.13495, -0.13648, -0.13648, -0.13495, -0.13495, -0.13648, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13342, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13342, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13648, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495, -0.13495];
%    T2=[ -0.20253, -0.20253, -0.20253, -0.20100, -0.20253, -0.20100, -0.20253, -0.20253, -0.20253, -0.20253, -0.20253, -0.20253, -0.20253, -0.20253, -0.20253, -0.20253, -0.20253, -0.20253, -0.20253, -0.20100, -0.20253, -0.20253, -0.20100, -0.20253, -0.20100, -0.20253, -0.20253, -0.20253, -0.20253, -0.20253, -0.20253, -0.20253, -0.20253, -0.20253, -0.20253, -0.20253, -0.20253, -0.20253, -0.20253, -0.21020, -0.21020, -0.21173, -0.21173, -0.21173, -0.21173, -0.21173, -0.21327, -0.21327, -0.21173, -0.21327, -0.21327, -0.21327, -0.21327, -0.21173, -0.21173, -0.21327, -0.21173, -0.21173, -0.21173, -0.21173, -0.21327, -0.21173, -0.21173, -0.21173, -0.21173, -0.21173, -0.21173, -0.21173, -0.21327, -0.21173, -0.21173, -0.21173, -0.21173, -0.21327, -0.21173, -0.21327, -0.21173, -0.21327, -0.21327, -0.21173, -0.21173, -0.21173, -0.21173, -0.21173, -0.21327, -0.21173, -0.21173, -0.21173, -0.21327, -0.21173, -0.21173, -0.21173, -0.21327, -0.21173, -0.21173, -0.21173, -0.21173, -0.21173, -0.21327, -0.21173, -0.21173, -0.21173, -0.21173, -0.21173, -0.21173, -0.21173, -0.21173, -0.21173, -0.21327, -0.21173, -0.21173, -0.21173, -0.21173, -0.21173, -0.21173, -0.21173, -0.21327, -0.21173, -0.21327, -0.21173, -0.21327, -0.21173, -0.21173, -0.21173, -0.21173, -0.21173, -0.21173, -0.21173, -0.21173, -0.21327, -0.21173, -0.21327, -0.21173, -0.21173, -0.21173, -0.21173, -0.21327, -0.21173, -0.21327, -0.21173, -0.21173, -0.21327, -0.21327, -0.21173, -0.21327, -0.21327, -0.21327, -0.21327, -0.21327, -0.21327, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21480, -0.21173, -0.20560, -0.20253, -0.19793, -0.19179, -0.18412, -0.17338, -0.16418, -0.15498, -0.14731, -0.13810, -0.12890, -0.11663, -0.10435, -0.08901, -0.07674, -0.06600, -0.04606, -0.03993, -0.02152, -0.01538, -0.00464, 0.00456, 0.01376, 0.02297, 0.03217, 0.03984, 0.04598, 0.05211, 0.05518, 0.05825, 0.06439, 0.06745, 0.06745, 0.07359, 0.07819, 0.08279, 0.08740, 0.09046, 0.09200, 0.09507, 0.09660, 0.09967, 0.10120, 0.10274, 0.10274, 0.10274, 0.10274, 0.10274, 0.10274, 0.10274, 0.10274, 0.10274, 0.10274, 0.10274, 0.10274, 0.10274, 0.10427, 0.10427, 0.10580, 0.10734, 0.11041, 0.11654, 0.11961, 0.12268, 0.12421, 0.12728, 0.12881, 0.12881, 0.12881, 0.12881, 0.12881, 0.12881, 0.12881, 0.12881, 0.12881, 0.12881, 0.12881, 0.12881, 0.12881, 0.12881, 0.12881, 0.12881, 0.12881, 0.12881, 0.12881, 0.12881, 0.12728, 0.12728, 0.12881, 0.12881, 0.12881, 0.12881, 0.12881, 0.12728, 0.12728, 0.12881, 0.12881, 0.12881, 0.12881, 0.12881, 0.12728, 0.12881, 0.12881, 0.12881, 0.12881, 0.12881, 0.12728, 0.12881, 0.12881, 0.12881];
%    T3=[ 1.64594, 1.64441, 1.64594, 1.64594, 1.64594, 1.64594, 1.64594, 1.64594, 1.64594, 1.64594, 1.64594, 1.64594, 1.64594, 1.64594, 1.64594, 1.64594, 1.64594, 1.64594, 1.64594, 1.64594, 1.64594, 1.64594, 1.64441, 1.64594, 1.64594, 1.64441, 1.64594, 1.64594, 1.64594, 1.64594, 1.64594, 1.64441, 1.64594, 1.64594, 1.64594, 1.64441, 1.64594, 1.64594, 1.63827, 1.63060, 1.62140, 1.61373, 1.60299, 1.59072, 1.57844, 1.57077, 1.56157, 1.55543, 1.55237, 1.55083, 1.55083, 1.55083, 1.55083, 1.54930, 1.54930, 1.55083, 1.54930, 1.54930, 1.54776, 1.54623, 1.54316, 1.54009, 1.53856, 1.53703, 1.53703, 1.53703, 1.53703, 1.53703, 1.53703, 1.53703, 1.53703, 1.53703, 1.53703, 1.53703, 1.53703, 1.53703, 1.53703, 1.53703, 1.53703, 1.53703, 1.53703, 1.53703, 1.53703, 1.53703, 1.53703, 1.53703, 1.53703, 1.53549, 1.53549, 1.53549, 1.53549, 1.53549, 1.53242, 1.52936, 1.52782, 1.52322, 1.51862, 1.51402, 1.50941, 1.50635, 1.50174, 1.49714, 1.49407, 1.49101, 1.48947, 1.48640, 1.48487, 1.48334, 1.48027, 1.47567, 1.47260, 1.46646, 1.46033, 1.45112, 1.43885, 1.41891, 1.41277, 1.39897, 1.38823, 1.38056, 1.37442, 1.36829, 1.36368, 1.36215, 1.36062, 1.36062, 1.36062, 1.35755, 1.35448, 1.34988, 1.34528, 1.34221, 1.33454, 1.32840, 1.32073, 1.31306, 1.30693, 1.29926, 1.29159, 1.28238, 1.26704, 1.25477, 1.24250, 1.22869, 1.21335, 1.19955, 1.18267, 1.17040, 1.14892, 1.12745, 1.10751, 1.07683, 1.05228, 1.03081, 1.01086, 0.99246, 0.98018, 0.95717, 0.93416, 0.91576, 0.90042, 0.88508, 0.87280, 0.85900, 0.84519, 0.83292, 0.82065, 0.80684, 0.79150, 0.77923, 0.76696, 0.75469, 0.74395, 0.73321, 0.72094, 0.70560, 0.69486, 0.68412, 0.67032, 0.65804, 0.63964, 0.62583, 0.61202, 0.60282, 0.59668, 0.59362, 0.59055, 0.59055, 0.59208, 0.59208, 0.59208, 0.59055, 0.59055, 0.59208, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59208, 0.59208, 0.59055, 0.59055, 0.59055, 0.59055, 0.59208, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.58901, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59208, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59055, 0.59208, 0.59208, 0.59208, 0.59208, 0.59208, 0.59208, 0.59208, 0.59208, 0.59208, 0.59208, 0.59208, 0.59208, 0.59208, 0.59208, 0.59208, 0.59208, 0.59208, 0.59362, 0.59208, 0.59208, 0.59362, 0.59362, 0.59362, 0.59362, 0.59362, 0.59362, 0.59362, 0.59362, 0.59362, 0.59208, 0.59208, 0.59208, 0.59362, 0.59208, 0.59208, 0.59208, 0.59362, 0.59208, 0.59208, 0.59055, 0.59055, 0.59208, 0.59055, 0.59055, 0.59055];
%    T4=[ 0.34511, 0.34357, 0.34511, 0.34511, 0.34511, 0.34511, 0.34357, 0.34511, 0.34357, 0.34357, 0.34511, 0.34511, 0.34511, 0.34357, 0.34511, 0.34511, 0.34511, 0.34511, 0.34357, 0.34511, 0.34511, 0.34511, 0.34511, 0.34511, 0.34511, 0.34511, 0.34357, 0.34511, 0.34357, 0.34511, 0.34511, 0.34357, 0.34511, 0.34511, 0.34357, 0.34357, 0.34357, 0.34357, 0.34511, 0.34664, 0.35738, 0.36965, 0.37732, 0.38499, 0.38499, 0.38499, 0.38653, 0.38959, 0.39573, 0.41107, 0.42641, 0.43868, 0.45249, 0.46476, 0.47857, 0.48777, 0.50004, 0.51845, 0.52305, 0.53532, 0.54299, 0.54913, 0.55680, 0.56447, 0.57214, 0.57828, 0.58441, 0.59362, 0.60435, 0.61356, 0.62276, 0.62890, 0.63350, 0.63964, 0.64424, 0.65344, 0.66265, 0.67338, 0.68259, 0.69333, 0.70406, 0.71634, 0.72707, 0.73935, 0.75008, 0.75775, 0.76389, 0.77003, 0.77770, 0.78843, 0.79764, 0.80838, 0.81758, 0.82832, 0.83599, 0.84519, 0.85133, 0.85746, 0.86207, 0.86974, 0.87741, 0.88508, 0.89428, 0.90502, 0.91422, 0.92343, 0.93110, 0.93723, 0.94337, 0.95104, 0.95717, 0.96791, 0.97712, 0.98632, 0.99399, 1.00013, 1.00166, 1.00319, 1.00780, 1.01086, 1.01700, 1.02467, 1.03387, 1.04768, 1.06149, 1.07376, 1.08143, 1.08603, 1.09217, 1.09677, 1.10290, 1.10751, 1.11364, 1.11978, 1.12438, 1.12745, 1.13205, 1.13665, 1.13972, 1.14125, 1.14279, 1.14279, 1.14279, 1.14279, 1.14279, 1.14279, 1.14125, 1.14279, 1.14279, 1.14279, 1.14125, 1.13972, 1.13972, 1.13972, 1.13819, 1.13819, 1.13819, 1.13358, 1.13052, 1.12745, 1.12285, 1.11671, 1.11671, 1.11671, 1.11671, 1.11671, 1.11671, 1.11671, 1.11518, 1.11364, 1.11211, 1.10904, 1.10751, 1.10597, 1.10597, 1.10444, 1.10444, 1.10137, 1.09523, 1.08910, 1.07989, 1.07069, 1.06302, 1.05688, 1.05075, 1.04768, 1.04461, 1.04154, 1.04001, 1.03848, 1.03541, 1.03234, 1.02927, 1.02620, 1.02467, 1.02314, 1.01853, 1.01547, 1.01547, 1.01547, 1.01547, 1.01547, 1.01547, 1.01547, 1.01700, 1.01547, 1.01547, 1.01547, 1.01547, 1.01547, 1.01547, 1.01547, 1.01700, 1.01700, 1.01700, 1.01547, 1.01547, 1.01700, 1.01547, 1.01700, 1.01700, 1.01700, 1.01700, 1.01547, 1.01547, 1.01547, 1.01547, 1.01700, 1.01547, 1.01700, 1.01547, 1.01700, 1.01547, 1.01700, 1.01700, 1.01700, 1.01700, 1.01547, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01853, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01700, 1.01853, 1.01853, 1.02007, 1.02007, 1.02007, 1.01853, 1.01853];
%name1='ElbowRoll';
%name2='ElbowYaw';
%name3='ShoulderPitch';
%name4='ShoulderRoll';

%dt=0.001;
%tau=1;

global dcps_oa;

goalRel = zeros(4,1);

goal=0;
init=0;
len=tau/dt;
x=1:size(T,2);
xx=linspace(1,size(T,2),floor(len));
%%xx=linspace(1,size(T,2),size(T,2));

%%
i = 1;
n_rfs=50;
traj=csaps(x,T(i,:)',0.85,xx);
size(traj)
figure(1)
plot(traj)
goalRel(i) = traj(end)-traj(1);
rootMeanSquareError = 1
minpoint=[rootMeanSquareError;n_rfs];
cont=0;
while(cont < threshold)
    Y = learn_dcp_batch_oa(i,dt,goal,tau,n_rfs,init,traj',0,len,names{i});
    error = Y(:,1) - traj(1:1000)';
    squareError = error.^2;
    meanSquareError = mean(squareError);
    rootMeanSquareError = sqrt(meanSquareError);
    if(rootMeanSquareError<minpoint(1))
        minpoint=[rootMeanSquareError;n_rfs];
        cont=0;
    else
        cont=cont+1;
    end
    n_rfs=n_rfs+5
end
minpoint(2)
Y = learn_dcp_batch_oa(i,dt,goal,tau,minpoint(2),init,traj',0,len,names{i});
figure(i);
hold on;
plot(Y(:,1),'r');
xlabel('time')
ylabel('ElbowRoll')
plot(traj,'k')
drawnow




%%
i = 2;
n_rfs=50;
traj=csaps(x,T(i,:)',0.85,xx);
goalRel(i) = traj(end)-traj(1);
rootMeanSquareError = 1;
minpoint=[rootMeanSquareError;n_rfs];
cont=0;
while(cont < threshold)
    Y = learn_dcp_batch_oa(i,dt,goal,tau,n_rfs,init,traj',0,len,names{i});
    error = Y(:,1) - traj(1:1000)';
    squareError = error.^2;
    meanSquareError = mean(squareError);
    rootMeanSquareError = sqrt(meanSquareError);
    if(rootMeanSquareError<minpoint(1))
        minpoint=[rootMeanSquareError;n_rfs];
        cont=0;
    else
        cont=cont+1;
    end
    n_rfs=n_rfs+5
end
minpoint(2)
Y = learn_dcp_batch_oa(i,dt,goal,tau,minpoint(2),init,traj',0,len,names{i});
figure(i);
hold on;
plot(Y(:,1),'r');
xlabel('time')
ylabel('ElbowYaw')
plot(traj,'k')
drawnow



%%
i = 3;
n_rfs=50;
traj=csaps(x,T(i,:)',0.85,xx);
goalRel(i) = traj(end)-traj(1);
rootMeanSquareError = 1;
minpoint=[rootMeanSquareError;n_rfs];
cont=0;
while(cont < threshold)
    Y = learn_dcp_batch_oa(i,dt,goal,tau,n_rfs,init,traj',0,len,names{i});
    error = Y(:,1) - traj(1:1000)';
    squareError = error.^2;
    meanSquareError = mean(squareError);
    rootMeanSquareError = sqrt(meanSquareError);
    if(rootMeanSquareError<minpoint(1))
        minpoint=[rootMeanSquareError;n_rfs];
        cont=0;
    else
        cont=cont+1;
    end
    n_rfs=n_rfs+5
end
minpoint(2)
Y = learn_dcp_batch_oa(i,dt,goal,tau,minpoint(2),init,traj',0,len,names{i});
figure(i);
hold on;
plot(Y(:,1),'r');
xlabel('time')
ylabel('ShoulderPitch')
plot(traj,'k')
drawnow




%%
i = 4;
n_rfs=50;
traj=csaps(x,T(i,:)',0.85,xx);
goalRel(i) = traj(end)-traj(1);
rootMeanSquareError = 1;
minpoint=[rootMeanSquareError;n_rfs];
cont=0;
while(cont < threshold)
    Y = learn_dcp_batch_oa(i,dt,goal,tau,n_rfs,init,traj',0,len,names{i});
    error = Y(:,1) - traj(1:1000)';
    squareError = error.^2;
    meanSquareError = mean(squareError);
    rootMeanSquareError = sqrt(meanSquareError);
    if(rootMeanSquareError<minpoint(1))
        minpoint=[rootMeanSquareError;n_rfs];
        cont=0;
    else
        cont=cont+1;
    end
    n_rfs=n_rfs+5   
end
minpoint(2)
Y = learn_dcp_batch_oa(i,dt,goal,tau,minpoint(2),init,traj',0,len,names{i});
figure(i);
hold on;
plot(Y(:,1),'r');
xlabel('time')
ylabel('ShoulderRoll')
plot(traj,'k')
drawnow

dcps = dcps_oa;
end
%%


% traj=csaps(x,T2',0.9,1:301);
% % traj(1:3)=T2(1);
% % traj(4:301)=T2;
% learn_dcp_batch_oa(2,dt,goal,tau,n_rfs,init,traj',0,len,name2);
% traj=csaps(x,T3',0.9,1:301);
% % traj(1:3)=T3(1);
% % traj(4:301)=T3;
% learn_dcp_batch_oa(3,dt,goal,tau,n_rfs,init,traj',0,len,name3);
% traj=csaps(x,T4',0.9,1:301);
% % traj(1:3)=T4(1);
% % traj(4:301)=T4;
% learn_dcp_batch_oa(4,dt,goal,tau,n_rfs,init,traj',0,len,name4);

% %nao esegue primitiva
% global MOTION
% MOTION.setStiffnesses('Body',1);
% timeLists=linspace(1,10,501);
% for i = 1:length(T1)
%     
%     trajNao = num2cell([T1(1,i),T2(1,i),T3(1,i),T4(1,i)]);
%     MOTION.angleInterpolationWithSpeed(NAMES,trajNao, 0.4);
% end