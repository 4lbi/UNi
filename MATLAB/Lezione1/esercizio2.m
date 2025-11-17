who
clear all

% generare un numero casuale con il comando randn (distribuzione normale standard)
x = randn(1)

% assegnare alla variabile y il valore 1 se tale numero è compreso tra -1 e 1 (media +- deviazione standard), 0 altrimenti
if x<-1 || x>1
    y = 0
else
    y = 1
end

% se ripeto il procedimento 10000 volte, quante volte il numero casuale cade nell'intervallo [-1;1] ?
r = randn(1, 10000);
count = sum(r >= -1 & r <= 1)

who
clear all