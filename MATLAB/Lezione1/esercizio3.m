who
clear all

% creare una function chiamata MyMean, che dato un vettore o una matrice in ingresso, restituisca il valore medio;
% nel caso di vettori la funzione MyMean restituisce un singolo valore medio,
% mentre per le matrici un vettore riga contenente il valor medio di ogni colonna.

function media = MyMean(object)
    
    if isrow(object)
        object = object(:); % trasforma qualsiasi array in un vettore colonna
    end

    media = zeros(1, size(object, 2), 'double');

    for cols = 1:size(object, 2)
        sumCols = 0;

        for rows = 1:size(object, 1)
            sumCols = sumCols + object(rows, cols);
        end
        
        media(cols) = sumCols / size(object, 1);
    end
end

% controllare che la funzione dia il risultato atteso (confronto con il risultato della funzione mean() di Matlab)
% con in ingresso un vettore riga, un vettore colonna e una matrice
object = [1:2:20]

O_media = MyMean(double(object))

ML_media = mean(object)

confronto = [O_media; ML_media]

who
clear all