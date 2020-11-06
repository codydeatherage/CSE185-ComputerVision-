%img = im2double(imread('hill.png'));
% img = im2double(imread('lines.png'));
img = im2double(imread('bridge.png'));

imgbw = rgb2gray(img);
threshold = 0.3;
sigma = 2;
edge_map = edge(imgbw, 'Canny', threshold, sigma);

[m, b] = hough_transform(edge_map);
%x = 1:size(img, 1); #draws line halfway down slope
x = 1:size(img, 2);
y = m*x + b;

figure, imshow(img); hold on;
plot(x, y, '--','LineWidth', 2, 'Color', 'red');
%saveas(gcf, sprintf('hill_mb_line.png'));
% saveas(gcf, sprintf('lines_mb_line.png'));
saveas(gcf, sprintf('bridge_mb_line.png'));

[r,theta] = hough_transform_polar(edge_map);
y = -(cos(theta) / sin(theta)) * x + r/ sin(theta);

figure, imshow(img);hold on;
plot(x, y, '--', 'LineWidth', 2, 'Color', 'blue');
%saveas(gcf, sprintf('hill_polar_line.png'));
% saveas(gcf, sprintf('lines_polar_line.png'));
saveas(gcf, sprintf('bridge_polar_line.png'));