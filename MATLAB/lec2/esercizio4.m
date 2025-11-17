% Esercizio 4
% Scrivere una funzione, MYflip, che dato un vettore mu:
% - Ne crei una copia "riflessa" (per esempio, da [1 2 3] ottengo [3,2,1])
% - La concateni a sinistra al vettore originale (ossia [3,2,1,1,2,3])

clear all
close all
clc

vettore_A = [1 2 3]
res = MYflip(vettore_A)