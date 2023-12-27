function [newimg]=equalization(img)
[R ,C ,D]=size(img);
if(D==3)%for RGB 
    for y=1:3%iterate in each channel
        freq=zeros(1,256);
        %calculate histogram
        for i=1:R
            for j=1:C
            freq(img(i,j,y)+1)=freq(img(i,j,y)+1)+1;
            end
        end
        total=R*C;%total no of pixels
        prob=freq/total;
        cum=zeros(1,256);%the compultive probability for each intensity value
        cum(1)=prob(1);%set the first  element of cum set to first intensity val
        %sum over the histogram
        for i=2:256%iterates in the rest intensity values
            cum(i)=cum(i-1)+prob(i);%comute the comulitive probabilty for the current
            %intensity of pixel and add to the propability of the previous
        end
        %round the result
        for i=1:R
            for j=1:C
                %replace the color of the color of pixel by the new one and
                %scaling from 0 to 255
                newimg(i,j,y)=round(cum(img(i,j,y)+1)*255);
            end
        end
    end
%     GRAY
else
freq=zeros(1,256);
for i=1:R
    for j=1:C
    freq(img(i,j)+1)=freq(img(i,j)+1)+1;
    end
end
total=R*C;
prob=freq/total;
cum=zeros(1,256);
cum(1)=prob(1);
for i=2:256
    cum(i)=cum(i-1)+prob(i);
end
for i=1:R
    for j=1:C
        newimg(i,j)=round(cum(img(i,j)+1)*255);
    end
end
end
newimg=uint8(newimg);
end