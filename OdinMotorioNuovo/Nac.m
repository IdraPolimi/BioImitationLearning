function [ w,t,a1,z,mean_policy ] = Nac( w,t,a,z,x,y,r )
%NAC Algoritmo Natural Actor-Critic, restituisce il vettore dei pesi della
%policy. Ogni chiamata a questa funzione è una iterazione dell'algoritmo.
%   Critico: Sarsa(1)
%   Attore: Policy gaussiana
%
%   Variabili
%   w: vettore colonna dei parametri della policy
%   t: vettore colonna dei parametri della Action-Value function
%   z: vettore colonna delle eligibility traces della Action-Value function
%   a: azione risultante dalla policy
%   r: reward ricevuto
%   y: vettore colonna dello stato dopo l'esecuzione di a. Rappresentato da vettore
%   delle distanza dai centri dei cluster.
%   x: vettore colonna dello stato presente
%   b: learning rate della policy. Deve essere più piccolo di quello del
%   critico.

%   Inizializzazioni eseguite nel chiamante alla prima iterazione
%   w=0; t=0; z=0;

b=0.5;
SIGMA = 0.2;

%   Sceglie azione a1 dalla policy. Le azioni ammissibili sono comprese
%   nell'intervallo [0,1].
id=1;
while id==1
    mean_policy=w'*basis_actor(y);
    a1 = mvnrnd(mean_policy,SIGMA);
    if(a1>=0 && a1<=1)
        id=0;
    end
end


%   Valuto la policy corrente aggiornando la Action-value function
[t,z] = sarsa_critic(x,a,r,y,a1,t,z,w);

%   Aggiorno i pesi della policy con la regola del Nac
%w = w + b*t; %gradient ascent
w = w - b*t; %gradient descent
end

