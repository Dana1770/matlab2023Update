function GrayImage=SingleColorChanel(im)
    [r, c, ~] = size(im);
    outImage = zeros(r, c);

    for i = 1:r
        for j = 1:c
            outImage(i, j) =im(i, j, 1);
        end
    end
    outImage = uint8(outImage);
    %figure, imshow(im), title('Original RGB Image');
    %figure, imshow(outImage), title('Converted Gray Image using Red channel');
    for i = 1:r
        for j = 1:c
            outImage(i, j) =im(i, j, 2);
        end
    end
    outImage = uint8(outImage);
   % figure, imshow(outImage), title('Converted Gray Image using Green channel');
     for i = 1:r
        for j = 1:c
            outImage(i, j) =im(i, j, 3);
        end
    end
    outImage = uint8(outImage);
    %figure, imshow(outImage), title('Converted Gray Image using Blue channel');
    GrayImage=outImage;
end