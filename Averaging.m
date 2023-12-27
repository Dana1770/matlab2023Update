function GrayImage=Averaging(im)
    [r, c, ~] = size(im);
    outImage = zeros(r, c);

    for i = 1:r
        for j = 1:c
            outImage(i, j) =(im(i, j, 1) + im(i, j, 2) + im(i, j, 3))/3;
        end
    end

    outImage = uint8(outImage);
    %figure, imshow(im), title('Original RGB Image');
    %figure, imshow(outImage), title('Converted Gray Image');
    GrayImage=outImage;
end