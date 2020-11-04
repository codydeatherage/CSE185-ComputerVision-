img = imread('01.jpg');
img2 = zeros(size(img, 1), size(img, 2), 3, 'uint8');
for i = 1: size(img, 2)
    for j = 1: size(img, 1)
        x = cosd(45)*(i - 200) + sind(45)*(j - 150) + 200;
        y = -sind(45)*(i - 200) + cosd(45)*(j - 150) + 150;
        
        if(x >= 1 && x <= size(img, 2) && y >= 1 && y <= size(img, 1))
            %rounding works
            x = round(x); y = round(y);
            img2(y,x,:) = img(j,i,:);
        end
    end 
end
imwrite(img2, 'rotate_0.jpg');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
img = imread('01.jpg');
img2 = zeros(size(img, 1), size(img, 2), 3, 'uint8');
for i = 1: size(img, 2)
    for j = 1: size(img, 1)
        x = cosd(45)*(i - 200) + sind(45)*(j - 150) + 200;
        y = -sind(45)*(i - 200) + cosd(45)*(j - 150) + 150;
        
        if(x >= 1 && x <= size(img, 2) && y >= 1 && y <= size(img, 1))
            %rounding works
            x = round(x); y = round(y);
            img2(j,i,:) = img(y,x,:);
        end
    end 
end
imwrite(img2, 'rotate_1.jpg');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
img = im2double(imread('lena_noisy.jpg'));
patch_size = [3,3];
img_median = median_filter(img, patch_size);
imwrite(img_median, 'median_0.jpg');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
img = im2double(imread('lena_noisy.jpg'));
patch_size = [5,5];
img_median = median_filter(img, patch_size);
imwrite(img_median, 'median_1.jpg');