clear all
close all
clc


x1 = [1 1 1 1 1 1 1 1]; 
x2 = [1 2 3 4 5 6 7 8]; 
x3 = [0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1];

figure

subplot(311)
stem(x1)
title('x1')

subplot(312)
stem(x2)
title('x2')

subplot(313)
stem(x3)
title('x3')

% [x1 o x2]
[autocor_norm, lags] = xcorr(x1, x2, 'normalized');
[autocor_nonorm, ~] = xcorr(x1, x2);

figure; set(gcf, 'name', '[x1 o x2]', 'IntegerHandle', 'off');

subplot(211)
plot(lags, autocor_norm)
title('normalized')
grid on
xlabel('lags');
ylabel('correlation values');

subplot(212)
plot(lags, autocor_nonorm)
title('not normalized')
grid on
xlabel('lags');
ylabel('correlation values');

% [x1 o x3]
[autocor_norm2, lags] = xcorr(x1, x3, 'normalized');
[autocor_nonorm2, ~] = xcorr(x1, x3);

figure; set(gcf, 'name', '[x1 o x3]', 'IntegerHandle', 'off');

subplot(211)
plot(lags, autocor_norm2)
grid on
title('normalized')
xlabel('lags');
ylabel('correlation values');

subplot(212)
plot(lags, autocor_nonorm2)
grid on
title('not normalized')
xlabel('lags');
ylabel('correlation values');

[max(autocor_norm) max(autocor_norm2)]
[max(autocor_nonorm) max(autocor_nonorm2)]

% Se siamo interessati alla "forma", dobbiamo considerare la versione normalizzata.
% Nell'esempio qui sopra x3 è molto simile a x1,
% ma la sua cross-correlazione massima è molto più bassa di quella di x2 con x1.
% Se normalizzo la similarità si vede perfettamente.