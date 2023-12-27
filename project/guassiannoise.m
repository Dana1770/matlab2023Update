function [newimg] = guassiannoise(oldimg,mean,segma)
[R C L]=size(oldimg);
if(L==3)
    for i=1:255
       number_of_pixel=round(((exp(-((i-segma)^2/(2*mean*mean)))/sqrt(2*3.14*mean*mean)))*R*C);
       for j=1:number_of_pixel
           row=ceil(rand(1,1)*R);
           column=ceil(rand(1,1)*C);
           for k=1:3
           newimg(row,column,k)=oldimg(row,column,k)+i;
           end
       end
    end
    for i=1:3
        mn=min(min(newimg(:,:,i)));
        mx=max(max(newimg(:,:,i)));
        newimg(:,:,i)=((newimg(:,:,i)-mn)/(mx-mn))*255;
    end
        
%     GRAY
else
    for i=1:255
       number_of_pixel=round(((exp(-((i-segma)^2/(2*mean*mean)))/sqrt(2*3.14*mean*mean)))*R*C);
       for j=1:number_of_pixel
           row=ceil(rand(1,1)*R);
           column=ceil(rand(1,1)*C);
           newimg(row,column)=oldimg(row,column)+i;
       end
    end
end
%     contrust streching
 newimg(:,:,i)=((newimg(:,:,i)-mn)/(mx-mn))*255;
    
end

