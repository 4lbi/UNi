clear all
who

img = imread('moon.tif');

% Get the size of the image
[rows, cols] = size(img);

array = zeros(1, 256);

% Iterate over each pixel
for r = 1:rows
    for c = 1:cols
        % Access the pixel value
        pixelValue = img(r, c);

        array(pixelValue + 1) = array(pixelValue + 1) + 1;
    end
end

figure(2)
bar(array)
xlabel('Valori')
ylabel('Numero di pixels') 