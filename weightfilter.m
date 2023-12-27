function filteredImage = weightfilter(inputImage)
    % Check if the input image is RGB
    if size(inputImage, 3) == 3
        % Define the weight filter for each channel
        weightFilterR = (1/16) * [1 2 1; 2 4 2; 1 2 1];
        weightFilterG = weightFilterR;
        weightFilterB = weightFilterR;

        % Apply the weight filter to each channel separately
        filteredImage(:,:,1) = myImfilter(inputImage(:,:,1), weightFilterR);
        filteredImage(:,:,2) = myImfilter(inputImage(:,:,2), weightFilterG);
        filteredImage(:,:,3) = myImfilter(inputImage(:,:,3), weightFilterB);
    else
        % For grayscale images, use the same weight filter for all channels
        weightFilter = (1/16) * [1 2 1; 2 4 2; 1 2 1];
        filteredImage = myImfilter(inputImage, weightFilter);
    end
    
    % Display the original and filtered images
%     figure;
%     subplot(1, 2, 1);
%     imshow(inputImage);
%     title('Original Image');

%     subplot(1, 2, 2);
    imshow(uint8(filteredImage));
%     title('Weight Filter');
end
