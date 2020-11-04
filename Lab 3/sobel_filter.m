function filter = sobel_filter(img, kernel)
        img2 = zeros(size(img));
        for i = 2:size(img, 2) - 2
            for j = 2:size(img, 1) -2
                   value = 0;
                   for x = -1:1
                       for y = -1:1
                           value = value + sum(sum(kernel(x + 2, y + 2) * img(j + y, i + x)));
                       end
                   end
                   img2(j,i) = value;
            end
        end   
        filter = img2;
end
%  function output = median_filter(img, patch_size)
%     
%            
% end

function filter = sobel_filter(img, kernel)
        img2 = zeros(size(img));
        for i = 2:size(img, 2) - 2
            for j = 2:size(img, 1) -2
                   value = 0;
                   for x = -1:1
                       for y = -1:1
                           value = value + sum(sum(kernel(x + 2, y + 2) * img(j + y, i + x)));
                       end
                   end
                   img2(j,i) = value;
            end
        end   
        filter = img2;
end