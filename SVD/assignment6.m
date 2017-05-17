L1 = double(imread('cameraman.jpg'));

L2 = rand(256);

[U1,S1,V1] = svd(L1);
[U2,S2,V2] = svd(L2);

L1R1 = (S1(1,1)*U1(:,1)')'*V1(:,1)';
L2R1 = (S2(1,1)*U2(:,1)')'*V2(:,1)';

figure;
subplot(1,2,1);
colormap('gray');
imagesc(L1R1); 
title('L1 R1');

subplot(1,2,2);
colormap('gray');
imagesc(L2R1);
title('L1 R1');

L1R2 = (S1(1:2,1:2)*U1(:,1:2)')'*V1(:,1:2)';
L2R2 = (S2(1:2,1:2)*U2(:,1:2)')'*V2(:,1:2)';

figure;
subplot(1,2,1);
colormap('gray');
imagesc(L1R2); 
title('L1 R2');
subplot(1,2,2);
colormap('gray');
imagesc(L2R2);
title('L2 R2');

L1R4 = reconstruct(U1,S1,V1,4);
L2R4 = reconstruct(U2,S2,V2,4);


figure;
subplot(1,2,1);
colormap('gray');
imagesc(L1R4);
title('L1 R4');
subplot(1,2,2);
colormap('gray');
imagesc(L2R4);
title('L2 R4');

L1R8 = reconstruct(U1,S1,V1,8);
L2R8 = reconstruct(U2,S2,V2,8);

figure;
subplot(1,2,1);
colormap('gray');
imagesc(L1R8);
title('L1 R8');
subplot(1,2,2);
colormap('gray');
imagesc(L2R8);
title('L1 R8');


L1R16 = reconstruct(U1,S1,V1,16);
L2R16 = reconstruct(U2,S2,V2,16);

figure;
subplot(1,2,1);
colormap('gray');
imagesc(L1R16);
title('L1 R16');
subplot(1,2,2);
colormap('gray');
imagesc(L2R16);
title('L2 R16');

L1R32 = reconstruct(U1,S1,V1,32);
L2R32 = reconstruct(U2,S2,V2,32);

figure;
subplot(1,2,1);
colormap('gray');
imagesc(L1R32);
title('L1 R32');
subplot(1,2,2);
colormap('gray');
imagesc(L2R32);
title('L2 R32');

L1R64 = reconstruct(U1,S1,V1,64);
L2R64 = reconstruct(U2,S2,V2,64);

figure;
subplot(1,2,1);
colormap('gray');
imagesc(L1R64);
title('L1 R64');
subplot(1,2,2);
colormap('gray');
imagesc(L2R64);
title('L2 R64');

L1R128 = reconstruct(U1,S1,V1,128);
L2R128 = reconstruct(U2,S2,V2,128);

figure;
subplot(1,2,1);
colormap('gray');
imagesc(L1R128);
title('L1 R128');
subplot(1,2,2);
colormap('gray');
imagesc(L2R128);
title('L2 R128');

figure;
x=1:256;
subplot(1,2,1);
plot(x,sum(S1));
title('Decay S for L1');
subplot(1,2,2);
plot(x,sum(S2));
title('Decay S for L2');

L1ErelL = calerror(L1, L1R1);
L1Erel2 = calerror(L1, L1R2);
L1Erel4 = calerror(L1, L1R4);
L1Erel8 = calerror(L1, L1R8);
L1Erel16 = calerror(L1, L1R16);
L1Erel32 = calerror(L1, L1R32);
L1Erel64 = calerror(L1, L1R64);
L1Erel128 = calerror(L1, L1R128);

L2Erel1 = calerror(L2, L2R1);
L2Erel2 = calerror(L2, L2R2);
L2Erel4 = calerror(L2, L2R4);
L2Erel8 = calerror(L2, L2R8);
L2Erel16 = calerror(L2, L2R16);
L2Erel32 = calerror(L2, L2R32);
L2Erel64 = calerror(L2, L2R64);
L2Erel128 = calerror(L2, L2R128);


