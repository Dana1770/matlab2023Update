function [histR, histG, histB] = Histogram(img,handles)
    histR = zeros(256, 1);  % Red channel histogram
    histG = zeros(256, 1);  % Green channel histogram
    histB = zeros(256, 1);  % Blue channel histogram

    [H, W, L] = size(img);  % Define the size of the image

    for i = 1:H
        for j = 1:W
            if L == 3
                histR(img(i, j, 1) + 1) = histR(img(i, j, 1) + 1) + 1;
                histG(img(i, j, 2) + 1) = histG(img(i, j, 2) + 1) + 1;
                histB(img(i, j, 3) + 1) = histB(img(i, j, 3) + 1) + 1;
            else
                histR(img(i, j) + 1) = histR(img(i, j) + 1) + 1;
            end
        end
    end

    % Generate bin edges for the histograms
    edges = 0:255;

    % Display histograms in a single figure
    bar(edges, histR, 'r', 'EdgeColor', 'none');
    hold on;
    bar(edges, histG, 'g', 'EdgeColor', 'none');
    bar(edges, histB, 'b', 'EdgeColor', 'none');
%     title('RGB Channel Histograms');
    xlabel('Pixel Value');
    ylabel('Frequency');
    legend('Red', 'Green', 'Blue');
    hold(handles,'off');
end
