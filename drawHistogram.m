function result = drawHistogram(image)
    % Convert the image to double precision for calculations
    image = double(image);%scaling the value from 0 to 1
    % Get the size of the image
    %accurate calculation of the histogram
    %
    [rows, columns, channels] = size(image);
    if channels == 1
        % Grayscale image or binary
        histogram = zeros(256, 1);
        %it is an array that count the occurance of pixel in image  that
        %contain 256 rows and 1 coloum ,intialized with
        %zero valued only used to count the pixel intensites.

        % Calculate the histogram
        for r = 1:rows %1 :6
            for c = 1:columns %1:6
                pixelValue = round(image(r, c));%val=10
                histogram(pixelValue + 1) = histogram(pixelValue + 1) + 1;
            end
        end
    elseif channels == 3
        % Color image (separate histograms for each channel)
        histogramR = zeros(256, 1);
        histogramG = zeros(256, 1);
        histogramB = zeros(256, 1);

        % Calculate the histograms
        for r = 1:rows%1 :6
            for c = 1:columns%1:6
                pixelValueR = round(image(r, c, 1));
                pixelValueG = round(image(r, c, 2));
                pixelValueB = round(image(r, c, 3));

                histogramR(pixelValueR + 1) = histogramR(pixelValueR + 1) + 1;
                histogramG(pixelValueG + 1) = histogramG(pixelValueG + 1) + 1;
                histogramB(pixelValueB + 1) = histogramB(pixelValueB + 1) + 1;
            end
        end
    else
        error('Unsupported number of color channels');
    end

    % Normalize the histograms
    if channels == 1
        histogram = histogram / (rows * columns);%6/(4*4)=6/16=3/4=0.75
    else
        histogramR = histogramR / (rows * columns);
        %calculate frequency of each pixel by deviding the intialized array by the total no of pixels
        histogramG = histogramG / (rows * columns);
        histogramB = histogramB / (rows * columns);
    end

    % Plot the histograms
    hFig = figure('Visible', 'off'); % Set figure visibility to off
  % figure; 
   if channels == 1
        subplot(1, 1, 1);
        bar(histogram);
        title('Grayscale Histogram');
        xlabel('Pixel Value');
        ylabel('Frequency');
    else
        subplot(3, 1, 1);
        bar(histogramR, 'r');
        title('Red Channel Histogram');
        xlabel('Pixel Value');
        ylabel('Frequency');
        subplot(3, 1, 2);
        bar(histogramG, 'g');
        title('Green Channel Histogram');
        xlabel('Pixel Value');
        ylabel('Frequency');

        subplot(3, 1, 3);
        bar(histogramB, 'b');
        title('Blue Channel Histogram');
        xlabel('Pixel Value');
        ylabel('Frequency');
    end

    % Save the figure directly to the result variable
    saveas(hFig, 'subplots_figure.png');
    n = imread('subplots_figure.png');
    result = uint8(n);

    % Close the figure
    close(hFig);
end
