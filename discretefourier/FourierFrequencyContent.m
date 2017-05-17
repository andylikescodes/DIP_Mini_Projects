t=0:.001:.6;
x=sin(2*pi*100*t)+sin(2*pi*130*t);
y=x+2*randn(size(t));
Y=fft(y,512);
Pyy=Y.*conj(Y)/512;
f=1000*(0:256)/512;


subplot(3,1,1),plot(x);
axis tight
subplot(3,1,2),plot(y);
axis tight
%subplot(3,1,3),plot(Pyy(1:512));
subplot(3,1,3),plot(f,Pyy(1:257));

