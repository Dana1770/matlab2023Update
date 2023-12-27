function newImage = quantizeImage(oldImage, numBits)
    oldImage = ConvertToGray(oldImage);
    
    % Gray level = 2^k
    grayLevel = 2^numBits;
    
    % Gap = 256 / Gray level
    gap = 256 / grayLevel;
    
    % Colors
    colors = gap:gap:256;
    
    % Initialize the new image
    newImage = zeros(size(oldImage));
    
    % Perform quantization
    for i = 1:size(oldImage, 1)
        for j = 1:size(oldImage, 2)
            % Temp = Old image(i, j) / Gap
            temp = oldImage(i, j) / gap;
            
            % Index = floor(Temp)
            index = floor(temp) + 1; % MATLAB indexing starts from 1
            
            % Ensure index is within valid range
            if index > numel(colors)
                index = numel(colors);
            elseif index < 1
                index = 1;
            end
            
            % New image(i, j) = Colors(Index)
            newImage(i, j) = colors(index);
        end
    end
    
    newImage = uint8(newImage);
%     figure, imshow(oldImage), title('Original Image');
%     figure, imshow(newImage), title('Quantized Image');
end