function  [ct] = obstacle_avoidance_Idra(angoli_finali)
%obstacle avoidance : formulazione con coupling term
%Come descritto nel paper "Learning coupling terms for obstacle avoidance "


% Dimensioni del problema
ND=3;

% Inizializzo sistema canonico e di trasformazione con i coupling terms
cc=zeros(ND,1);
ct=zeros(ND,1);

% parametri generali delle DMPs
dt        = 0.001;
tau       = 1;
n_rfs     = [15 15 15];
n=1;
len=1*n*tau/dt;

newTraj= zeros(300,3);
%%%%%%%%%%%%%%%%

%prendo gli angoli di input e li separo per dimensione
for i=1:300
    
   angoli=num2cell([angoli_finali(1,i), angoli_finali(2,i),angoli_finali(3,i), angoli_finali(4,i)]);
   newTraj(i,2)=angoli{1};
   newTraj(i,3)=angoli{2};
   newTraj(i,1)=angoli{4};
 
end

%setto massimi e minimi per ogni giunto del braccio che entra in gioco nel
%movimento
minshoulderroll = -0.3142;
maxshoulderroll = 1.3265;
minshoulderpitch = -2.0857;
maxshoulderpitch = 2.0857;
minelbowroll =  -1.5446;
maxelbowroll =  -0.0349;
% newTraj(:,1)=lshoulderroll;
% newTraj(:,2)=lelbowroll;
% newTraj(:,3)=lshoulderpitch;


%%%%%%%%%%%%%%

%Traiettoria generata da DMP viene salvata in Y temporaneamente e
%alla fine Y conterrà la traiettoria che evita l'ostacolo
Y=zeros(floor(len+1),3);

% xx=linspace(1,length(traj3d),floor(len+1)+ 3);
% x=1:length(traj3d);

 xx=linspace(1,300,floor(len+1)+ 3);
 x=1:300;

% Le dimensioni originali della traiettoria sono in T
T=zeros(floor(len+1),1);

% Parametri per il primo coupling term - viene implementato in questo modo: 
% Ct = gamma*R*v*theta*exp(-beta*theta)*exp(-kd)
gam=1000;
be=10/pi;
ko=3;
% Il secondo coupling term evita il punto vicino (verrà sommato al primo)
k_r=4;
be_r=10/pi;


% Fit di una DMP per ogni dimensione
for i=1:ND
   
    %traj=csaps(x,traj3d(:,i),0.9,xx);
    traj=csaps(x,newTraj(:,i),0.9,xx);
    Y=learn_dcp_batch_oa(i,dt,0,tau,n_rfs(i),0,traj,0,len);

    T(:,i)=Y(:,1);
    dcp_oa('reset_state',i, traj(1));

    dcp_oa('set_goal',i,traj(floor(len+1)),1);

    goal(i)=T(floor(len+1),i);
end


ct=zeros(ND,1);
x1=[];
x2=[];
The=[];
Ct=[];
Op=[];

% Posizione dell'ostacolo(in giunti) e dimensioni
obs = [-0.19 -0.035 0.27];
r=[.15 .15 .15];

% Allungo la traiettoria che evita l'ostacolo per convergere meglio al goal
len1=1.5*len;
y=0;
the=0;
ct_r=0;

for i=0:len1,
   obs_old=obs;
   v_obs=(obs-obs_old)./dt;%[0 0 0];
   [sx sy sz]=ellipsoid(obs(1),obs(2),obs(3), r(1), r(2), r(3), 50);
   for ID=1:ND
      [y(ID),yd(ID),ydd(ID)]=dcp_oa('run',ID,tau,dt,ct(ID),cc(ID));%*(1+k_r/abs(op_r(ID)))
      if ID==1 
         if y(ID)>maxshoulderroll
             y(ID)=maxshoulderroll;
         end
         
         if y(ID)<minshoulderroll
             y(ID)=minshoulderroll;
         end
         
      end
      
      if ID==2 
         if y(ID)>maxelbowroll
             y(ID)=maxelbowroll;
         end
         
         if y(ID)<minelbowroll
             y(ID)=minelbowroll;
         end
         
      end
      
      if ID==3
         if y(ID)>maxshoulderpitch 
             y(ID)=maxshoulderpitch;
         end
         
         if y(ID)<minshoulderpitch 
             y(ID)=minshoulderpitch;
         end
         
      end
      
      
      
      Y(i+1,:,ID)   = [y(ID) yd(ID) ydd(ID)];
   end

   % angolo al centro e al più vicino punto della superficie
   the_p=atan2((-y(2)+obs(2)),(-y(1)+obs(1)));
   phi_p=acos((y(3)-obs(3))/(norm(y-obs)));
  
   % Tengo conto dell'oggetto ellissoidale costruito attorno al vero
   % oggetto (convex hull) - trovo il punto sulla superficie
   r_p=r(1)*r(2)*r(3)/sqrt((r(2)*r(3)*cos(the_p)*sin(phi_p))^2+(r(1)*r(3)*sin(the_p)*sin(phi_p))^2+(r(1)*r(2)*cos(phi_p))^2);
   
   op=obs-[(r_p*cos(the_p)*sin(phi_p)) (r_p*sin(the_p)*sin(phi_p)) (-r_p*cos(phi_p))];
   % Trovo la massima distanza
   [m, ind]=max(op);
   r_max=r(ind);
   
   op_r=norm(op-y);    
   yd=yd-v_obs;
   
   % controllo per vedere se per caso sono al centro dell'oggetto - per
   % avere valori reali
   if(norm(obs-y)*norm(yd)~=0 && (sum((obs-y).*yd)/(norm(obs-y)*norm(yd)))>=-1 && (sum((obs-y).*yd)/(norm(obs-y)*norm(yd)))<=1)
          the=acos(sum((obs-y).*yd)/(norm(obs-y)*norm(yd)));
          ct_r=exp(be_r*cos(the));
   end
   % il coupling term è R*yd*ct_r dove R è una rotazione matrice in funzione di rot_a
   rot_a=cross((obs-y),yd);
   Rot_mat=vrrotvec2mat([rot_a pi/2]);
   % Sommo i due coupling term
   ct=Rot_mat*yd'*(gam*the*exp(-1*be*the)*exp(-ko*norm(obs-y))+gam*k_r*the*exp(-1*be*the)*(exp(-0.5*norm(op_r)/r_max)));


end


%grafici
figure,plot3(Y(:,1,1),Y(:,1,2),Y(:,1,3), 'color','r','marker','.');

plot3(T(1:floor(len+1),1),T(1:floor(len+1),2),T(1:floor(len+1),3),'color','b','marker','.');
plot3(goal(1),goal(2),goal(3),'*g');
xlabel('X - Shoulder Roll');
ylabel('Y - Elbow Roll');
zlabel('Z - Shoulder Pitch');
surf(sx,sy,sz, ones(size(sx)))
alpha(0.5)
legend('changed traj', 'original', 'goal','nearest points','obstacle')
drawnow;
hold on
