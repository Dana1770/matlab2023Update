function resultImage = EdgeDetection(originalImage)
    % Convert the image to grayscale if it's in color
    [r, c, ch] = size(originalImage);
    grayImage=originalImage;
    if (ch > 1)
        grayImage = ConvertToGray(originalImage);
    end
    
    % Convert to double for calculations
    grayImage = double(grayImage);

    % Laplacian filter
    laplacianFilter = [0, -1, 0; -1, 4, -1; 0, -1, 0];

    % Apply convolution
    [row, col] = size(grayImage);
    edgeImage = zeros(row, col);

    for i = 2:row-1
        for j = 2:col-1
            neighborhood = grayImage(i-1:i+1, j-1:j+1);
            edgeImage(i, j) = sum(sum(neighborhood .* laplacianFilter));
        end
    end

    % Apply high contrast adjustment
    highContrastMin = min(edgeImage(:));
    highContrastMax = max(edgeImage(:));
    edgeImage = applyContrastStretching(edgeImage, highContrastMin, highContrastMax);

    % Display the riginal and edge-detected images
   

    resultImage = edgeImage;
end

