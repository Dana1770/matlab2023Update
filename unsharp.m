function resultImage=unsharp(image)
%apply guassin filter
Filteredimage=GuassianFilter(image, 1.5);
%subtract the two image
ResultSubtraction=SubtractImages(image,Filteredimage);
%add two images
result=add(image,ResultSubtraction);
result=uint8(result);
 hFig = figure('Visible', 'off'); % Set figure visibility to off
subplot(1,4,1);
imshow(image);
title('original Image');
subplot(1,4,2);
imshow(Filteredimage);
title('Filtered Image');
subplot(1,4,3);
imshow(ResultSubtraction);
title('subtracted Image');
subplot(1,4,4);
imshow(result);
title('unsharped Image');
 saveas(hFig, 'subplots_figure.png');
 n = imread('subplots_figure.png');
 resultImage = uint8(n);

 % Close the figure
 close(hFig);