function outimage=DM_1_order(image,fact)
[r,c,ch]=size(image);
new_r=r*fact;
new_c=c*fact;
%Initialization by filling the new image by zero
outimage=zeros(new_r,new_c,ch);
for k=1:ch
    for i=1:r%i=1 :2
        for j=1:c%j=1:2
            %Initialization by filling the new image with the old one by factor
            row=fact*(i-1)+1;%row=1
            col=fact*(j-1)+1;%col=1
            outimage(row,col,k)=image(i,j,k);
            %i=1 j=1 f=3
            %row=3*(1-1)+1=1
            %col=3*(1-1)+1=1
            %outimage(1,1)=image(1,1)
            %i=1 j=2 f=3
            %row=3*0+1=1
            %col=3*1+1=4
            %i=2 j=1
            %row=3*1+1=4
            %col=3*0+1=1
            %i=2 j=2
            %row=3*1+1=4 col=3*1+1=4
        end
    end
end

for k=1:ch
    for i=1:fact:new_r      %1 4   %4   %4 
        for j=1:fact:new_c  %1 4   %1   %4 
            new_j=j+fact; %new_j=1+3=4 
            %i=1,j=4 
            %new_j=4+3=7
            %new_j=1+3=4
            %new_j=4+3=7
            if(new_j>=new_c)
                %4>6 
                %7>6
                %4>6
                %7>6
                for z=1:(fact-1) %z=1: 2 z=2
                    outimage(i,(j+z),k)=outimage(i,j,k);
                    %out(1,5)=out(1,4)
                    %out(1,6)=out(1,4)
                    %out(4,5)out(4,4)
                    
                end
            else
            first_index=outimage(i,j,k);   
            %first_index in box(length is factor) %i=1 j=1        first_index=10
            %first_index=out(4,1)=30
            last_index=outimage(i,new_j,k);  
            %lasr_index in box(length is factor) %i=1 new_j=4 last_index=40
            %last_index=out(4,4)=20
           
            max_val = max(first_index,last_index);
            %max_val=last_index
            %max_val=30
            min_val = min(first_index,last_index);
            %min_val=first_val
            %min=20
            if(first_index<=last_index)
                %10<=40 
                %30<20
                for y=1:(fact-1)%y=1 :2 %the index of the pixels between min and max values
                    p=round((( max_val - min_val)/(fact))*y + min_val);%p=40-10=30/3=10*1+10=20 
                    %p=40-10=30/3=10*2=20+10=30
                    outimage(i,(j+y),k)=p;
                    %i=1 ,j=1 y=1  out(1,2)=20 
                    %out(1,3)=30

                end
            else
                new_i=fact-1;
                %new_i=3-1=2
                for x=1:fact-1 %1 2
                    %x = 1:2 x=2
                     p=round((( max_val - min_val)/(fact))*new_i + min_val);
                     %30-20=10/3=3*2=6+20=26
                     %30-20/3=3*4=12+20=32
                    outimage(i,(j+x),k)=p;
                    %out(4,2)=26
                    %out(4,3)=32
                    new_i=new_i+2;
                    %new_i=4
                    %new_i=6
                end



            end

            
           

            end 


        end
    end
end
for k=1:ch
    for j=1:new_c %1:6 j=
        for i=1:fact:new_r %1:3:6 1 4  
        %i=4
            new_i=i+fact;
            %new_i=1+3=4
            %new_i=4+3=7
            if(new_i>=new_r)
                %4>6
                %7>6
                for z=1:(fact-1)%1 2
                    %out(5,1)=out(4,1)
                    outimage((i+z),j,k)=outimage(i,j,k);
                end
            else
                
            first_index=outimage(i,j,k);   %first_index in box(length is factor)
            %first_index=out(1,1)=10
            last_index=outimage(new_i,j,k);    %lasr_index in box(length is factor)
           %last=out(4,1)=30
            max_val = max(first_index,last_index); %max=30
            min_val = min(first_index,last_index);%min=10
            if(first_index<=last_index)%10<30
                for y=1:(fact-1)
                    %y 1 :2
                    %y=2
                    p=round((( max_val - min_val)/(fact))*y + min_val);
                    %p=30-10=20/3=7*1+10=17
                    %p=7*2=14+10=24
                    outimage((i+y),j,k)=p;
                    %out(2,1)=17
                    %out(3,1)=24

                end
            else
                new_i=fact-1;
                for x=1:fact-1
                     p=round((( max_val - min_val)/(fact))*new_i + min_val);
                    outimage((i+x),j,k)=p;
                    new_i=new_i+2;
                end



            end

            
           

            end 


        end
    end
end
outimage=uint8(outimage);
%image=uint8(image);
% subplot(2,2,1);
% figure
% imshow(image);
% title('old image');
% % subplot(2,2,2);
% figure
%  imshow(outimage);
%  title('new image');

end

