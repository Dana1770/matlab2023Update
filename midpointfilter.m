function newImg = midpointfilter(oldImg, s)
 if(mod(s,3)~=0)
        s=s+1;
 end
 %store the old image in m
 m=oldImg;
 %apply salt and pepper noises in image 
 oldImg=saltandpepper(oldImg,0.5,0.55);
 %store the image after salt and pepper noises in n
 n=oldImg;
 %get the size of the image by  storing the
    [R, C, L] = size(oldImg);
    
    % Determine padding size based on the filter window
    k = (s - 1) / 2;
    
    % Initialize the output image
    newImg = zeros(R, C, L);
    
    % Check if the input image is RGB
    if L == 3%iterate in the number of channels
        % Midpoint filter with sorting
        oldImg = padarray(oldImg, [k, k]);%padding the old image by filter window of size k*k
        %store the size of old image after padding 
        [R, C, L] = size(oldImg);
        %create a matrix for store new image with the same size of old
        %image and this matrix is zeros
        newImg = zeros(R, C, L);
%apply the filter on a part of the image with the same size of filter
        for i = 1 + k : R - k
            for j = 1 + k : C - k
                % Extract and sort values within the region for each color channel
                subImg = oldImg(i - k : i + k, j - k : j + k, :);
                sortedValues = sort(subImg(:), 'ascend');%??????
                
                % Compute the midpoint for each color channel
                newImg(i, j, :) = 0.5 * (sortedValues(1) + sortedValues(end));
            end
        end
    else
        %for Gray scale images
        % Grayscale image
        % Midpoint filter with sorting
        oldImg = padarray(oldImg, [k, k]);
        [R, C, ~] = size(oldImg);
        newImg = zeros(R, C);

        for i = 1 + k : R - k
            for j = 1 + k : C - k
                % Extract and sort values within the region for the grayscale image
                subImg1 = oldImg(i - k : i + k, j - k : j + k);
                sortedValues = sort(subImg1(:), 'ascend');
                
                % Compute the midpoint for the grayscale image
                newImg(i, j) = 0.5 * (sortedValues(1) + sortedValues(end));
            end
        end
    end
        hFig = figure('Visible', 'off'); % Set figure visibility to off
    subplot(1,3,1);imshow(m);title('original');
        subplot(1,3,2);imshow(n);title('noises');
            subplot(1,3,3);imshow(m);title('Fitered');



    % Clip the values to the range [0, 255]
%     newImg = uint8(max(min(newImg, 255), 0));
      saveas(hFig, 'sub_figure.png');
    n = imread('sub_figure.png');
     newImg = uint8(n);

    % Close the figure
    close(hFig);

end
