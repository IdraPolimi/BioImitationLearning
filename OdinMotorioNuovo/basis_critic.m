function [ f ] = basis_critic( x,a,w )
%BASIS Calcola il vettore delle features per una coppia stato-azione

%   variabili
%   f: vettore colonna rappresentante le compatible basis functions per x,a
%   x: vettore colonna distanze dai cluster dello stato
%   a: scalare, azione
%   teta: vettore colonna dei parametri della policy.
%   basis: vettore colonna delle basis function della policy valutate per
%   x,a.

global NUM_PRIMITIVE

sigma=0.2; %Inizializzarla come quella policy
f = zeros(NUM_PRIMITIVE,1);
basis = basis_actor(x);
for i=1:NUM_PRIMITIVE
    f(i) = (a-w'*basis)*basis(i)/(sigma^2);
end

end

