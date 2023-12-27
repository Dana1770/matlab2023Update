function outputImage = applyContrastStretching(inputImage, newMin, newMax)
    % Convert the input image to double precision for calculations
    inputImage = double(inputImage);

    % Get the dimensions of the input image
    [rows, columns, channels] = size(inputImage);

    % Calculate the old minimum and maximum values for each channel
    oldMin = min(min(inputImage, [], 1), [], 2);
    oldMax = max(max(inputImage, [], 1), [], 2);

    % Initialize the new image
    newImage = zeros(rows, columns, channels);

    % Apply contrast stretching for each channel
    for i = 1:channels
        newImage(:, :, i) = ((inputImage(:, :, i) - oldMin(i)) / (oldMax(i) - oldMin(i))) * (newMax - newMin) + newMin;
        
        % Cut off the range to ensure the new values are within [0, 255]
        newImage(newImage(:, :, i) > 255) = 255;
        newImage(newImage(:, :, i) < 0) = 0;
    end

    % Convert the new image to uint8 for display
    newImage = uint8(newImage);

    % Display the original and processed images along with histograms
%     figure;
%     imshow(uint8(inputImage));
%     title('Original Image');

    % Display the histogram of the original image
    %drawHistogram(inputImage,'Original Image');
   
    % Display the enhanced image
    
%     figure;
%     imshow(newImage);
%     title('Enhanced Image');
% 
%     drawHistogram(newImage,'Enhanced Image');
%     
%     % Display the histogram of the enhanced image
     outputImage = newImage;
end