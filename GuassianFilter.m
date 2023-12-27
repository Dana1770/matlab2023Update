function smoothedImage = GuassianFilter(inputImage, sigma)
    % Convert the input image to double for calculations
    inputImage = double(inputImage);

    % Create a 2D Gaussian filter
    filterSize = 2 * ceil(3 * sigma) + 1;
    gaussianFilter = fspecial('gaussian', [filterSize, filterSize], sigma);

    % Apply the Gaussian filter using imfilter
    smoothedImage = imfilter(inputImage, gaussianFilter, 'conv', 'replicate');

    % Convert the result back to uint8 for display
    smoothedImage = uint8(smoothedImage);

    % Display the original and smoothed images
    
    
end
