function imageFiltered = FixNoiseWithMeanFilter(oldImage, sizeMask)
%staore the image in old image in input variable 
input=oldImage;
%enter guassin noise to your image by the values 0.1,0.2
    oldImage = guassiannoise(oldImage,0.1,0.2);
%store the size of old image ,the no of rows in row and no of coloums in
%col 
    [row, col, ch] = size(oldImage);
    %specifiy the size of the filter window 
    boundary = floor(sizeMask / 2);
    %create a matrix for store the out put image with the same size of old
    %image and the matrix is zeroed 
    imageFiltered = zeros(row, col, ch);

    % Apply the mean filter using nested loops
    for i = 1:row
        for j = 1:col
            for k = 1:ch
                % Extract the local neighborhood to apply the filter in
                % them
                localRegion = oldImage(max(1, i-boundary):min(row, i+boundary), ...
                                       max(1, j-boundary):min(col, j+boundary), k);

                % Calculate the mean using nested loops
                meanValue = 0;
                count = 0;
                [localRows, localCols] = size(localRegion);
                for m = 1:localRows
                    for n = 1:localCols
                        meanValue = meanValue + localRegion(m, n);
                        count = count + 1;
                    end
                end

                % Assign the mean value to the corresponding pixel
                imageFiltered(i, j, k) = meanValue / count;
            end
        end
    end
    % Convert the result to uint8 for display
    imageFiltered = uint8(imageFiltered);

    % Display the original and filtered images
        hFig = figure('Visible', 'off'); % Set figure visibility to off

    subplot(1, 3, 1);
    imshow(input);
    title('Original Image');

    subplot(1, 3, 2);
    imshow(oldImage);
    title('noised Image');

    subplot(1, 3, 3);
    imshow(imageFiltered);
    title('Filtered Image');
      % Save the figure directly to the result variable
    saveas(hFig, 'sub_figure.png');
    n = imread('sub_figure.png');
    imageFiltered = uint8(n);

    % Close the figure
    close(hFig);

end
