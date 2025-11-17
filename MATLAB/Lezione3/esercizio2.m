clear all
close all
clc

load('audioSignals.mat');
% - Le variabili "Y1", "Y2", "Y3"... corrispondono ai primi 20 secondi 
%   secondi dei segnali audio delle canzoni 'funky.mp3','lost.mp3',
%   'Diana.mp3','never.mp3', 'T69.mp3'. In particolare i segnali
%   corrispondono al primo canale 
% - la variabile "test" contiene un segnale audio 'Test.wav'

% Le variabili sono ottenute con le istruzioni qui sotto (se volete usare
% altre canzoni)
%
[fullY1,fs1] = audioread('funky.mp3',[1,96000*20]);
[fullY2,fs2] = audioread('lost.mp3',[1,96000*20]);
[fullY3,fs3] = audioread('Diana.mp3',[1,96000*20]);
[fullY4,fs4] = audioread('never.mp3',[1,96000*20]);
[fullY5,fs5] = audioread('T69.mp3',[1,96000*20]);

fulltest = audioread('Test.wav');

%%% Nota: un segnale audio ha due canali (stereo),
%%% per la cross correlazione consideriamo solo il primo
Y1 = fullY1(:,1);
Y2 = fullY2(:,1);
Y3 = fullY3(:,1);
Y4 = fullY4(:,1);
Y5 = fullY5(:,1);
test = fulltest(:,1);

% Visualizzo un pezzo dei segnali
figure; set(gcf,'name','Dataset canzoni','IntegerHandle','off');
subplot(2,3,1); plot(Y1(1:96000*3));
subplot(2,3,2); plot(Y2(1:96000*3));
subplot(2,3,3); plot(Y3(1:96000*3));
subplot(2,3,4); plot(Y4(1:96000*3));
subplot(2,3,5); plot(Y5(1:96000*3));
subplot(2,3,6); plot(test(1:96000*3));

% Per ottimizzare il codice, si memorizzano i segnali in un array di celle
% Array di celle: metodo più veloce per raccogliere sequenze di lunghezza diversa
% documentazione -> "doc cell"
gallery{1} = Y1;
gallery{2} = Y2;
gallery{3} = Y3;
gallery{4} = Y4;
gallery{5} = Y5;

signalMax = zeros(5,1);
figure; set(gcf, 'name', 'Risultati di matching', 'IntegerHandle', 'off');

% per ogni segnale della galleria, calcolo la similarità, i.e. il massimo
% della cross correlazione, e lo memorizzo nell'array signalMax ;
for g = 1:5
    [signal{g}, lagc{g}] = xcorr(gallery{g}, test);
    signalMax(g) = max(signal{g});
    
    % visualizzo anche i vettori di cross-correlazione
    subplot(2,3,g);
    plot(lagc{g}, signal{g});
end

% trovo il segnale con la miglior cross correlazione tra tutti i massimi dei segnali correlati
[maxcorr, bestmatch] = max(signalMax);

% bestmatch mi ritorna la posizione (indice) del massimo nel vettore signalMax, cioè la canzone più simile al test
fprintf('Canzone più simile: %d\n', bestmatch);

% trovo il lag della massima correlazione nel segnale col match migliore
[~, maxli] = max(signal{bestmatch});

% visualizzo il segnale originale
figure
plot(test(:,1), '-r', 'LineWidth', 2);
hold on

% visualizzo il best match
plot(gallery{bestmatch}(lagc{bestmatch}(maxli)+1:lagc{bestmatch}(maxli)+480001, 1), '-k', 'LineWidth', 1);

% [first, lags] = xcorr(test, Y1);
% [second, ~] = xcorr(test, Y2);
% [third, ~] = xcorr(test, Y3);
% [forth, ~] = xcorr(test, Y4);
% [fifth, ~] = xcorr(test, Y5);

% Visualizzo la cross-correlazione delle canzoni con il segnale test
% figure; set(gcf,'name','Cross Correlation','IntegerHandle','off');
% subplot(2,3,1); plot(lags, normalize(first));
% subplot(2,3,2); plot(lags, normalize(second));
% subplot(2,3,3); plot(lags, normalize(third));
% subplot(2,3,4); plot(lags, normalize(forth));
% subplot(2,3,5); plot(lags, normalize(fifth));