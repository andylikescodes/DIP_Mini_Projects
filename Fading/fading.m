start = double(imread('mammogram.jpg'));
finish = double(imread('Cat.jpg'));

interimage = 4;
subplot(3,2,1);
colormap(gray);
imagesc(start);

stepsize = (finish-start)/(interimage+1);


for i=1:interimage+1
    start = start + stepsize;
    colormap(gray);
    subplot(3,2,i+1);
    imagesc(start);
    pause(0.5);
    
end




