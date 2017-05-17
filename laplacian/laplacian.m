I = imread('Moon.jpg');

mask = [1 1 1; 1 -8 1; 1 1 1];

colormap(gray);
subplot(1,3,1);
imagesc(I);

subplot(1,3,2);
lap = imfilter(I,mask);
imagesc(lap);

lapI = I - lap;
subplot(1,3,3);
imagesc(lapI);

