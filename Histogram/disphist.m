function [X, edge] = disphist(I, nbins)
% this function is to plot the histogram of a graph I

[x, edge] = discretize((0:255), nbins);

y = zeros(1,256);

for i=1:256
    y(i) = sum(sum((I+1) == i));
end

disp(sum(y));

Y = [x;y];

[m,n]=size(Y);


X = zeros(1,nbins);
temp = 0;
previous_index = Y(1,1);
for i = 1:n
    current_value = Y(2,i);
    current_index = Y(1,i);
    if current_index == previous_index
        temp = temp + current_value;
    else
        X(previous_index) = temp;
        temp = current_value;
    end
    previous_index = current_index;
end



