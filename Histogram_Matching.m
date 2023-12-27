
function New_im = Histogram_Matching(im1, im2)
    % Convert images to double
    im1 = double(im1);
    im2 = double(im2);
    
    [r, c, ch] = size(im1); % Get size of image one
    [r2, c2, ch2] = size(im2); % Get size of image two
    
    New_im = zeros(r, c, ch); % Initialize new image with zeros
    matching = zeros(256, 1);
    
    % Perform histogram equalization
    eq1 = equalization(im1);
    eq2 = equalization(im2);
    
    for i = 1:256
        diff = abs(eq1(i) - eq2(i)); % Calculate difference of intensity values
        %between the two images 
        %find the closest intensity values of im1 for im2
        for j = i+1:256
            if diff > abs(eq1(i) - eq2(j))
                diff = abs(eq1(i) - eq2(j));
            elseif diff < abs(eq1(i) - eq2(j))
                break;
            end
        end
        
        matching(i) = diff; % Store the difference in matching array
    end
    
    for k = 1:ch
        for i = 1:r
            for j = 1:c
                %replace intensity val in im1 with matching vals
                New_im(i, j, k) = matching(round(im1(i, j, k)) + 1); % Perform histogram matching
            end
        end
    end
    
    New_im = uint8(New_im); % Convert new image to uint8
    
    % Display original images and histogram-matched image
        hFig = figure('Visible', 'off'); % Set figure visibility to off

    subplot(1, 3, 1);
    imshow(uint8(im1));
    title('Original Image 1');
    
    subplot(1, 3, 2);
    imshow(uint8(im2));
    title('Original Image 2');
    
    subplot(1, 3, 3);
    imshow(New_im);
    title('Histogram Matching');
    
    % Save the figure
    saveas(gcf, 'histogram_matching.png');
    
    % Read the saved image and assign it to New_im
    New_im = imread('histogram_matching.png');
    
    % Close the figure
    close(gcf);
end