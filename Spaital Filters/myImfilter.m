function outputImage = myImfilter(image, filter)
    [rows, cols] = size(image);
    [filterRows, filterCols] = size(filter);
    
    % Ensure the filter size is odd for simplicity
    if mod(filterRows, 2) == 0 || mod(filterCols, 2) == 0
        error('Filter size must be odd for simplicity.');
    end
    
    % Convert image and filter to double
    image = double(image);
    filter = double(filter);
    
    % Pad the image to handle border pixels
    paddedImage = padarray(image, [(filterRows-1)/2, (filterCols-1)/2], 'replicate');
    
    % Initialize the output image
    outputImage = zeros(rows, cols);
    
    % Apply the filter
    for i = 1:rows
        for j = 1:cols
            region = paddedImage(i:i+filterRows-1, j:j+filterCols-1);
            outputImage(i, j) = sum(region(:) .* filter(:));
        end
    end
end