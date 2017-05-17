clown = imread('clown.jpg');
fft2_clown = fftshift(fft2(clown));
fft_clown =log(1+abs(fft2_clown));
colormap(gray);
imagesc(fft_clown);

%(19,85), (25,85), (25,95), (19,95)
%()

%(42,51), (46,51), (46,55), (42,55)
%(83,75), (89,75), (89,80), (84,80)
% [m,n]=size(fft2_clown);
% 
% fft2_clown(85:95,19:25) = 0;
% fft2_clown((m-95):(m-85), (n-25):(n-19)) = 0;
% fft2_clown(51:55, 42:46) = 0;
% fft2_clown(75:80,83:89) = 0;
% 
% fft_clown(85:95,19:25) = 0;
% fft_clown((m-95):(m-85), (n-25):(n-19)) = 0;
% fft_clown(51:55, 42:46) = 0;
% fft_clown(75:80,83:89) = 0;
% 
% ifft_clown = abs(ifft2(fft2_clown));
% imagesc(ifft_clown);
% imagesc(fft_clown);

