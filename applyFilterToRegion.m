function filteredImage = applyFilterToRegion(imagePath)
    % Read the image using imread
    try
        x = imagePath;
    catch
        % Display an error message if image reading fails
        errordlg('Error reading the image. Please check the file path and format.', 'Image Reading Error');
        return;
    end

    % Display the original image
    imshow(x);
    title('Original Image');

    % Allow the user to interactively select a region of interest (ROI)
    BW1 = roipoly;

    % Apply averaging filter to the selected region
    filterSize = 20;
    filter = fspecial('average', filterSize);
    
    % Ensure the image is converted to double before filtering
    x = double(x);

    % Apply filter to the selected region
    filteredImage = roifilt2(filter, x, BW1);

    % Display the result
    imshow(filteredImage, []);
    title('Filtered Image');

    % Turn off warnings
    warning off;
end
