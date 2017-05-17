%%btc implementation:
%Sample block
I = magic(4);
disp('The original block is');
disp(I);

%encode:
[mean, std, code] = btcencode(I);
disp('The mean for the block is');
disp(mean);
disp('The std for the block is');
disp(std);
disp('The code for the block is');
disp(code);

%decode:
d_I = btcdecode(code, mean, std);
disp('The decode for the block is');
disp(d_I);

