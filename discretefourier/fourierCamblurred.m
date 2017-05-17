I = imread('Camblurred.jpg');
I_fft2 = fftshift(fft2(I));
I_fft2_scaled = log(1+abs(I_fft2));

colormap(gray);
imagesc(I_fft2_scaled);
