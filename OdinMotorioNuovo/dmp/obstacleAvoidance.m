function obstacleAvoidance
%obstacle avoidance with the coupling term formulation
%As described in "Learning coupling terms for obstacle avoidance "

% sample 3D trajectory generated in simulation
load traj1.mat

traj3d=traj;

close all
% Dimensions of the problem
ND=3;

% Initializing canonical and transformation system coupling terms
cc=zeros(ND,1);
ct=zeros(ND,1);

% general parameters for DMPs
dt        = 0.001;
tau       = 1;
n_rfs     = [15 15 15];
n=1;
len=1*n*tau/dt;

%Trajectory generated by DMP is going to be stored in Y temporarily and
%finally Y contains the obstacle avoidance trajectories
Y=zeros(floor(len+1),3);

xx=linspace(1,length(traj3d),floor(len+1)+ 3);

x=1:length(traj3d);

% All three original dimensions of the trajectory are in T
T=zeros(floor(len+1),1);

% Parameters for the coupling term - just implementing the first feature 
% Ct = gamma*R*v*theta*exp(-beta*theta)*exp(-kd)
gam=1000;
be=10/pi;
ko=3;
% Second coupling term avoiding nearest point
k_r=4;
be_r=10/pi;

%per plottare
time = (0:1:len)';

% Fitting a DMP to each dimension
for i=1:ND
    traj=csaps(x,traj3d(:,i),0.9,xx);
    Y=learn_dcp_batch_oa(i,dt,0,tau,n_rfs(i),0,traj,0,len);
    T(:,i)=Y(:,1);
    
   
    %%%%%%%%%%%%%%per plottare
    traj=traj(1:1001)';
    figure;
    clf;
    plot(time,Y(:,1),'b -o',time,traj,'r');
    title('y');
    aa=axis;
    axis([min(time) max(time) aa(3:4)]);
    %%%%%%%%%%%%%%%%%%%%%%
 
    dcp('reset_state',i, traj(1));
    dcp('set_goal',i,traj(floor(len+1)),1);
    goal(i)=T(floor(len+1),i);
end

ct=zeros(ND,1);
x1=[];
x2=[];
The=[];
Ct=[];
Op=[];

% Obstacle position and size
obs= [1.9 1.55 1.75];
r=[.15 .15 .15];

% Making obstacle avoidance trajectory longer for converging better to goal
len1=1.5*len;
y=0;
the=0;
ct_r=0;

for i=0:len1,
   obs_old=obs;
   v_obs=(obs-obs_old)./dt;%[0 0 0];
   [sx sy sz]=ellipsoid(obs(1),obs(2),obs(3), r(1), r(2), r(3), 50);
   for ID=1:ND
      [y(ID),yd(ID),ydd(ID)]=dcp('run',ID,tau,dt,ct(ID),cc(ID));%*(1+k_r/abs(op_r(ID)))
      Y(i+1,:,ID)   = [y(ID) yd(ID) ydd(ID)];
   end

   % angle to the center and nearest point on the surface
   the_p=atan2((-y(2)+obs(2)),(-y(1)+obs(1)));
   phi_p=acos((y(3)-obs(3))/(norm(y-obs)));
   
   % Assuming a ellipsoidal object - finding the point on the surface
   r_p=r(1)*r(2)*r(3)/sqrt((r(2)*r(3)*cos(the_p)*sin(phi_p))^2+(r(1)*r(3)*sin(the_p)*sin(phi_p))^2+(r(1)*r(2)*cos(phi_p))^2);
   
   op=obs-[(r_p*cos(the_p)*sin(phi_p)) (r_p*sin(the_p)*sin(phi_p)) (-r_p*cos(phi_p))];
   % Finding the maximum distance
   [m, ind]=max(op);
   r_max=r(ind);
   
   op_r=norm(op-y);    
   yd=yd-v_obs;
   
   % checking that we are not stationary or at the obstacle center - to
   % keep acos values real
   if(norm(obs-y)*norm(yd)~=0 && (sum((obs-y).*yd)/(norm(obs-y)*norm(yd)))>=-1 && (sum((obs-y).*yd)/(norm(obs-y)*norm(yd)))<=1)
          the=acos(sum((obs-y).*yd)/(norm(obs-y)*norm(yd)));
          ct_r=exp(be_r*cos(the));
   end
   % coupling term is R*yd*ct_r where R is a rotation matrix about rot_a
   rot_a=cross((obs-y),yd);
   Rot_mat=vrrotvec2mat([rot_a pi/2]);
   % Adding the two coupling terms together
   ct=Rot_mat*yd'*(gam*the*exp(-1*be*the)*exp(-ko*norm(obs-y))+gam*k_r*the*exp(-1*be*the)*(exp(-0.5*norm(op_r)/r_max)));


end

figure,plot3(Y(:,1,1),Y(:,1,2),Y(:,1,3), 'color','r','marker','.');
hold on

plot3(T(1:floor(len+1),1),T(1:floor(len+1),2),T(1:floor(len+1),3),'color','b','marker','.')
plot3(goal(1),goal(2),goal(3),'*g');

surf(sx,sy,sz, ones(size(sx)))
legend('changed traj', 'original', 'goal','nearest points','obstacle')
