function corner_map = Harris_corner_detector(img, sigma, alpha, R_threshold)
%HARRIS_CORNER_DETEC Summary of this function goes here
%   Detailed explanation goes here
hsize = (4*sigma) + 1;
kernel = fspecial('gaussian', hsize, sigma);
%simple filter
Dx = [1,0,-1]; Dy = [1;0;-1];
%Step 1: Image Gradients
%Apply Gaussian filtering to image
I_gauss = imfilter(img, kernel, 'replicate');
figure, imshow(I_gauss);title('Gaussian');imwrite(I_gauss,'baboon_gaussian.jpg');

%Compute image gradients
Ix = imfilter(I_gauss, Dx, 'replicate'); 
Iy = imfilter(I_gauss, Dy, 'replicate');

figure, imshow(Ix + 0.5);title('Ix'); imwrite(Ix, 'baboon_Ix.jpg');
figure, imshow(Iy + 0.5);title('Iy'); imwrite(Iy, 'baboon_IY.jpg');

%Step 2: Products of Gradients
%compute products of gradients at every pixel
Ixx = Ix .* Ix;
Iyy = Iy .* Iy;
Ixy = Ix .* Iy;

%Step 3: Matrix M
%compute sum of products of gradients at every pixel
Sxx = imfilter(Ixx, kernel);
Syy = imfilter(Iyy, kernel);
Sxy = imfilter(Ixy, kernel);

%Step 4: Corner Response
%Computer the determinant and trace of M
detM = (Sxx .* Syy) - (Sxy .* Sxy);
traceM = Sxx + Syy;
R = detM - alpha*(traceM.^2);
outputR = imagesc(R);
saveas(outputR,'baboon_corner_response.jpg');
newR = R>R_threshold;
figure, imshow(newR);title('Threshold'); imwrite(newR, 'baboon_corner_response_threshold.jpg');
%Step 5: Non_maxima suppression
local_max = imregionalmax(R);
figure, imshow(local_max);title('Local Maxima'); imwrite(local_max, 'baboon_local_max.jpg');
corner_map = newR & local_max;
figure, imshow(corner_map);title('Corner Map'); imwrite(corner_map, 'baboon_corner_map.jpg');


end

