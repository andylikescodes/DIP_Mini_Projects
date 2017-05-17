J = imread('spot.jpg');
subplot(3,3,5);
imagesc(J);
title('Part C: original image');

subplot(3,3,6);
histogram(J);
title('Part C: histogram oi');

A = 0;
B = 30;
P = 255/(B-A);
L = -A*(255/(B-A));

[m,n] = size(J);
stretch = zeros(m,n);

for i = 1:m
    for j = 1:n
        stretch(i,j) = P*(J(i,j)) + L;
    end
end
subplot(3,3,7);
imagesc(stretch);
title('Part C: stretched image');

subplot(3,3,8);
histogram(stretch);
title('Part C: stretched image hist');

