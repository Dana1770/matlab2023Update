function result=RM_0_order(in,fact_r,fact_c)
%2*2  4*6
%factor of rows=2 /factor of coloums=3
[r,c,ch]=size(in);
new_r=r*fact_r;%2*2=4
new_c=c*fact_c;%2*3=6
r_ratio=r/new_r;%r_ratio=2/4=1/2=0.5
c_ratio=c/new_c;%c_ratio=2/6=1/3=0.33
out=zeros(new_r,new_c,ch);%
for k=1:ch
    for new_x=1:new_r %new_x 1:4
        %old_x=1*0.5=0.5
        old_x=new_x*r_ratio;
        old_x=floor(old_x);%old_x=0
        if(old_x==0)%1
            old_x=1;
        end
        %old_x=1
        for new_y=1:new_c%coloums new_y=1 :6
            %old_y=1*0.33=0.33
            %2
            %old_y=2*0.33=0.66
            %3
            %old_y=
            old_y=new_y*c_ratio;
            old_y=floor(old_y);%0 0
            if(old_y==0)%1 1
            old_y=1;
            end
            out(new_x,new_y,k)=in(old_x,old_y,k);
            %out(1,1)=in(1,1)
            %out(1,2)=in(1,1)
            
        end
    end
end
disp(out);
 out=uint8(out);
% figure,imshow(in),title('Original')
% figure,imshow(out),title('Resized 1')
result=out;
end