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


%   Posizioni limite per il NAO
massimoNao=[-0.0349 2 2.08 1.32];
minimoNao=[-1.54 -2 -2.08 -0.31];

%   Mi collego al NAO
%IP='169.254.95.24';
IP='10.79.5.60';
PORT=9559;
%PORT=54011;
MOTION=ALMotionProxy(IP, PORT);
PICTURE=ALVideoDeviceProxy(IP,PORT);

% Altre inizializzazioni
NUM_PRIMITIVE=9;
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
%   Non la uso in questa implementazione
DURATA = 3; %imposto durata di ogni dmp 3s standard.
%   Matrice covarianza delle basis function dell'attore
SIGMA_ACTOR=diag(ones(1,NUM_CLUSTER));


%   Dati per fare grafici dei test
MEAN_POLICIES=zeros(NUM_PRIMITIVE,1);
G_EVO =0;
COMPLETATO =0;

%   Calcolo i centri, le varianze e il numero di basis function per la
%   value function dell'algoritmo che apprende i metaparametri. Le
%   gaussiane vengono poste su una griglia nello spazio dei metaparametri.
[MU_METAP,SIGMA_METAP,NUM_BASIS_METAP]=basis_metap(minimoNao,massimoNao);

%   Inizializzo il vettore parametri della value function che valuta i
%   metaparametri e alloco lo spazio per la matrice dei metaparametri.
teta_metap=zeros(NUM_BASIS_METAP,NUM_PRIMITIVE);
meta_param=zeros(DOF,NUM_PRIMITIVE);

%   Inizializzo i metaparametri con i goal
for i=1:NUM_PRIMITIVE
    meta_param(:,i)=get_goal((1:DOF)+4*(i-1))';
    
end
GOAL_INIT=meta_param;


%    Inizializzo altri matrici utili
dmp_attive=zeros(NUM_PRIMITIVE,1);
nuove_dmp_attive=zeros(NUM_PRIMITIVE,1);
temp=zeros(NUM_PRIMITIVE,1);

%   Inizializzo matrici di parametri per le policy pi_pesi, per le funzioni
%   Q stato-azione delle policy e matrice delle eligilibity traces.
w = ones(NUM_PRIMITIVE);
t = zeros(NUM_PRIMITIVE);
z = zeros(NUM_PRIMITIVE);


