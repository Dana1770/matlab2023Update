% median
function [newImg] = medfilter(oldImg,s,n)
[R ,C, L]=size(oldImg);
h=R;
w=C;
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
            for y=1:3
            sorted(:,:,y)=sort(reshape(subImg(:,:,y),[1,s.*s]));
            end
            for y=1:3
            newImg(i,j,y)=median(sorted(:,:,y));
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
                for y=1:3
            sorted(:,:,y)=sort(reshape(subImg(:,:,y),[1,s.*s]));
                end
                for y=1:3
            newImg(i,j,y)=median(sorted(:,:,y));
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
                for y=1:3
             sorted(:,:,y)=sort(reshape(subImg(:,:,y),[1,s.*s]));
                end
                for y=1:3
            newImg(i,j,y)=median(sorted(:,:,y));
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
             subImg1=(oldImg(i-k:i+k,j-k:j+k));
            sorted=sort(reshape(subImg1,[1,s.*s]));
            newImg(i,j)=median(sorted);
            
        end
    end
    elseif(n==2)
        [R ,C, L]=size(oldImg);
        newImg=zeros(R, C);
        for i=1+k:R-k
            for j=1+k:C-k
             subImg1=(oldImg(i-k:i+k,j-k:j+k));
            sorted=sort(reshape(subImg1,[1,s.*s]));
            newImg(i,j,1)=median(sorted);
            end
        end
        newImg=newImg(1+k:R-k,1+k:C-k);
        newImg=uint8(newImg); 
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
             subImg1=(filter(i-k:i+k,j-k:j+k));
             sorted=sort(reshape(subImg1,[1,s.*s]));
            newImg(i,j)=median(sorted);
            end
        end 
    end
end

    newImg=uint8(newImg); 
end


