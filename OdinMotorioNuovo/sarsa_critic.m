function [ t,z ] = sarsa_critic( x,a,r,y,a1,t,z,w )
%SARSACRITIC Algoritmo Sarsa(1) che valuta la policy corrente aggiornando i
%parametri della propria Action-Value function.

%   Variabili:
%   x: vettore colonna dello stato da valutare
%   a: azione da valutare
%   r: reward immediato ricevuto
%   y: vettore colonna dello stato dopo l'esecuzione di a. Rappresentato da
%   vettore delle distanza dai centri dei cluster.
%   a1: azione scelta dalla policy nello stato y. 
%   t: vettore colonna dei parametri della Action-Value function
%   z: vettore colonna delle eligibility traces della Action-Value function
%   alpha: learning rate della policy. Deve essere più piccolo di quello del
%   critico.
%   d: errore td
%   g: discount rate
%   l: lambda trace-decay

%   Inizializzazioni da effettuare la prima volta che chiamo questo modulo
%   z=0;
%
%
%

%   Inizializzazioni
%g=0.9; % Valuto la policy quindi sono nell'area dei gangli con discount alto.

l=1; % Implemento Td(1), comportamente stile MonteCarlo. 
alpha=0.85;

g=0; %caso esperimento pallina è episodico

%   Calcolo l'errore td
phi = basis_critic(x,a,w);
d = r + g*(t'*basis_critic(y,a1,w)) - t'*phi;
%   Calcolo la eligibility trace
z = phi + g*l*z;
%   Calcolo i parametri aggiornati della Action-Value function
t = t + alpha*d*z;


end

