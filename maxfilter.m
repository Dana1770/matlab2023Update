function newImg = maxfilter(oldImg, s)
 if(mod(s,3)~=0)
        s=s+1;
 end
    k = (s - 1) / 2;  % Calculate the padding size based on filter size
    [R, C, L] = size(oldImg);  % Get the size of the input image

    % Pad the image
    oldImg = padarray(oldImg, [k, k], 'replicate', 'both');
    
    % Initialize the output image
    newImg = zeros(R, C, L);

    if L == 3
        % RGB image
        for i = 1:R
            for j = 1:C
                % Extract the local region
                subImg = oldImg(i:i+2*k, j:j+2*k, :);
                
                % Reshape the local region to a column vector
                subImg = reshape(subImg, [], 3);
                
                % Apply max filter and store the result for each channel
                newImg(i, j, :) = max(subImg);
            end
        end
    else
        % Grayscale image
        for i = 1:R
            for j = 1:C
                % Extract the local region
                subImg = oldImg(i:i+2*k, j:j+2*k);
                
                % Reshape the local region to a column vector
                subImg = subImg(:);
                
                % Apply max filter and store the result
                newImg(i, j) = max(subImg);
            end
        end
    end

    % Convert the output to uint8 data type
    newImg = uint8(newImg);

    % Display the result
%     figure;
%     subplot(1, 2, 1);
%     imshow(oldImg);
%     title('Original Image');

%     subplot(1, 2, 2);
    imshow(newImg);
%     title('Max Filtered Image');
end
