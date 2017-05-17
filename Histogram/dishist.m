function AOD = dishist(I)
% this function is to plot the histogram of a graph I
% Part A

y = zeros(1,256);
x = 1:256;

for i=1:256
    y(i) = sum(sum((I+1) == i));
end

[m,n] = size(I);
temp = 0;
for i = 1:256
    temp = temp + y(i)*(i-1);
end
AOD = temp/(m*n);

str = sprintf('Part A, AOD = %f',AOD);

plot(x,y);
title(str);