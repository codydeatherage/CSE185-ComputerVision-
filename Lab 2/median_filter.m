 function filter = median_filter(img, patch_size)
        img2 = zeros(size(img));
        dist_X = floor(patch_size(1) / 2);
        dist_Y = floor(patch_size(2) / 2);
        x = [0 0];
        y = [0 0];
        for i = dist_X + 1: size(img,2) - dist_X
            for j = dist_Y + 1: size(img, 1) - dist_Y
                x(1) = i - dist_X;  y(1) = j - dist_Y;
                x(2) = i + dist_X;  y(2) = j + dist_Y;
                patch = img(y(1):y(2), x(1):x(2));
                avg = median(patch(:));
                img2(j, i) = avg;
            end
        end
       filter = img2;   
end