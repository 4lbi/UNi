% Esercizio 5
% Scrivere una funzione, checksym, che dia 1 se la matrice inserita è simmetrica, 0 altrimenti.
% Nota: la simmetria è definita per matrici quadrate:
%   Controllare che l'ingresso sia effettivamente una matrice 
%     (che non sia un vettore o una matrice n-dimensionale)
%   Controllare che l'ingresso sia una matrice quadrata
% Suggerimento: una matrice simmetrica è uguale alla sua trasposta

clc

% matrice simmetrica
matrice_A = [ 1 2; 2 1];
res = checksym(matrice_A);
disp([newline, 'Controllo della simmetria: ', num2str(res)])

% matrice non simmetrica
matrice_A = [ 1 2; 1 2];
res = checksym(matrice_A);
% Un modo alternativo di visualizzare a video
fprintf('\nControllo della simmetria: %d\n', res)

matrice_A = [1 2 3; 4 5 6];
res = checksym(matrice_A);
disp([newline, 'Controllo della simmetria: ', num2str(res)])