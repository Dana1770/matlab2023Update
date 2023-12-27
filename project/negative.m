function [newimg] = negative(oldimg)
newimg=im2double(oldimg);
oldimg=im2double(oldimg);
[R, C, D]=size(oldimg);
if(D==1)
        for i=1:R
            for j=1:C        
                newimg(i,j)=1-oldimg(i,j);
            end    
        end
else
    for i=1:R
            for j=1:C
                for k=1:3
                newimg(i,j,k)=1-oldimg(i,j,k);     
                end
            end
        end
end
    newimg=im2uint8(newimg);
end



