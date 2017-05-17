%Part B 1)
I = imread('mammogram.jpg');

subplot(3,3,2)
colormap(gray);
imagesc(I);
title('Part B: original image')

%thresholding
binary = I > 125;

subplot(3,3,3);
colormap(gray);
imagesc(binary);
title('Part B: result 1');

%Part B 2)
[m,n] = size(binary);
contour = ones(m,n);

for i = 1:m
    if i-1 < 1
        ind_up = i;
    else
        ind_up = i-1;
    end
    
    if i+1 > m
        ind_down = i;
    else
        ind_down = i+1;
    end
    
    for j = 1:n
        center = binary(i,j);
        if j-1 < 1
            ind_left = j;
        else
            ind_left = j-1;
        end
        
        if j+1 > n
            ind_right = j;
        else
            ind_right = j+1;
        end
        
        
        if (center == 0) && (binary(ind_up,j) == 1 || binary(ind_down,j) == 1 ...
                || binary(i, ind_left) == 1 || binary(i, ind_right) == 1)
            contour(i,j)=0;
        end
    end
end

subplot(3,3,4);
colormap(gray);
imagesc(contour);
title('Part B: result 2');

