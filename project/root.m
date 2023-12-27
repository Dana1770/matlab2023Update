function [newimg] = root(oldimg,c)
newimg=im2double(oldimg);
oldimg=im2double(oldimg);
[R, C, D]=size(oldimg);
if(D==3)
    for i=1:R
        for j=1:C
            for y=1:3
            newimg(i,j,y)=(oldimg(i,j,y)^(1/c));
            end
        end
    end
else
    for i=1:R
        for j=1:C
            newimg(i,j)=(oldimg(i,j)^(1/c));
        end
    end
    newimg=im2uint8(newimg);
end

