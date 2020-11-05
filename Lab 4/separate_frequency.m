function [low_pass_img, high_pass_img] = separate_frequency(img, ratio)
    fr_map = fft2(img);
    figure, imshow(log(abs(fr_map) + 1), []);
    fr_map_shifted = fftshift(fr_map);
    h = ratio * size(img, 1);
    w = ratio * size(img, 2);
    x1 = round(size(img, 2)/2) - w; x2 = round(size(img, 2)/2) + w;
    y1 = round(size(img, 1)/2) - h;y2 = round(size(img, 1)/2) + h;
    mask = zeros(size(img));
    mask(y1:y2, x1:x2, :) = 1; 
    low_fr_map_shifted = fr_map_shifted .* mask;
    high_fr_map_shifted = fr_map_shifted .* (1-mask);
    low_fr_map = ifftshift(low_fr_map_shifted);
    high_fr_map = ifftshift(high_fr_map_shifted);
    low_pass_img = real(ifft2(low_fr_map));
    high_pass_img = real(ifft2(high_fr_map));
end

