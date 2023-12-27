function smoothedImage = ApplyMinFilter(oldImage, sizeMask)
      [row, col, ch] = size(oldImage);
    paddingImage = zeros(row, col, ch);
    boundary = floor(sizeMask / 2);
    imageBorder = padarray(oldImage, [boundary, boundary], 'replicate', 'both');
    [newRow, newCol, n] = size(imageBorder);

    % Initialize the result image
    filteredImage = zeros(row, col, ch);

    % Apply the average filter
    for i = 1:row
        for j = 1:col
            for k = 1:ch
                % Extract the local neighborhood
                localRegion = imageBorder(i:i+sizeMask-1, j:j+sizeMask-1, k);

                % Calculate the mean using the mean function
                filteredImage(i, j, k) = min(localRegion(:));
            end
        end
    end

    % Convert the result to uint8 for display
     filteredImage = uint8(filteredImage);
% 
%     % Display the original and filtered images
%     figure;
%     subplot(1, 2, 1);
%     imshow(oldImage);
%     title('Original Image');
% 
%     subplot(1, 2, 2);
%     imshow(filteredImage);
%     title('Filtered Image');

    % Return the filtered image
smoothedImage = filteredImage;
end