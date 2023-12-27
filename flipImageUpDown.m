function flipUDImage = flipImageUpDown(originalImage)
    [rows, cols, channels] = size(originalImage);
    flipUDImage = zeros(rows, cols, channels, class(originalImage));

    for i = 1:rows
        for j = 1:cols
            % Flip pixel values from top to bottom
            flipUDImage(i, j, :) = originalImage(rows - i + 1, j, :);
        end
    end

    imshow(uint8(flipUDImage));
end


%in Command window
%i=imread('pout.tif');
%flipImageUpDown(i);