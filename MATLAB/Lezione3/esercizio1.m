clear all
close all
clc

function shiftedArray = shiftRight(inputArray)
   % Controlla se l'array è vuoto
    if isempty(inputArray)
        shiftedArray = inputArray; % Restituisce l'array vuoto
        return;
    end

    % Crea un array di zeri della stessa lunghezza
    shiftedArray = zeros(1, length(inputArray));

    % Sposta gli elementi a destra di una posizione
    shiftedArray(1, 2:end) = inputArray(1, 1:end-1);

    % Il primo elemento diventa zero
    shiftedArray(1, 1) = 0;
end

% INPUT 
x1 = [1 1 1 1 1 1 1 1]; %box 
x2 = [1 2 3 4 5 6 7 8]; %triangolo

M = length(x1); % lunghezza primo segnale
N = length(x2); % lunghezza secondo segnale

cross_correlation = zeros(1, (N + M) - 1);

firstArray = zeros(1, M + (2*N) - 2);
firstArray(1, N:(N + M - 1)) = x1;

secondArray = zeros(1, (2*N) + M - 2);
secondArray(1, 1:N) = x2;

% COMPACT
% firstArray = [zeros(1, N-1), x1, zeros(1, N-1)];
% secondArray = [x2, zeros(1, (N-1+M-1))];

for op = 1 : length(cross_correlation)
    temp = zeros(1, length(firstArray));
    for elem = 1 : length(cross_correlation)
        temp(elem) = firstArray(elem) * secondArray(elem);
    end
    secondArray = shiftRight(secondArray);
    % Utilizzo la funzione di libreria, che mi sposta a dx l'array 1 volta
    % con 2 ad indicarmi le colonne (1 -> righe)
    % secondArray = circshift(secondArray, 1, 2);

    cross_correlation(op) = sum(temp);
end

% visualizzazione 
figure;
set(gcf, 'Name', 'Segnali', 'IntegerHandle', 'off');

subplot(3, 1, 1); stem(x1); title('x1');
subplot(3, 1, 2); stem(x2); title('x2');
subplot(3, 1, 3); stem(cross_correlation); title('cross_correlation');