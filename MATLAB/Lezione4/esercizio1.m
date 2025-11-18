clear all
close all
clc

% 1. read the image
image = im2gray(imread('target.jpg'));

% 2. template selection
figure('Name', 'Template'), imshow(image);
title('select the template');
rect = getrect; % select a rectangle
template = im2gray(imcrop(image, rect));

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
figure('Name', 'Matching Result'); % open a new figure
imshow(image)
hold on;

% draw a rectangle on the template position , in the image
drawrectangle(gca, 'Position', [xoffSet, yoffSet, size(template, 2), size(template, 1)], 'FaceAlpha', 0, 'Color', 'r', 'LineWidth', 2);
title(['Template found in : [', num2str(yoffSet), '; ', num2str(xoffSet), ']']);
hold off;