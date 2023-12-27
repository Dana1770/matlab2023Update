% function  filteredImage = diagonalrightsharp(inputImage)
%     % Check if the input image is RGB
%     if size(inputImage, 3) == 3
%         % Convert RGB to grayscale manually
%         grayImage = 0.2989 * inputImage(:,:,1) + 0.5870 * inputImage(:,:,2) + 0.1140 * inputImage(:,:,3);
%     else
%         % If the input is already grayscale, use it as is
%         grayImage = inputImage;
%     end
% 
%     % Define the Robert 1 filter
%     filter = [1, 0, 0; 0, 1, 0; 0, 0, -1];
% 
%     % Apply the filter using myImfilter
%     filteredImage = myImfilter(grayImage, filter);
% 
%     % Display the original and edge-detected images
% %     figure;
% %     subplot(1, 2, 1);
% %     imshow(inputImage);
% %     title('Original Image');
% 
% %     subplot(1, 2, 2);
%     imshow(filteredImage, []);
% %     title('Edge Detection (Robert1)');
% end
function filteredImage = diagonalrightsharp(inputImage)
    % Check if the input image is RGB
    if size(inputImage, 3) == 3
        % Convert RGB to grayscale
        grayImage = 0.2989 * inputImage(:,:,1) + 0.5870 * inputImage(:,:,2) + 0.1140 * inputImage(:,:,3);
        filteredImage = zeros(size(inputImage));
        
        % Apply the filter to each color channel
        for channel = 1:3
            filteredImage(:,:,channel) = myImfilter(inputImage(:,:,channel), filter);
        end
    else
        % If the input is already grayscale, use it as is
        grayImage = inputImage;
        filteredImage = myImfilter(grayImage, filter);
    end

    % Define the Robert 1 filter
    filter = [1, 0, 0; 0, 1, 0; 0, 0, -1];

    % Apply the filter using myImfilter
    filteredImage = myImfilter(grayImage, filter);

    % Display the original and edge-detected images
    filteredImage =filteredImage ;
end