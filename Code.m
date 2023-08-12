% Load the input image
inputImage = imread('input.jpg'); % Replace with your input image path

% Convert the input image to grayscale
grayInputImage = rgb2gray(inputImage);

% Apply adaptive thresholding
foregroundMask = imbinarize(grayInputImage, 'adaptive', 'ForegroundPolarity', 'dark', 'Sensitivity', 0.3);

% Clean up the foreground mask (morphological operations)
se = strel('disk', 5);  % Adjust the structuring element size as needed
cleanForegroundMask = imopen(foregroundMask, se);

% Apply the mask to the original image to extract foreground
foreground = bsxfun(@times, inputImage, uint8(cleanForegroundMask));

% Display the original input image
subplot(1, 3, 1);
imshow(inputImage);
title('Input Image');

% Display the foreground mask
subplot(1, 3, 2);
imshow(cleanForegroundMask);
title('Foreground Mask');

% Display the separated foreground image
subplot(1, 3, 3);
imshow(foreground);
title('Separated Foreground Image');
