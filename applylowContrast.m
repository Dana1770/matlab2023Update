function stretchedImage = applylowContrast(image, oldMin, oldMax)
    % Convert the image to double precision for calculations
    image = double(image);

    % Get the minimum and maximum values of the original image
%     newMin = min(image(:));
%     newMax = max(image(:));
    newMin=0;
    newMax=255;

    % Apply the contrast stretching formula from new min and new max to
    % oldmin and oldmax
    stretchedImage = (image - oldMin) / (oldMax - oldMin) * (newMax - newMin) + newMin;

    % Ensure the values are within the specified range [newMin, newMax]
    stretchedImage(stretchedImage < newMin) = newMin;
    stretchedImage(stretchedImage > newMax) = newMax;

    % Convert the result back to the original data type
    stretchedImage = uint8(round(stretchedImage));

    % Display the original and stretched images
%     figure;
% 
%     subplot(1, 2, 1);
%     imshow(uint8(image));
%     title('Original Image');
% 
%     subplot(1, 2, 2);
%     imshow(stretchedImage);
%     title('Contrast Stretched Image');
end

