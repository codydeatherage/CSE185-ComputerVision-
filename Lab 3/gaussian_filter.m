function output = gaussian_filter(img, hsize, sigma)
    H = fspecial('gaussian', hsize, sigma);
    img2 = zeros(size(img));
    distX = floor(hsize / 2);
    distY = floor(hsize / 2);
    x = [0 0];
    y = [0 0];
    for i = distX + 1: size(img,2) - distX
        for j = distY + 1: size(img, 1) - distY
            x(1) = i - distX;  y(1) = j - distY;
            x(2) = i + distX;  y(2) = j + distY;
            patch = img(y(1):y(2), x(1):x(2));
            patch = patch(:);
            H = H(:);
            H = H';
            img2(j, i) = H*patch;
        end
    end
    output = img2;
end

