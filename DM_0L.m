function result=DM_0L(im,fact)
[r, c, ch]=size(im);
New_r = r*fact;
New_c = c*fact;
New_im = zeros(New_r,New_c, ch);
for k=1:ch
    for i=1:r%1 2
        for j=1:c%1 2
            %newImage(1:3,1:3)
            %new_img(1:3,4:6)
            %im(1,2)
            %1=2,j=1
            %img(4:6,1:3)=im(2,1)
            %2 ,2
            %newim(4:6,4:6)
            New_im(i*fact+1-fact:i*fact,j*fact+1-fact:j*fact,k)= im(i,j,k);
            %2*2  6*6 f=3
            %1=1 j=1 
            %1*3+1=4-3=1 : 1*3=3  1*3+1-3=1 :1*3=3
            %i=2 j=2  f=3
            %2*3+1-3=4 :2*3=6 :7-3=4:2*3=6
            %i=1 j=1
            %i=1 j=2
            %i=2 j=1
            %i=2 j=2            
        end
    end
end
New_im = uint8(New_im);
% figure,imshow(im),title('Original')
% figure,imshow(New_im),title('Resized')
result=New_im;
end