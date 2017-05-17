delta_y = [-1 0 1; -1 0 1; -1 0 1] * 1/3;

delta_x = [-1 -1 -1; 0 0 0; 1 1 1] * 1/3;
I = double(imread('cameraman.jpg'));
filtered_y = imfilter(I, delta_y);
filtered_x = imfilter(I, delta_x);

figure;
histogram(filtered_y);

new_image_sqrt = sqrt(filtered_y.^2 + filtered_x.^2)>50;
figure;
colormap(gray);
subplot(2,2,1);
imshow(filtered_y);
subplot(2,2,2);
imshow(filtered_x);
subplot(2,2,3);
imshow(new_image_sqrt);