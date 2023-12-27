% weightmask
function [newImg] = weightfilter(oldImg,n)
oldImg=double(oldImg);
[R ,C, L]=size(oldImg);
h=R;
w=C;
filter=(1/16)*[1 2 1;2 4 2;1 2 1];
k=1;
if(L==3)
    if(n==1)
        oldImg=padarray(oldImg,[k,k]);
        [R ,C, L]=size(oldImg);
        newImg=zeros(R, C);
    for i=1+k:R-k
        for j=1+k:C-k
            for y=1:3
            subImg(:,:,y)=(oldImg(i-k:i+k,j-k:j+k,y));
            end
            result=zeros(3);
            for f=1:3
                for g=1:3
                    for y=1:3
                    result(y)=subImg(f,g,y)*filter(f,g)+result(y);
                    end
                end
            end
            for y=1:3
            newImg(i,j,y)=result(y);
            end
            
        end
    end 
    elseif(n==2)
        [R ,C, L]=size(oldImg);
        newImg=zeros(R, C);
        for i=1+k:R-k
            for j=1+k:C-k
                for y=1:3
             subImg(:,:,y)=(oldImg(i-k:i+k,j-k:j+k,y));
                end
            result1=zeros(3);
            for f=1:3
                for g=1:3
                    for y=1:3
                    result(y)=subImg(f,g,y)*filter(f,g)+result(y);
                    end
                end
            end
            for y=1:3
            newImg(i,j,y)=result(y);
            end
 
            end
        end 
        else
        filterImg=zeros(R+2*k,C+2*k);
        [R C L]=size(filterImg);
        for i=1:k
            for y=1:3
            filterImg(i,k+1:C-k,y)=oldImg(1,:,y);
            end
        end
     for i=1:k
         for y=1:3
            filterImg(R-k+i,k+1:C-k,y)=oldImg(end,:,y);
         end
     end
     for i=1:k
         for y=1:3
            filterImg(1:R,i,y)=filterImg(:,1,y);
         end
     end
         for i=1:k
             for y=1:3
            filterImg(1:R,C-k+i,y)=filterImg(:,end,y);
             end
         end
         for y=1:3
         filterImg(1+k:R-k,1+k:C-k,y)=oldImg(1:h,1:w,y);
         end
        for i=1+k:R-k
            for j=1+k:C-k
                for y=1:3
              subImg(:,:,y)=(filterImg(i-k:i+k,j-k:j+k,y));
                end
            result1=zeros(3);
            for f=1:3
                for g=1:3
                    for y=1:3
                    result(y)=subImg(f,g,y)*filter(f,g)+result(y);
                    end
                end
            end
            for y=1:3
            newImg(i,j,y)=result(y);
            end
            end
        end 
    end
%     GRAY
else
     if(n==1)
        oldImg=padarray(oldImg,[k,k]);
        [R ,C, L]=size(oldImg);
        newImg=zeros(R, C);
    for i=1+k:R-k
        for j=1+k:C-k
             subImg=(oldImg(i-k:i+k,j-k:j+k));
             result1=0;
            for f=1:3
                for g=1:3
                    result1=subImg(f,g)*filter(f,g)+result1;
                end
            end
            newImg(i,j)=result1;
            
        end
    end
    elseif(n==2)
        [R ,C, L]=size(oldImg);
        newImg=zeros(R, C);
        for i=1+k:R-k
            for j=1+k:C-k
             subImg=(oldImg(i-k:i+k,j-k:j+k));
              result1=0;
            for f=1:3
                for g=1:3
                    result1=subImg(f,g)*filter(f,g)+result1;
                end
            end
            newImg(i,j)=result1;
            end
        end 
        else
        filterImg=zeros(R+2*k,C+2*k);
        [R C L]=size(filterImg);
        for i=1:k
            filterImg(i,k+1:C-k)=oldImg(1,:);
        end
     for i=1:k
            filterImg(R-k+i,k+1:C-k)=oldImg(end,:);
     end
     for i=1:k
            filterImg(1:R,i)=filterImg(:,1);

     end
         for i=1:k
            filterImg(1:R,C-k+i)=filterImg(:,end);
         end
         filterImg(1+k:R-k,1+k:C-k)=oldImg(1:h,1:w);
        for i=1+k:R-k
            for j=1+k:C-k
             subImg=(filterImg(i-k:i+k,j-k:j+k));
              result1=0;
            for f=1:3
                for g=1:3
                    result1=subImg(f,g)*filter(f,g)+result1;
                end
            end
            newImg(i,j)=result1;
            end
        end 
    end
end
 newImg=newImg(1+k:R-k,1+k:C-k);
    newImg=uint8(newImg);
end


