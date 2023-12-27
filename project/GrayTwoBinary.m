function [binary] = GrayTwoBinary(gray,threshold)
[R C]=size(gray);
binary=zeros(R,C);
for i=1:R
    for j=1:C
        if(gray(i,j)>threshold)
            binary(i,j)=1;
        end
    end
end
end
