N = 16;
I = zeros(N,N);
u = 10;
v = 10;

for i = 1:N
    for j = 1:N
    I(i,j) = sin(2*pi/16*(u*i+v*j));
    
    end
end

colormap(gray);
imagesc(I);
