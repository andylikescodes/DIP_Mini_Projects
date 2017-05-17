function output = btcdecode(block, mean, std)

[m,n] = size(block);

Q_inx = find(block==1);
P_inx = find(block==0);

Q = length(Q_inx);
P = length(P_inx);

A = sqrt(Q/P);

output = zeros(m,n);

output(Q_inx) = mean + std/A;
output(P_inx) = mean - std*A;
