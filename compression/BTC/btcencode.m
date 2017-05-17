function [mean, std, codec] = btcencode(block) 
[m,n] = size(block);
mean = sum(sum(block))/(m*n);
std = sqrt(sum(sum((block-mean).^2))/(m*n));

codec = block >= mean;

