%   variabili:
%   x: vettore colonna (dimensione=#cluster)
%   x_dmp: vettore colonna (dimensione=NUM_PRIMITIVE)
%   pi_f: vettore colonna (dimensione=DOF)
%   teta_metap: matrice dove ogni colonna rappresenta i
%   parametri delle basis functions per approssimare la value function
%   v(metaparametri). Numero di righe =NUM_BASIS_FUNCTION, colonne =
%   NUM_PRIMITIVE.
%   meta_param: matrice dove ogni colonna rappresenta i metaparametri della
%   dmp, in questo caso immagino siano i goal di ogni DOF.
%   Numero di righe =DOF, colonne=NUM_PRIMITIVE.
%   pi_pesi: vettore colonna (dimensione=NUM_PRIMITIVE) dei pesi delle
%   primitive per l'azione corrente.

global MOTION
global PICTURE
global NAMES
global DURATA
global NUM_PRIMITIVE
global DOF
global NUM_BASIS_METAP
global MU_METAP
global SIGMA_METAP
global MU_ACTOR
global SIGMA_ACTOR
global POS_EFF
global POS_EFF_REWARD
global GOAL_INIT
global MEAN_POLICIES
global R_ANG
global R_CAR
global G_EVO
global COMPLETATO
global check
global pos_arrivo
global ax
global dcps

%   Inizializzazioni  IDRA
% data = zeros(0);
% categories = zeros(0);
% %save('IDRA_Matlab/data/categories.mat','categories');
% %save('IDRA_Matlab/data/data.mat','data');
% output=zeros(10,1);
% 
% %   Addestro IDRA
% while any(output==0) || isempty(output)
%     % Faccio questo perchè ho salvato i dati in 2 dataset
%     n=randi(29,1);
%     if(n<=9)
%         img = double(im_f(n).sig/255);
%     else
%         img = double(img_rand(n-9).sig/255);
%     end
%     signals(1).sig = img;
%     signals(1).filterName = 'LogPolarBW';
%     signals(1).instinct = 'None';
%     signals(2).sig = img;
%     signals(2).filterName = 'None';
%     signals(2).instinct = 'ballPosition';
%     n=randi(100,1);
%     signals(3).sig = stato(n,:);
%     signals(3).filterName = 'None';
%     signals(3).instinct = 'None';
%     [output, rs] = intentionalArchitecture(signals);
%     output;
% end

%   Posizioni limite per il NAO
%massimoNao =[-0.0106  ;  0.3168  ;  0.0761 ;  -2.0953  ;  0.1819  ;  1.7108];
%minimoNao =[-0.1511  ;  0.1219  ;  0.1539  ;  1.0522  ;  0.2779 ;   2.6427];

% massimoNao=[-0.0349 2 2.08 1.32];
% minimoNao=[-1.54 -2 -2.08 -0.31];
%   Mi collego al NAO
%IP='169.254.95.24';
IP='10.79.5.170';
PORT=9559;
MOTION=ALMotionProxy(IP, PORT);
PICTURE=ALVideoDeviceProxy(IP,PORT);
MOTION.setStiffnesses('Body',1);

% Altre inizializzazioni
NUM_PRIMITIVE=4;
%   d_t per le DMP
delta_t=0.001;
%   DOF del robot
name1='LElbowRoll';
name2='LElbowYaw';
name3='LShoulderPitch';
name4='LShoulderRoll';
NAMES_ARRAY=[name1, name2, name3, name4];
NAMES={name1, name2, name3, name4};
DOF=4;
%   Numero cluster di IDRA, dimensione dello stato
%NUM_CLUSTER=10;
%   Non la uso in questa implementazione
DURATA = 3; %imposto durata di ogni dmp 3s standard.
%   Matrice covarianza delle basis function dell'attore
SIGMA_ACTOR=diag(ones(1,6));
MU_ACTOR = [-2,-1,0,1,2,3;-2,-1,0,1,2,3;-2,-1,0,1,2,3;-2,-1,0,1,2,3];
%  Inizializzo i centri delle basis functions
%im_f 20 immagini della pallina sul tavolo in posizioni diverse
% for i=1:NUM_PRIMITIVE
%     img = double(im_f(i).sig/255);
%     signals(1).sig = img;
%     signals(1).filterName = 'LogPolarBW';
%     signals(1).instinct = 'None';
%     signals(2).sig = img;
%     signals(2).filterName = 'None';
%     signals(2).instinct = 'ballPosition';
%     n=randi(100,1);
%     signals(3).sig = stato(n,:);
%     signals(3).filterName = 'None';
%     signals(3).instinct = 'None';
%     [MU_ACTOR(i,:), rs] = intentionalArchitecture(signals);
% end

%   Non implementata in questa versione
%soglia=0;

%   Dati per fare grafici dei test
MEAN_POLICIES=zeros(NUM_PRIMITIVE,1);
G_EVO =0;
COMPLETATO =0;

%   Calcolo i centri, le varianze e il numero di basis function per la
%   value function dell'algoritmo che apprende i metaparametri. Le
%   gaussiane vengono poste su una griglia nello spazio dei metaparametri.
%[MU_METAP,SIGMA_METAP,NUM_BASIS_METAP]=basis_metap(minimoNao,massimoNao);

%   Inizializzo il vettore parametri della value function che valuta i
%   metaparametri e alloco lo spazio per la matrice dei metaparametri.
teta_metap=zeros(NUM_BASIS_METAP,NUM_PRIMITIVE);
meta_param=zeros(DOF,NUM_PRIMITIVE);

%   Inizializzo i metaparametri con i goal
% for i=1:NUM_PRIMITIVE
%     meta_param(:,i)=get_goal((1:DOF)+3*(i-1))';
% end
% GOAL_INIT=meta_param;

%    Inizializzo altri matrici utili
%dmp_attive=zeros(NUM_PRIMITIVE,1);
%nuove_dmp_attive=zeros(NUM_PRIMITIVE,1);
%temp=zeros(NUM_PRIMITIVE,1);

%   Inizializzo matrici di parametri per le policy pi_pesi, per le funzioni
%   Q stato-azione delle policy e matrice delle eligilibity traces.
w = ones(NUM_PRIMITIVE);
t = zeros(NUM_PRIMITIVE);
z = zeros(NUM_PRIMITIVE);

%   Chiama Idra che analizza l'input visivo del nao. Restituisce la
%   distanza dell'input corrente dai centri dei cluster presenti in IDRA.
% index=randi(29,1);
% if(index<=9)
%     POS_EFF = reward(index).sig;
% else
%     POS_EFF = reward_20(index-9).sig;
% end
% POS_EFF_REWARD=POS_EFF;
% POS_EFF=POS_EFF(1:3);
% if(index<=9)
%     img = double(im_f(index).sig/255);
% else
%     img = double(img_rand(index-9).sig/255);
% end
% signals(1).sig = img;
% signals(1).filterName = 'LogPolarBW';
% signals(1).instinct = 'None';
% signals(2).sig = img;
% signals(2).filterName = 'None';
% signals(2).instinct = 'ballPosition';
% n=randi(100,1);
% signals(3).sig = stato(n,:);
% signals(3).filterName = 'None';
% signals(3).instinct = 'None';
% [output, rs] = intentionalArchitecture(signals);
% x=output;


%   Sceglie i pesi delle primitive della prima azione. I pesi ammissibili
%   sono compresi nell'intervallo [0,1].
%   Inizialmente viene eseguita solo una primitiva, quella più consona allo
%   stato x osservato.
%pi_pesi=zeros(NUM_PRIMITIVE,1);
% dist=zeros(NUM_PRIMITIVE,1);
% for i=1:NUM_PRIMITIVE
%     dist(i,1)=(sum((x'-MU_ACTOR(i,:)).^2)).^(1/2);
% end
% [elemento,posizione]=min(dist);


POS_EFF_REWARD = [0.0;0.20;0.10;0;0;0]; 
pi_pesi=randfixedsum(4,1,1,0,1);
ax=1;

x = cell2mat(MOTION.getPosition('LArm', int8(0), false));


%   Inizia l'apprendimento fino a convergenza
check=0;
while check<200
    %   Per farlo vedere sulla console
    ITERAZIONE_NUMERO=check
    % Eseguo un task episodico, anche l'algoritmo è modificato per questo
    % tipo di task sebbene possa essere usato anche per task non episodici
    z = zeros(NUM_PRIMITIVE);
    
    %-------------------------------------------------------------------------
    %   Calcolo quali dmp sono attive e quali si sono attivate ora
    %     for i=1:NUM_PRIMITIVE
    %         if(pi_pesi(i)>soglia)
    %             temp(i)=1;
    %             if(dmp_attive(i)==1)
    %                 nuove_dmp_attive(i)=0;
    %             else nuove_dmp_attive(i)=1;
    %             end
    %         else
    %             temp(i)=0;
    %             nuove_dmp_attive(i)=0;
    %         end
    %     end
    %     dmp_attive=temp;
    
    %   Calcolo i metaparametri nel caso di nuove dmp attive
    %     if(sum(nuove_dmp_attive)>0)
    %         for i=1:NUM_PRIMITIVE
    %             if(nuove_dmp_attive(i)>0)
    %                 meta_param(:,i)=GOAL_INIT(:,i);
    %             end
    %         end
    %     end
    
    
    %-------------------------------------------------------------------------
    %   Calcolo la combinazione di primitive.
    %500 sono le posizioni nel tempo che il Nao interpola per muoversi.
    pi_f=zeros(6,500);
    disp('somma pesi:');
     sum(pi_pesi(1:NUM_PRIMITIVE))
    %MODIFICARE IL DATASET
    %le prime 7 primitive sono di allungamento
    for i=1:NUM_PRIMITIVE
        %if(pi_pesi(i)>soglia)
            %   Ogni primitiva ha 4 DOF con un ID [i i+1 i+2 i+3]
            prim=pi_base((1:6)+6*(i-1),delta_t);
            
           
            pi_f = pi_f + (pi_pesi(i)*prim)/sum(pi_pesi(1:NUM_PRIMITIVE));
%              hold on
%              figure(ITERAZIONE_NUMERO+1)
%              plot3(pi_pesi(i)*prim(1,:)/sum(pi_pesi(1:NUM_PRIMITIVE)),pi_pesi(i)*prim(2,:)/sum(pi_pesi(1:NUM_PRIMITIVE)),pi_pesi(i)*prim(3,:)/sum(pi_pesi(1:NUM_PRIMITIVE)),'-');
%              axis equal
        %end
    end
        
%    % le rimanenti 2 di rotazione
%     for i=8:NUM_PRIMITIVE
%         %if(pi_pesi(i)>soglia)
%             primYaw=pi_base((1:6)+6*(i-1),delta_t);
%             % Se Coreographe registrasse i movimenti relativi...
%             primYaw([1,3,4],:)=0;
%             primYaw
%             pi_f = pi_f + (pi_pesi(i)*primYaw)/sum(pi_pesi(8:NUM_PRIMITIVE));
%         %end
%     end

    
    
 
    
    %-------------------------------------------------------------------------
    %   Eseguo l'azione, Interfacciarsi con Nao
%     for i=1:4
%         pi_f(i,find(pi_f(i,:)>massimoNao(i)))=massimoNao(i);
%         pi_f(i,find(pi_f(i,:)<minimoNao(i)))=minimoNao(i);
%     end
    %ct=obstacle_avoidance_Idra(pi_f);
    
    esegui_nao(pi_f);
    
    
    %-------------------------------------------------------------------------
    %   Ricevo/Calcolo il reward
    r=Calcola_reward();
    
    
    %-------------------------------------------------------------------------
    %   Stato di arrivo IDRA
    r1=randi(100,1);
    %MOTION.setPosition('LArm',int8(0),pos_iniziali(:,r1)',0.7,int8(63))
    MOTION.setAngles(NAMES, stato(r1,:),0.5);
    pause(3)
%     if(index<=9)
%         img = double(im_f(index).sig/255);
%     else
%         img = double(img_rand(index-9).sig/255);
%     end
%     signals(1).sig = img;
%     signals(1).filterName = 'LogPolarBW';
%     signals(1).instinct = 'None';
%     signals(2).sig = img;
%     signals(2).filterName = 'None';
%     signals(2).instinct = 'ballPosition';
%     signals(3).sig = stato(r1,:);
%     signals(3).filterName = 'None';
%     signals(3).instinct = 'None';
%     [output, rs] = intentionalArchitecture(signals);
%     y=output;
   y = cell2mat(MOTION.getPosition('LArm', int8(0), false));
    
    %-------------------------------------------------------------------------
    %   Esegue una iterazione dell'algoritmo di apprendimento dei
    %   metaparametri.
    %     c=0.1*check;
    %     for i=1:NUM_PRIMITIVE
    %         if(pi_pesi(i)>soglia)
    %             if (i==8 || i==9)
    %                 %[teta_metap(:,i),meta_param(:,i)]=metap_learning(meta_param(:,i),c,R_ANG,teta_metap(:,i));
    %             else
    %                 if (i==3)
    %                     [teta_metap(:,i),meta_param(:,i)]=metap_learning(meta_param(:,i),c,R_CAR,teta_metap(:,i));
    %                 end
    %             end
    %             set_goal((1:DOF)+4*(i-1),meta_param(:,i));
    %         end
    %     end
    
    
    %-------------------------------------------------------------------------
    %   Esegue una iterazione dell'algoritmo di combinazione di primitive.
    [w,t,pi_pesi,z]=modulo_gangli(x,y,r,w,t,pi_pesi,z);
      
    
    %-------------------------------------------------------------------------
%     % Prendo i dati per i grafici
%     if(check==0)
%         x_evo=x;
%         r_evo=r;
%         w_evo=zeros(size(w,1),size(w,2));
%         t_evo=zeros(size(t,1),size(t,2));
%         pi_pesi_evo=pi_pesi;
%         z_evo=zeros(size(z,1),size(z,2));
%         teta_metap_evo=teta_metap;
%         meta_param_evo=meta_param;
%         r_ang_evo=R_ANG;
%         r_car_evo=R_CAR;
%         g_evo= G_EVO;
%         pos_arrivo_evo=pos_arrivo;
%     else
%         x_evo= [x_evo x];
%         r_evo= [r_evo r];
%         w_evo=[w_evo w];
%         t_evo= [t_evo t];
%         pi_pesi_evo= [pi_pesi_evo pi_pesi];
%         z_evo= [z_evo z];
%         teta_metap_evo=[teta_metap_evo teta_metap];
%         meta_param_evo=[meta_param_evo meta_param];
%         r_ang_evo=[r_ang_evo R_ANG];
%         r_car_evo=[r_car_evo R_CAR];
%         g_evo=[g_evo G_EVO];
%         pos_arrivo_evo= [pos_arrivo_evo pos_arrivo] ;
%     end
    
    %------------------------------------------------------------------------
    %   Aggiorno lo stato corrente
    x=y;
    check=check+1;
end

%COMPLETATO = COMPLETATO(2:size(COMPLETATO,2));
%-------------------------------------------------------------------------
% Salvo i dati per i grafici
%save('dati_test_IDRA.mat','x_evo','r_evo','w_evo','t_evo','pi_pesi_evo','z_evo','MEAN_POLICIES','teta_metap_evo', 'meta_param_evo','r_ang_evo','r_car_evo','g_evo','COMPLETATO','index','pos_arrivo_evo');



