 function [gray] = RGBTGRAY(RGB,option)
[H W L]=size(RGB); %define size of rgb
gray=zeros(H,W); %initialize gray with zero values
gray=double(gray);
for i=1:H %for in row
    for j=1:W %for in column
        if option==1
        gray(i,j)=(RGB(i,j,1)+RGB(i,j,2)+RGB(i,j,3))/3;
        elseif option==2
        gray(i,j)=RGB(i,j,1)*0.3+RGB(i,j,2)*0.2+RGB(i,j,3)*0.5;
        elseif option==3
        gray(i,j)=RGB(i,j,1);
        elseif option==4
        gray(i,j)=RGB(i,j,2);
        elseif option==5
        gray(i,j)=RGB(i,j,3);
        else
            %print
            disp('enter option between 1 and 5');
            return;
        end
        
        
    end
end
% casting
gray=uint8(gray);

end

