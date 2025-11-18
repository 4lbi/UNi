clear all
close all
clc

fmri_data = load('Ab_pASL_Yeo_Average.txt');
% size(fmri_data)

% calcola la media lungo la dimensione 1 (le righe), cioè "attraversa" le righe per darti la media di ogni colonna
fmri_centered = fmri_data - mean(fmri_data, 1);
% disp(fmri_centered);

% Inizializza la matrice di output
% la dimensione è dovuta al fatto che lavoro sulle regioni, quindi le colonne che sono 100
matrice_xcorr_max = zeros(100, 100);

% Per ogni coppia di segnali (righe x colonne)
for i = 1:100
    for j = 1:100
        % salto i segnali uguali
        if i ~= j
            % calcola la cross-correlazione normalizzata per colonna
            [xcorr_vals, lags] = xcorr(fmri_centered(:,i), fmri_centered(:,j), 'normalized');
            
            % prendo il massimo
            matrice_xcorr_max(i,j) = max(abs(xcorr_vals));
        end
    end
end
% disp(matrice_xcorr_max)

imagesc(matrice_xcorr_max);
colormap('jet');
colorbar;
title('Max Cross-Correlation Matrix');
xlabel('index');
ylabel('index');

% cerco il massimo nella matrice dei massimi tra le colonne
mx = max(matrice_xcorr_max(:));

% lo trovo nella matrice
[r, c] = find(matrice_xcorr_max == mx);
fprintf('regioni a massima similarità: %d e %d\n', r(1), c(1))

% per regioni si intendono le colonne della matrice 'fmri_data'