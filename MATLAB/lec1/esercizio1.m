who
clear all

% A vettore riga che contiene i numeri pari da 2 fino a 20
A = 2:2:20;

% B vettore riga con tutti i numeri da -22 a -13
B = -22:1:-13;

% C vettore riga con 10 valori uguali a 0.
C = zeros(1, 10);

who

% creare una nuova matrice dove le righe sono costituite da A, B e C (in questo ordine)
mat0 = [A; B; C]

% verificare e salvare le dimensioni della matrice creata, e il numero di elementi
dimension0 = size(mat0);
numElem0 = numel(mat0);

% estrarre la sotto-matrice che contiene le prime due righe e le prime cinque colonne
mat0(1:2, 1:5)

% sostituire la seconda colonna di MatX con il valore 31
mat0(:, 2) = 31

% creare un'altra matrice di numeri reali distribuiti in modo random (randn), con 4 righe e 10 colonne
mat1 = randn(4, 10);

% creare una matrice, data dalla concatenazione di mat0, mat1 e di nuovo mat0
mat01 = [mat0; mat1; mat0]

% verificare le dimensioni della matrice ed estrarre la diagonale
size(mat01);
diag01 = diag(mat01);

who
clear all