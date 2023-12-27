function [newImage] = BrightnessAndDarkness(image,offest,option)
[R C D]=size(image);
% * + for brightness
% - / for darkness
if(D==3)     
    if(option=='+')
        for i=1:R      
            for j=1:C
                for k=1:3
                newImage(i,j,k)=image(i,j,k)+offest;
                end
            end
        end
    elseif(option=='-')
        for i=1:R
            for j=1:C
                for k=1:3
                newImage(i,j,k)=image(i,j,k)-offest;
                end
            end
        end
    elseif(option=='*')
        for i=1:R
            for j=1:C
                for k=1:3
                newImage(i,j,k)=image(i,j,k)*offest;
                end
            end
        end
    else
        for i=1:R
            for j=1:C
                for k=1:3
                newImage(i,j,k)=image(i,j,k)/offest;
                end
            end
        end
    end
% % % % % % % % % % % % % % % % % % % % % % % %     
%     GRAY
else
    if(option=='+')
        for i=1:R
            for j=1:C
                newImage(i,j)=image(i,j)+offest;
            end
        end
    elseif(option=='-')
        for i=1:R
            for j=1:C
                newImage(i,j)=image(i,j)-offest
            end
        end
    elseif(option=='*')
        for i=1:R
            for j=1:C
                newImage(i,j)=image(i,j)*offest;
            end
        end
    else
        for i=1:R
            for j=1:C
                newImage(i,j)=image(i,j)/offest;
            end
        end
    end
end
        
    
end

