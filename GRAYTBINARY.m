function [binary] = GRAYTBINARY(GRAY,threshold)
[H W]=size(GRAY);%define size of gray
binary=zeros(H,W);
for i=1:H
    for j=1:W
        if (GRAY(i,j)>threshold)
            binary(i,j)=1;
        else
             binary(i,j)=0;
        end       
    end
end
binary=logical(binary);
end

