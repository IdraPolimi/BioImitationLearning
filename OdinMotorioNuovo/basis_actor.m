function [ f ] = basis_actor( x )
%BASIS_ACTOR Calcola il vettore delle features per una coppia stato-azione
%   Le features sono gaussiane, ogni componente gaussiana i ha centro
%   xi che è il vettore delle distanze dai centri dei cluster 
%   dello stato "base" corrispondente alla primitiva i-esima.
%   Il numero delle basis function è il numero delle primitive che ho a
%   disposizione.

%   variabili
%   f: vettore colonna risultato delle basis functions
%   x: vettore colonna distanze dai cluster dello stato

%   media e varianza delle gaussiane
global NUM_PRIMITIVE
global MU_ACTOR
global SIGMA_ACTOR

%   Calcolo la gaussiana multivariata, immaginando che vettore x sia
%   vettore colonna lo devo trasporre.
    f = zeros(NUM_PRIMITIVE,1);
for i=1:NUM_PRIMITIVE
    f(i,1) = mvnpdf(x',MU_ACTOR(i,:),SIGMA_ACTOR);
    %   Caso con SIGMA=1
    %f(i,1) = mvnpdf(x',MU_ACTOR(i,:));
end



end