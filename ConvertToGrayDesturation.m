function GrayImage=ConvertToGrayDesturation(im)
   [r, c, ~] = size(im);
    outImage = zeros(r, c);

    for i = 1:r
        for j = 1:c
            maxRGB = max([im(i,j,1), im(i,j,2), im(i,j,3)]);
            minRGB = min([im(i,j,1), im(i,j,2), im(i,j,3)]);
            outImage(i, j) = (maxRGB + minRGB) / 2;
        end
    end

    outImage = uint8(outImage);
    %figure, imshow(im), title('Original RGB Image');
    %figure, imshow(outImage), title('Converted Gray Image');
    GrayImage=outImage;
end