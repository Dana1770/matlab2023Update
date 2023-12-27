function [new_image] = negative(Old_image)

[H W L]=size(Old_image); %define size of old image
negative_rgb=zeros(H,W); %initialize rgb with zero values
negative_gray=zeros(H,W); %initialize gray with zero values

for i=1:H
    for j=1:W
       
            if L==3
                negative_rgb(i,j,1)=255-(Old_image(i,j,1));
                negative_rgb(i,j,2)=255-(Old_image(i,j,2));
                negative_rgb(i,j,3)=255-(Old_image(i,j,3));
            elseif L==1
                 if islogical(Old_image)
                    negative_gray(i,j) =~(Old_image(i,j));
                else
               negative_gray(i,j)=255-(Old_image(i,j));
                 end
            end
    end
end
% negative_rgb=im2uint8(negative_rgb);
if L==3
    new_image=negative_rgb;
end
if L==1
%     negative_gray=im2uint8(negative_gray);
    new_image=negative_gray;
end

    new_image = cast(new_image, class(Old_image));



end

