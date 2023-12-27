function img_resized = resize(orgImage, factor)
    % Get the size and number of channels of the original image
    [rows, cols, channels] = size(orgImage);

    % Initialize variables
    t = zeros(ceil(rows/factor), ceil(cols/factor), channels);
    temp = 1;

    % Resize the image for each channel
    for i = 1:factor:rows
        gemp = 1;
        for j = 1:factor:cols
            t(temp, gemp, :) = orgImage(i, j, :);
            gemp = gemp + 1;
        end
        temp = temp + 1;
    end

    % Convert the result to uint8
    img_resized = uint8(t);
    imshow(img_resized);
end
