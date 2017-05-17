clear;
I = imread('Blurred Cam.jpg');

[m,n,dummy] = size(I);
temp = ones(m,n);

mask = zeros(3,3);

w = (1/9)*ones(3);

B = imfilter(I, w);

figure;
colormap(gray);
imagesc(B);


for i = 2:m
    for j = 2:n
        mask = I(i-1:i+1,j-1:j+1);
        med = median(reshape(mask,9,1));
        temp(i,j) = med;
        if j+1 >= n
            break;
        end
    end
    if i+1 >= m
        break;
    end
    
end

figure;
colormap(gray);
imagesc(temp);


