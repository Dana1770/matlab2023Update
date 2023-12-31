function [newimage] = ContrastStretching (image,newMin,newMax)
image=double(image);
[R C D]=size(image);
newimage=zeros(R,C);
newimage=double(newimage);%scale the pixel values from 0 to 1
if(D==3)
    for i=1:3
        %calculate the minumam and max pixel values in channels 
    oldMin(i)=min(min(image(:,:,i)));
    oldMax(i)=max(max(image(:,:,i)));
    end
    
    for i=1:R
        for j=1:C
            for k=1:3
                %normalize the pixel value using the equation
                %scale the values from the ranfe[oldMAX,oldMIN] to
                %[NewMax,Newmin]
            newimage(i,j,k)=((image(i,j,k)-oldMin(k))/(oldMax(k)-oldMin(k)))*(newMax-newMin)+newMax;
            end
        end
    end
% % % % % % % % % % % % % % % % % %     
%     GRAY
else
    oldMin=min(min(image));
    oldMax=max(max(image));
    for i=1:R
        for j=1:C
            newimage(i,j)=((image(i,j)-oldMin)/(oldMax-oldMin))*(newMax-newMin)+newMax;
        end
    end
            

end
newimage=uint8(newimage);
end


