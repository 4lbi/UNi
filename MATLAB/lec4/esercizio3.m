clear all
close all
clc

puzzle = imread('puzzle.jpg');

% 1. read the image
image = im2gray(puzzle);

% 2. template selection
figure('Name', 'Template'), imshow(puzzle);
title('select the template');
rect = getrect; % select a rectangle
template = im2gray(imcrop(puzzle, rect));

% show the two togheter
figure('Name', 'Image and Template'), montage({image, template})

% 3. cross-correlation
correlation = normxcorr2(template, image);

% matrix of correlation
figure('Name', 'matrix of correlation'), surf(correlation)
shading flat

% 4. find the peak
[max_corr, index] = max(abs(correlation(:))); % return the max and the index , but in column version [1,1] = 1 - [1,2] = 2 - ...
[ypeak, xpeak] = ind2sub(size(correlation), index(1)); % then transformed into coordinates

% account for the padding that normxcorr2 adds
yoffSet = ypeak - size(template, 1) + 1;
xoffSet = xpeak - size(template, 2) + 1;

% 5. show the result
resultImg = cat(3, image, image, image);

resultImg = resultImg * 0.6;

resultImg(yoffSet:yoffSet+size(template, 1)-1, xoffSet:xoffSet+size(template, 2)-1, :) = puzzle(yoffSet:yoffSet+size(template, 1)-1, xoffSet:xoffSet+size(template, 2)-1, :);

figure;
imshow(resultImg);
title('result image');