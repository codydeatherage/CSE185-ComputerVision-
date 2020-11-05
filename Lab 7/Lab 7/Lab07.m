%img = imread('cameraman.png');
img = imread('baboon.png');
img = im2double(img);
%parameters provided
sigma = 1;
alpha = 0.04;
R_threshold = 1e-5*5;

final_corner_map = Harris_corner_detector(img, sigma, alpha, R_threshold);
[corner_y, corner_x] = find(final_corner_map);
 
%visualize results 
figure, imshow(img); hold on;
final = plot(corner_x, corner_y, 'ro');
saveas(final ,'baboon_corners.jpg');