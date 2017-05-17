clear

A=imread('text.jpg');

A=double(A);
A=255-A;
[m,n]=size(A);

colormap(gray)

b=A(89:118,357:382);

C=imfilter(A,b,'replicate');

thresh=.9*max(C(:));
D=(C>thresh);

subplot(2,2,1), imagesc(A)
subplot(2,2,2), imagesc(b)
subplot(2,2,3), imagesc(C)
subplot(2,2,4), imagesc(D)


