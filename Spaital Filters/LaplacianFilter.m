function LaplacianFilter(inputImage)
    % Define the Laplacian filter kernel
    laplacianKernel = [0, 1, 0; 1, -4, 1; 0, 1, 0];

    % Apply the filter using myImfilter
    filteredImage = myImfilter(inputImage, laplacianKernel);
    
    % Clip the values to the range [0, 255]
    laplacianImage = max(min(filteredImage, 255), 0);

    % Convert back to uint8 for display
    filteredImage = uint8(laplacianImage);
    
    figure;
    subplot(1, 2, 1);
    imshow(inputImage);
    title('Original Image');

    subplot(1, 2, 2);
    imshow(filteredImage, []);
    title('Laplacian Filtered Image');
end
