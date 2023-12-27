function [newimg] = equalization(img)
% Function definition: Takes an input image (img) and returns the equalized image (newimg).

[R, C, D] = size(img);
% Get the dimensions of the input image: R (rows), C (columns), and D (number of color channels).

if (D == 3)
    % Check if the image is a color image (3 channels).

    for y = 1:3
        % Loop through the three color channels: red (y=1), green (y=2), and blue (y=3).

        freq = zeros(1, 256);
        % Initialize an array to store the frequency of intensity values (0-255).

        for i = 1:R
            for j = 1:C
                % Nested loops to iterate through all pixels in the image.

                freq(img(i, j, y) + 1) = freq(img(i, j, y) + 1) + 1;
                % Update the frequency of the intensity value at the pixel (i,j) in channel y.
            end
        end

        total = R * C;
        % Calculate the total number of pixels in the image.

        prob = freq / total;
        % Calculate the probability of each intensity value occurring.

        cum = zeros(1, 256);
        cum(1) = prob(1);
        % Initialize an array to store the cumulative distribution function (CDF) values.
        % Set the first CDF value to the probability of the first intensity value.

        for i = 2:256
            cum(i) = cum(i - 1) + prob(i);
            % Calculate CDF values by summing the probabilities.
        end

        for i = 1:R
            for j = 1:C
                % Nested loops to iterate through all pixels in the image.

                newimg(i, j, y) = round(cum(img(i, j, y) + 1) * 255);
                % Apply histogram equalization to each pixel in channel y and store the result in newimg.
            end
        end
    end

%     GRAY
else
freq=zeros(1,256);
for i=1:R
    for j=1:C
    freq(img(i,j)+1)=freq(img(i,j)+1)+1;
    end
end
total=R*C;
prob=freq/total;
cum=zeros(1,256);
cum(1)=prob(1);
for i=2:256
    cum(i)=cum(i-1)+prob(i);
end
for i=1:R
    for j=1:C
        newimg(i,j)=round(cum(img(i,j)+1)*255);
    end
end
end
newimg=uint8(newimg);
figure,bar(newimg);
end