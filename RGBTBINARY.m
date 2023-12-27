function [binary] = RGBTBINARY(RGB)

[H W L]=size(RGB);%define size of rgb
binary=zeros(H,W);%initialize binary with zero values
gray=zeros(H,W);%initialize gray with zero values
gray=double(gray);

for i=1:H
    for j=1:W
      %rgb to gray
      gray(i,j)=RGB(i,j,1)*0.2989+RGB(i,j,2)*0.5870+RGB(i,j,3)*0.1140;
      %gray to binary
      if(gray(i,j)>127)
          binary(i,j)=1;
      else
          binary(i,j)=0;
      end
    end
end
binary=logical(binary);%casting

end

