function flipLRImage = flipImageLeftRight(originalImage)
    [rows, cols, channels] = size(originalImage);
    flipLRImage = zeros(rows, cols, channels, class(originalImage));

    for i = 1:rows
        for j = 1:cols
            % Flip pixel values from left to right
            flipLRImage(i, j, :) = originalImage(i, cols - j + 1, :);
        end
    end

    imshow(uint8(flipLRImage));
end

%in Command window
%i=imread('pout.tif');
%flipImageLeftRight(i);
