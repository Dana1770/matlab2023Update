% mean
function [newImg] = meanfilter(oldImg,s,n)
oldImg=double(oldImg);
[R ,C, L]=size(oldImg);
h=R;
w=C;
meanfilter=(1/(s*s))*ones(s,s);   
k=(s-1)/2;
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
            result=zeros(1,3);
            for f=1:s
                for g=1:s
                    for y=1:3
                    result(y)=subImg(f,g,y)*meanfilter(f,g)+result(y);
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
            result=zeros(1,3);
            for f=1:s
                for g=1:s
                    for y=1:3
                    result(y)=subImg(f,g,y)*meanfilter(f,g)+result(y);
                    end
                end
            end
            for y=1:3
            newImg(i,j,y)=result(y);
            end
 
            end
        end
        else
        filter=zeros(R+2*k,C+2*k);
        [R C L]=size(filter);
        for y=1:3
         filter(1+k:R-k,1+k:C-k,y)=oldImg(1:h,1:w,y);
        end
        for i=1:k
            for y=1:3
            filter(i,k+1:C-k,y)=oldImg(1,:,y);
            end
        end
     for i=1:k
         for y=1:3
            filter(R-k+i,k+1:C-k,y)=oldImg(end,:,y);
         end
     end
     for i=1:k
         for y=1:3
            filter(1:R,i,y)=filter(:,1+k,y);
         end
     end
         for i=1:k
             for y=1:3
            filter(1:R,C-k+i,y)=filter(:,end-k,y);
             end
         end
         
        for i=1+k:R-k
            for j=1+k:C-k
                for y=1:3
              subImg(:,:,y)=(filter(i-k:i+k,j-k:j+k,y));
                end
            result1=zeros(1,3)
            for f=1:s
                for g=1:s
                    for y=1:3
                    result(y)=subImg(f,g,y)*meanfilter(f,g)+result(y);
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
            for f=1:s
                for g=1:s
                    result1=subImg(f,g)*meanfilter(f,g)+result1;
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
            for f=1:s
                for g=1:s
                    result1=subImg(f,g)*meanfilter(f,g)+result1;
                end
            end
            newImg(i,j)=result1;
            end
        end
        else
        filter=zeros(R+2*k,C+2*k);
        [R C L]=size(filter);
        for i=1:k
            filter(i,k+1:C-k)=oldImg(1,:);
        end
     for i=1:k
            filter(R-k+i,k+1:C-k)=oldImg(end,:);
     end
     for i=1:k
            filter(1:R,i)=filter(:,1);

     end
         for i=1:k
            filter(1:R,C-k+i)=filter(:,end);
         end
         filter(1+k:R-k,1+k:C-k)=oldImg(1:h,1:w);
        for i=1+k:R-k
            for j=1+k:C-k
             subImg=(filter(i-k:i+k,j-k:j+k));
              result1=0;
            for f=1:s
                for g=1:s
                    result1=subImg(f,g)*meanfilter(f,g)+result1;
                end
            end
            newImg(i,j)=result1;
            end
        end 
    end
end
    newImg=uint8(newImg);
end


