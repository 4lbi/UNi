clear all
close all
clc

% Inizializzare due vettori v1 e v2 con i valori [0 0] e [1 1] 
% rispettivamente.
v1 = [0 0];
v2 = [1 1];
% Assumendo che i due numeri contenuti nel vettore siano coordinate 
% (x,y) in un piano cartesiano, calcolare la distanza euclidea 
% tra v1 e v2.

% versione estesa:
a = v1-v2; % differenza
b = a.^2; % elevamento al quadrato elemento per elemento
c = sum(b); % somma
d = sqrt(c) % radice quadrata

% versione compatta:
d = sqrt(sum((v1-v2).^2))

% Ripetere l'esercizio inizializzando v1 con [2; 0] e v2 con [0; 2]
v1 = [2;0];
v2 = [0;2];
dist2 = sqrt(sum((v1-v2).^2))