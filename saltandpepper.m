function [newimg] = saltandpepper(oldimg,ps,pp)
[R C L]=size(oldimg);
number_of_salt=round(ps*R*C);
number_of_pepper=round(pp*R*C);
newimg=oldimg;
if(L==3)
    for i=1:number_of_salt
            row=ceil(rand(1,1)*R);
            column=ceil(rand(1,1)*C);
            for y=1:3
            newimg(row,column,y)=255;
            end
    end
     for i=1:number_of_pepper
            row=ceil(rand(1,1)*R);
            column=ceil(rand(1,1)*C);
            for y=1:3
            newimg(row,column,y)=0;
            end
     end
    
%     GRAY
else
    
    for i=1:number_of_salt
            row=ceil(rand(1,1)*R);
            column=ceil(rand(1,1)*C);
            newimg(row,column)=255;
    end
     for i=1:number_of_pepper
            row=ceil(rand(1,1)*R);
            column=ceil(rand(1,1)*C);
            newimg(row,column)=0;
     end
end


end

