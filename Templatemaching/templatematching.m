I = imread('text.jpg');

binary = I > 150;

template = binary(78:116, 69:93);

[l,w] = size(I);
[m,n,dummy] = size(template);
E_T = sum(sum(template.^2));

subplot(3,2,1);
imagesc(binary);
subplot(3,2,2);
imagesc(template);

threshold = 0.95;
counter = 0;
for a = 1:l
    for b = 1:w
        temp = binary(a+1:a+m, b+1:b+n);
        
        C = sum(sum(temp.*template));
        E_ToI = sum(sum(temp.^2));    
        C_hat = sqrt(E_ToI*E_T);
        Normalized_C = C/C_hat;
        
        if Normalized_C >= threshold
            counter = counter + 1;
            fprintf('find image on pixel %d, %d\n', a,b);
            subplot(3,2,counter+2);
            str = sprintf('on picxil %d, %d\n',a,b);
            imagesc(temp);
            title(str);
        end
        
        if b+n >= w
            break;
        end
    end
    if a+m >= l
        disp(counter);
        break;
    end
end