function [gray] =RgbTwoGray(Rgb,option)
[R C D]=size(Rgb);
double gray;
gray=zeros(R,C);
for i=1:R
    for j=1:C
        if(option==1)
            gray(i,j)=(Rgb(i,j,1)+Rgb(i,j,2)+Rgb(i,j,3))/3;
        elseif(option==2)
             gray(i,j)=Rgb(i,j,1)*.5+Rgb(i,j,2)*.3+Rgb(i,j,3)*.2;
        elseif(option==3)
             gray(i,j)=Rgb(i,j,1);   
         elseif(option==4)
             gray(i,j)=Rgb(i,j,2);
        elseif(option==5)
              gray(i,j)=Rgb(i,j,3);
            end
        
    end
end
gray=uint8(gray);
end


