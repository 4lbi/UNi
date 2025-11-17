clear all
who

I = imread('seattle.png');

Ih = zeros(size(I));
Iv = zeros(size(I));

% Get the size of the image
[rows, cols] = size(I);

% Nota: il ciclo deve partire da 2
for i = 2:size(I,1)
    Ih(i,:) = abs(I(i,:) - I(i-1,:));
end

% Iterate over each pixel
for r = 1:rows
    for c = 1:cols
        if c > 1
            Iv(r, c) = abs(I(r,c)-I(r,c-1));
        end
    end
end

subplot (1, 3, 1), imshow(I), title('Immagine originale')
subplot (1, 3, 2), imshow(Ih), title('Evidenziati i contorni orizzontali')
subplot (1, 3, 3), imshow(Iv), title('Evidenziati i contorni verticali')
