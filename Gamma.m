function [new_image] = Gamma(Old_image,gamma_value)

[H W L]=size(Old_image); %define size of old image
gamma_rgb=zeros(H,W); %initialize rgb with zero values
gamma_gray=zeros(H,W); %initialize gray with zero values
Old_image=im2double(Old_image);

for i=1:H
    for j=1:W
       
            if L==3
                gamma_rgb(i,j,1)=((Old_image(i,j,1))^gamma_value);
                gamma_rgb(i,j,2)=((Old_image(i,j,2))^gamma_value);
                gamma_rgb(i,j,3)=((Old_image(i,j,3))^gamma_value);
            else
               gamma_gray(i,j)=((Old_image(i,j))^gamma_value) ;
            end
            
        
        
    end
end
gamma_rgb=im2uint8(gamma_rgb);
if L==3
    new_image=gamma_rgb;
end
if L==1
    gamma_gray=im2uint8(gamma_gray);
    new_image=gamma_gray;
end

%figure;imshow(new_image);
end

