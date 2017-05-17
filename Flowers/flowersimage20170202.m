%important commands:
%size(I) get the 
%colormap(gray)
%imagesc(I)
%A=magic(3)
%size(find(I==200))
%A=spiral(9)


I = imread('flowers.jpg');

%!!remember to use double on it.
I = double(I);

%get 1/4 of the matrix
A = I(1:128, 1:128);

K = I;
%get rid of the lower triangular become zero
for i=1:256
    for j=1:256
        if i>j
            I(i,j)=0;
        end
    end
end

%make the dark white and make the white dark
J(1:256,1:256) = 256;
Converted = J - I;

%make an X on 
for i=1:255
    K(i,i) = 256;
    K(i,(257-i)) = 256;
end



