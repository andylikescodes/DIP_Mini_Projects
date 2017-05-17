N=input('enter N   ');
t=-2*pi:0.0001:2*pi;
W=0;
for i=1:2:N
    W=W+((4/(i*pi)).*sin(t*i));
    drawnow
    pause(.3)
    plot(t,W)
    axis tight
end

