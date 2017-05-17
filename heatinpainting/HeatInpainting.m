
clear

%L=1250;R=1800;T=300;B=305;
L=206;R=323;T=273;B=355;
Tstep=5000;
dt=.1;
M_L=imread('conservation09.jpg');

w=M_L;
w(T:B,L:R,1)=0;
w(T:B,L:R,2)=0;
w(T:B,L:R,3)=0;

u=w;
u=im2double(u);


for j=L:R
   u(T,j,1)=2*u(T-1,j,1)-u(T-2,j,1); 
   u(T,j,2)=2*u(T-1,j,2)-u(T-2,j,2);
   u(T,j,3)=2*u(T-1,j,3)-u(T-2,j,3);
end

for j=L:R
   u(B,j,1)=2*u(B+1,j,1)-u(B+2,j,1); 
   u(B,j,2)=2*u(B+1,j,2)-u(B+2,j,2);
   u(B,j,3)=2*u(B+1,j,3)-u(B+2,j,3);
end

for i=T+1:B-1
    u(i,L,1)=2*u(i,L-1,1)-u(i,L-2,1);
    u(i,L,2)=2*u(i,L-1,2)-u(i,L-2,2);
    u(i,L,3)=2*u(i,L-1,3)-u(i,L-2,3);
end

for i=T+1:B-1
    u(i,R,1)=2*u(i,R+1,1)-u(i,R+2,1);
    u(i,R,2)=2*u(i,R+1,2)-u(i,R+2,2);
    u(i,R,3)=2*u(i,R+1,3)-u(i,R+2,3);
end

v(1:B-T+1,1:R-L+1,1)=u(T:B,L:R,1);
v(1:B-T+1,1:R-L+1,2)=u(T:B,L:R,2);
v(1:B-T+1,1:R-L+1,3)=u(T:B,L:R,3);

for t = 0:dt:Tstep
    for i=2:B-T
        for j=2:R-L
         v(i,j,1)=v(i,j,1)+dt*(-4*v(i,j,1)+v(i,j+1,1)+v(i+1,j,1)+v(i,j-1,1)+v(i-1,j,1));
         v(i,j,2)=v(i,j,2)+dt*(-4*v(i,j,2)+v(i,j+1,2)+v(i+1,j,2)+v(i,j-1,2)+v(i-1,j,2));
         v(i,j,3)=v(i,j,3)+dt*(-4*v(i,j,3)+v(i,j+1,3)+v(i+1,j,3)+v(i,j-1,3)+v(i-1,j,3));
        end
    end
   
end

u(T:B,L:R,1)=v(1:B-T+1,1:R-L+1,1);
u(T:B,L:R,2)=v(1:B-T+1,1:R-L+1,2);
u(T:B,L:R,3)=v(1:B-T+1,1:R-L+1,3);


subplot(1,3,1), imshow(M_L)
subplot(1,3,2), imshow(w)
subplot(1,3,3), imshow(u)


