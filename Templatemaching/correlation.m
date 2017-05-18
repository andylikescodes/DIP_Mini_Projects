I_original = imread('objects.jpg');

I = rgb2gray(I_original);

%(109,94), (164,94), (164,145),(109,145)

template = I(99:141,119:160);

[m,n] = size(I);
[l,w] = size(template);
points = [];

cc = normxcorr2(template,I);

colormap(gray);
imagesc(cc);
hold on;

[cc_x, cc_y] = find(abs(cc)>0.7);

plot(cc_y,cc_x, 'r+','MarkerSize', 10);

