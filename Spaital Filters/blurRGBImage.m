function blurRGBImage(in_image, value_of_cof)
    % Check if the input image is RGB
    if size(in_image, 3) == 3
        % Extract individual color channels
        redChannel = in_image(:, :, 1);
        greenChannel = in_image(:, :, 2);
        blueChannel = in_image(:, :, 3);

        % Apply blurring to each color channel
        blurredRed = myImfilter(redChannel, fspecial('average', [value_of_cof, value_of_cof]));
        blurredGreen = myImfilter(greenChannel, fspecial('average', [value_of_cof, value_of_cof]));
        blurredBlue = myImfilter(blueChannel, fspecial('average', [value_of_cof, value_of_cof]));

        % Combine the blurred channels to form the final image
        out_image = cat(3, uint8(blurredRed), uint8(blurredGreen), uint8(blurredBlue));
    elseif size(in_image, 3) == 1
        % Grayscale image
        out_image = myImfilter(in_image, fspecial('average', [value_of_cof, value_of_cof]));
    else
        error('Input image must be either grayscale or RGB.');
    end

    % Display the original and blurred images
    figure;
    subplot(1, 2, 1);
    imshow(in_image);
    title('Original Image');

    subplot(1, 2, 2);
    imshow(out_image, []);
    title('Blurred Image');
end
