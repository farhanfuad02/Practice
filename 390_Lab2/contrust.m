% Read the image
img = imread('c.JPG'); % Replace with your image file

% Convert the image to double precision for processing
img_double = double(img);

% Define the desired output range (e.g., 0 to 255 for 8-bit images)
min_out = 0;
max_out = 255;

% Initialize the contrast stretched image
img_stretched = zeros(size(img_double));

% Process each color channel separately
for i = 1:3
    % Extract the current channel
    channel = img_double(:, :, i);
    
    % Define the input range for contrast stretching
    min_in = double(prctile(channel(:), 2)); % 2nd percentile for minimum value
    max_in = double(prctile(channel(:), 98)); % 98th percentile for maximum value
    
    % Apply the contrast stretching formula
    channel_stretched = (channel - min_in) / (max_in - min_in) * (max_out - min_out) + min_out;
    
    % Clip values to ensure they are within the valid range
    channel_stretched = min(max(channel_stretched, min_out), max_out);
    
    % Store the processed channel
    img_stretched(:, :, i) = channel_stretched;
end

% Convert the stretched image back to uint8
img_stretched_uint8 = uint8(img_stretched);

% Display the original and enhanced images
figure;

% Display the original image
subplot(1, 2, 1);
imshow(img);
title('Original Image');

% Display the contrast-stretched image
subplot(1, 2, 2);
imshow(img_stretched_uint8);
title('Contrast Stretched Image');
