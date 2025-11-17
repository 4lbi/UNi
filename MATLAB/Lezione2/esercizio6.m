clear all
who

I = imread('peppers.png');

% Get the size of the image
[rows, cols, ~] = size(I);

arrayR = zeros(1, 256);
arrayG = zeros(1, 256);
arrayB = zeros(1, 256);

% Iterate over each pixel
for r = 1:rows
    for c = 1:cols
        % Access the pixel value (channel R)
        redValue = I(r, c, 1);
        arrayR(redValue + 1) = arrayR(redValue + 1) + 1;

        % Access the pixel value (channel G)
        greenValue = I(r, c, 2);
        arrayG(greenValue + 1) = arrayG(greenValue + 1) + 1;

        % Access the pixel value (channel B)
        blueValue = I(r, c, 3);
        arrayB(blueValue + 1) = arrayB(blueValue + 1) + 1;
    end
end


subplot (1, 3, 1), bar(arrayR), title('Channel 1')
subplot (1, 3, 2), bar(arrayG), title('Channel 2')
subplot (1, 3, 3), bar(arrayB), title('Channel 3')