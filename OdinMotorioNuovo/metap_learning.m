function [ t,a_f ] = metap_learning( s,c,r,t )
%METAP_LEARNING Algoritmo di RL per ottimizzare i metaparametri di una dpm.
%   Ogni chiamata a questa funzione corrisponde ad una iterazione
%   dell'algoritmo. Esso valuta una funzione V(stato)->Reward dove lo stato
%   corrisponde ai metaparametri di una dpm. Inoltre calcola tramite
%   gradient ascent la configurazione di metaparametri successiva (le
%   azioni). Il calcolo viene effettuato tenendo in considerazione anche i
%   metaparametri iniziale delle dpm, in via sempre minore a meno che si
%   attivi una nuova dmp.

%   Variabili:
%   s: stato attuale, ovvero metaparametri delle dmp. vettore colonna.
%   s_i: stato iniziale, ovvero metaparametri di default delle dpm quando
%   si esegue la prima iterazione oppure ogni volta che si attiva una nuova
%   dmp la media pesata, secondo il peso delle dmp, dei metaparametri dove
%   i metaparametri della nuova dmp attivata sono quelli di default mentre
%   per le altre dpm sono quelli dell'iterazione precedente.
%   In tutti gli altri casi corrisponde all'azione calcolata al passo 
%   precedente.
%   c: parametro di esplorazione. Maggiore è c, meno terrò conto del
%   gradiente per calcolare la nuova azione.
%   r: reward immediato.
%   v: state value function per lo stato corrente.
%   t: vettore colonna dei parametri della funzione v.
%   b: vettore colonna delle basis function della funzione v.
%   n: learning rate. Deve essere molto maggiore di quello della policy
%   Nac.
%   g:  discount rate
%   a_f: azione ottimizzata nell'iterazione


global NUM_BASIS_METAP
global MU_METAP
global SIGMA_METAP
global DOF
global R_ANG
global R_CAR
global check

%   Inizializzazioni

% %   Le inizializzo nel chiamante
% %   Estremi dell'intervallo dei parametri, ad esempio per il goal di 2 DoF.
% a=[0 0];
% b=[90 90];

s_i=s;
g=0; %  Non faccio bootstrapping, massimizzo il reward immediato perchè
%   ipotizziamo che i metaparametri al tempo t abbiano poca influenza sui
%   metaparametri al tempo t+1 dopo cioè un'altra combinazione di dmp prima
%   della fine dell'episodio. I metaparametri influiscono molto sulla
%   scelta delle dmp ma ciò viene risolto all'interno di una sola
%   iterazione dell'algoritmo con la scelta appropiata della azione
%   successiva e un learning rate n molto maggiore di quello del Nac.


%   Aggiorno la funzione v aggiornando i suo parametri
%   Update generale con g!=0
%   t = t + n*(r*ones(size(t),1) + g*(t'*basis_metap(s_2,a,b)/
%   sum(basis_metap(s_2,a,b))) - t).*(basis_m./sum(basis_m));
%   Update con g=0
%   Calcolo il valore delle basis function
basis_m=zeros(NUM_BASIS_METAP,1);
for k=1:NUM_BASIS_METAP
    basis_m(k,1) = mvnpdf(s',MU_METAP(k,:),SIGMA_METAP);
end

%   Aggiorno i parametri della funzione v
%   sto facendo gradient descent ora
delta=r*ones(size(t,1),1) - t;
t = t + 0.8*(delta).*(basis_m./sum(basis_m));

%   Calcolo il gradiente della funzione v nello stato corrente
gradV=zeros(DOF,1);
termine1=zeros(DOF,1);
termine2=zeros(DOF,1);
termine3=zeros(DOF,1);
for k=3:DOF
    for i=1:NUM_BASIS_METAP
        termine1(k,1)=termine1(k,1)+basis_m(i,1)*2*(s(k)-MU_METAP(i,1));
    end
end


for i=3:DOF
    for k=1:NUM_BASIS_METAP
        gradV(i,1)=gradV(i,1)+t(k,1)*basis_m(k,1)*2*(s(i)-MU_METAP(i,1))*sum(basis_m)-basis_m(k,1)*termine1(i,1);
        gradV(i,1)=gradV(i,1)/(sum(basis_m)^2);
    end
end

% if(check>10)
% %   Calcolo i nuovi metaparametri
% %a_f = (1/(1+c))*(-1*0.8*gradV+c*s_i);
%     a_f = -check*0.1*gradV+s_i;
% else
%     a_f=s_i;
% end


end

