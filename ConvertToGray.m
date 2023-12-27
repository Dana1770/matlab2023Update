function GrayImage=ConvertToGray(im)
%lumminace code
    [r, c, ~] = size(im);
    outImage = zeros(r, c);
       % figure, imshow(im), title('Original RGB Image');


    for i = 1:r
        for j = 1:c
            outImage(i, j) = 0.3 * im(i, j, 1) + 0.59 * im(i, j, 2) + 0.11 * im(i, j, 3);
        end
    end

    outImage = uint8(outImage);
    %figure, imshow(im), title('Original RGB Image');
    %figure, imshow(outImage), title('Converted Gray Image');
       % drawHistogram(outImage, 'Result Image');

    GrayImage=outImage;
    
end