%%Huffman coding implementation
%Sample image cameraman
I = imread('cameraman.jpg');

subplot(1,2,1);
colormap(gray);
imagesc(I);
title('original image');

%initialize the Huffman object
huffman = Huffman(I);

%example huffman codes for intensity 20, 50, 100, 200
codec = huffman.codec;
disp('huffman code for intensity 20 is: ');
disp(codec(20));
disp('huffman code for intensity 50 is: ');
disp(codec(50));
disp('huffman code for intensity 100 is: ');
disp(codec(100));
disp('huffman code for intensity 200 is: ');
disp(codec(200));


%get the huffman code from the huffman object:
code = huffman.codemap;

d_I = huffman.decode(code);

subplot(1,2,2);
colormap(gray);
imagesc(d_I);
title('decoded image');

