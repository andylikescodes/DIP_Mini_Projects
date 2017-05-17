clear; clc;
%1 30x30 constant image
I_3030 = zeros(30,30);
I_3030 = I_3030+50;


hello1 = abs(fftshift(fft2(I_3030)));
mesh(hello1)

%2 5-24 * 13-19

I_box = ones(30,30);
for i = 4:23
    for j = 12:16
        I_box(i,j)=0;
    end
end


% hello2 = abs(fftshift(fft2(I_box)));
% mesh(hello2)
%3 cosine image: u=10, v=7, amplitud=5

N = 30;
I = zeros(N,N);
u = 10;
v = 7;

for i = 1:N
    for j = 1:N
    I(i,j) = 5*cos(2*pi/30*(u*i+v*j));
    
    end
end
% subplot(3,3,3);
% hello3 = abs(fftshift(fft2(I)));
% mesh(hello3)

% colormap(gray);
% imagesc(I);
