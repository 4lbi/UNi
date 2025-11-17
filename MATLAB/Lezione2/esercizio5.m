clear all
who

I = imread('cells.png');

subplot (1, 2, 1), imshow(I), title('Immagine originale')
subplot (1, 2, 2), imshow(I, [34,36]), title('Nucle')