function [ w,t,pi_pesi,z ] = modulo_gangli( x,y,r,w,t,pi_pesi,z )
%MODULO_GANGLI Modulo che rappresenta i gangli alla base.
%   Dato uno stato x apprende per rinforzo l'azione migliore da compiere.
%   L'azione è una combinazione di primitive motorie e l'algoritmo si
%   occupa di imparare i pesi delle primitive che rappresentano la gating
%   network di una "mixture" di esperti (le primitive).
%   L'algoritmo di RL è Natural actor-critic con Sarsa(1) modificato per
%   questo modello del sistema.

%   Variabili
%   x: vettore distanza dai cluster. Immagino che sia colonna, dipende
%   dall'architettura Odin-Idra
%   pi_f: vettore di dimensioni DoFx3 della policy finale a seguito della
%   combinazione delle primitive motorie.
%   pi_pesi: vettore colonna dei pesi corrispondenti alle primitive. I pesi
%   appartengono a [0,1] e sono le azioni delle policy apprese con Nac.
%   pi_base: matrice DoFx3 dove ogni elemento è un vettore della
%   evoluzione nel tempo della grandezza posizione, velocità o
%   accelerazione dei giunti.
%   r: reward immediato.
%   w: vettore nxm dei parametri delle policy pi_pesi. n ed m sono
%   NUM_PRIMITIVE.
%   t: matrice nxm dei parametri della Action-Value function corrispondenti
%   alla pi_pesi. n ed m sono NUM_PRIMITIVE.
%   z: matrice nxm delle eligibility traces. n ed m sono NUM_PRIMITIVE.
%   y: vettore distanza dai cluster corrispondente allo stato dopo
%   l'esecuzione dell'azione.

global NUM_PRIMITIVE
global MEAN_POLICIES
global R_ANG
global R_CAR
% Dati per i plot
mean_policies=zeros(NUM_PRIMITIVE,1);
%   Eseguo Nac per ogni policy pi_pesi(i). Il reward è pesato rispetto al
%   peso effettivo che la primitiva motoria ha avuto nell'azione.
for i=1:NUM_PRIMITIVE
    if(i==8 || i==9)
        if (not(sum(pi_pesi(8:9))))
            [w(:,i),t(:,i),pi_pesi(i),z(:,i),mean_policies(i,1)]=Nac(w(:,i),t(:,i),pi_pesi(i),z(:,i),x,y,0);
        else
            [w(:,i),t(:,i),pi_pesi(i),z(:,i),mean_policies(i,1)]=Nac(w(:,i),t(:,i),pi_pesi(i),z(:,i),x,y,R_ANG*(pi_pesi(i)/sum(pi_pesi(8:9))));
        end
    else
        if (not(sum(pi_pesi(1:NUM_PRIMITIVE))))
            [w(:,i),t(:,i),pi_pesi(i),z(:,i),mean_policies(i,1)]=Nac(w(:,i),t(:,i),pi_pesi(i),z(:,i),x,y,0);
        else
            [w(:,i),t(:,i),pi_pesi(i),z(:,i),mean_policies(i,1)]=Nac(w(:,i),t(:,i),pi_pesi(i),z(:,i),x,y,R_CAR*(pi_pesi(i)/sum(pi_pesi(1:NUM_PRIMITIVE))));
        end
    end
end
MEAN_POLICIES=[MEAN_POLICIES; mean_policies];

end

