function resultImages = addAndSubtractImages(image1, image2)
    % Convert the input images to double precision for calculations
    image1 = double(image1);
    image2 = double(image2);

    % Check if the images have the same size
    [rows1, columns1, channels1] = size(image1);
    [rows2, columns2, channels2] = size(image2);

    if ~isequal([rows1, columns1, channels1], [rows2, columns2, channels2])
        disp('A resizing process is done');
        if any([rows1, columns1, channels1] < [rows2, columns2, channels2])
            image1 = RM_1_order(image1, round(rows2/rows1), round(columns2/columns1));
            [rows1, columns1, channels1] = size(image1);
        else
            image2 = RM_1_order(image2, round(rows1/rows2), round(columns1/columns2));
            [rows2, columns2, channels2] = size(image2);
        end
    end

    % Initialize matrices for sum and difference
    sumImage = zeros(rows1, columns1, channels1);
    differenceImage = zeros(rows1, columns1, channels1);

    % Perform addition and subtraction
    for i = 1:rows1
        for j = 1:columns1
            for k = 1:channels1
                if i <= rows2 && j <= columns2 && k <= channels2
                    sumImage(i, j, k) = image1(i, j, k) + image2(i, j, k);
                    differenceImage(i, j, k) = abs(image1(i, j, k) - image2(i, j, k));

                    % Clip values to be in the [0, 255] range
                    sumImage(i, j, k) = max(0, min(255, sumImage(i, j, k)));
                    differenceImage(i, j, k) = max(0, min(255, differenceImage(i, j, k)));
                end
            end
        end
    end

    % Convert the result images to uint8 for display
    sumImage = uint8(sumImage);
    differenceImage = uint8(differenceImage);

    % Display the input and result images
%     figure;
% 
%     subplot(1, 3, 1);
%     imshow(uint8(image1));
%     title('Image 1');
% 
%     subplot(1, 3, 2);
%     imshow(uint8(image2));
%     title('Image 2');
% 
%     subplot(1, 3, 3);
%     imshow(sumImage);
%     title('Sum of Images');
% 
%     figure;
%     subplot(1, 3, 1);
%     imshow(uint8(image1));
%     title('Image 1');
%     subplot(1, 3, 2);
%     imshow(uint8(image2));
%     title('Image 2');
% 
%     subplot(1, 3, 3);
%     imshow(differenceImage);
%     title('Difference of Images');
% 
%     drawHistogram(image1, 'Image 1');
%     drawHistogram(image2, 'Image 2');
%     drawHistogram(sumImage, 'Sum Image');
%     drawHistogram(differenceImage, 'Difference Image');

    % Store the result images in a cell array
    resultImages = {sumImage, differenceImage};
end