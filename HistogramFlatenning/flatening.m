I = imread('spot.jpg');

x = 1:256;
y = zeros(1,256);

for i=1:256
    y(i) = sum(sum((I+1) == i));
end

subplot(2,1,1);
histogram(I);

[m,n] = size(I);
total = sum(y);

j_1 = zeros(m,n);



for i = 1:256
    for j = 1:256
        frequency = 0;
        for x = 1:I(i,j)
            frequency = frequency + y(x);
        end
        j_1(i,j) = frequency/total;
    end
end

j = int16(j_1.*255+0.5);
subplot(2,1,2);
histogram(j);
figure;
colormap(gray);
imagesc(j);
