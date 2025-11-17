clear all
close all

X1 =[1     2     5     2     5;
     3     4     5     4     2;
     5     2     3     2     2;
     2     3     2     4     2;
     3     4     2     2     3];
     
     
X2 =[3     3     2;
     2     3     4;
     4     5     4];

 
[R1, C1] = size(X1);
[R2, C2] = size(X2);

zpX1 = [zeros(R1, (R2-1)), X1, zeros(R1, (R2-1))];
zpX1 = [zeros((C2-1), size(zpX1,2)); zpX1; zeros((C2-1), size(zpX1,2))];

disp(zpX1);

correlation = zeros(R1+R2-1, C1+C2-1);
[rows, cols] = size(correlation);

for i = 1:rows
    for j = 1:cols
        
        window = zpX1(i:i+R2-1, j:j+C2-1);
        prod = window .* X2;
        
        correlation(i, j) = sum(prod(:));
    end
end

% matrix of my correlation
disp(correlation);
figure('Name', 'matrix of correlation'), surf(correlation)
shading flat

% matlab command
correlation = xcorr2(X1, X2);
disp(correlation);