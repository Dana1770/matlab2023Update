function newImg = medianfilter(oldImg, s)
 if(mod(s,3)~=0)
        s=s+1;
 end
    [R, C, L] = size(oldImg);
    
    % Determine padding size based on the filter window
    k = (s - 1) / 2;
    
    % Initialize the output image
    newImg = zeros(R, C, L);
    
    % Check if the input image is RGB
    if L == 3
        % Traditional median filter
        oldImg = padarray(oldImg, [k, k]);
        [R, C, L] = size(oldImg);
        newImg = zeros(R, C, L);

        for i = 1 + k : R - k
            for j = 1 + k : C - k
                % Extract and sort sub-images for each color channel
                subImg = oldImg(i - k : i + k, j - k : j + k, :);
                sorted = sort(reshape(subImg, [s * s, L]));

                % Compute the median for each color channel
                newImg(i, j, :) = median(sorted);
            end
        end
    else
        % Grayscale image
        % Traditional median filter
        oldImg = padarray(oldImg, [k, k]);
        [R, C, ~] = size(oldImg);
        newImg = zeros(R, C);

        for i = 1 + k : R - k
            for j = 1 + k : C - k
                % Extract and sort sub-image
                subImg1 = oldImg(i - k : i + k, j - k : j + k);
                sorted = sort(reshape(subImg1, [s * s, 1]));

                % Compute the median
                newImg(i, j) = median(sorted);
            end
        end
    end

    % Clip the values to the range [0, 255]
    newImg = uint8(max(min(newImg, 255), 0));
end
