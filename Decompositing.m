function GrayImage=Decompositing(im)
    [r, c, ~] = size(im);
    outImage = zeros(r, c);

    for i = 1:r
        for j = 1:c
            outImage(i, j) =max(im(i, j, 1) + im(i, j, 2) + im(i, j, 3));
        end
    end

    outImage = uint8(outImage);
    %figure, imshow(im), title('Original RGB Image');
    %figure, imshow(outImage), title('Converted Gray Image using max');
      for i = 1:r
        for j = 1:c
            outImage(i, j) =min(im(i, j, 1) + im(i, j, 2) + im(i, j, 3));
        end
      end

    outImage = uint8(outImage);
    %figure, imshow(outImage), title('Converted Gray Image using min');
    GrayImage=outImage;
end