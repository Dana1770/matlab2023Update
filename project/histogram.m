function [] = histogram(image)
[R C D]=size(image);
if(D==3)
    red=zeros(1,256);
    green=zeros(1,256);
    blue=zeros(1,256);
    for i=1:R
        for j=1:C
           red(image(i,j,1)+1)= red(image(i,j,1)+1)+1; 
           green(image(i,j,2)+1)=green(image(i,j,2)+1)+1;
          blue(image(i,j,3)+1)= blue(image(i,j,3)+1)+1;
        end
    end
   figure,bar(red ,'r', 'EdgeColor', 'none')
    figure,bar(green,'g', 'EdgeColor', 'none')
    figure,bar(blue ,'b', 'EdgeColor', 'none')
else
    newimage=zeros(R,C);
    for i=1:R
        for j=1:C
            newimage(image(i,j)+1)= newimage(image(i,j)+1)+1;
        end
    end
   figure,bar(newimage)
end
end


