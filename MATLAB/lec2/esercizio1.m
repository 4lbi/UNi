clear all
who

img = imread('Paperino.jpg');

modifiedImg = img;
modifiedImg(163:209,90:136,:) = 0;
modifiedImg(163:209,164:211,:) = 0;
modifiedImg(185:188,137:162,:) = 0;

rotateImg = imrotate(img, 45);

cropImg = imcrop(img);

subplot (2, 2, 1), imshow(img), title('Immagine Originale')
subplot (2, 2, 2), imshow(modifiedImg), title('Immagine Modificata')
subplot (2, 2, 3), imshow(rotateImg), title('Immagine Ruotata')
subplot (2, 2, 4), imshow(cropImg), title('Immagine con dettaglio occhi')