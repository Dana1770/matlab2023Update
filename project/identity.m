function [newimg] = identity(oldimg)
newimg=im2double(oldimg);
oldimg=im2double(oldimg);
[R, C, D]=size(oldimg);
if(D==3)
    for i=1:R
        for j=1:C
            for k=1:3
            newimg(i,j,k)=(oldimg(i,j,k));
            end
        end
    end
%     GRAY
else
    for i=1:R
        for j=1:C
            newimg(i,j)=(oldimg(i,j));
        end
    end
    newimg=im2uint8(newimg);
end

