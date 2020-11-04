img = imread('01.jpg');
img(:,:,2) = 0;
figure, imshow(img);
imwrite(img, 'green.jpg');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
img = imread('01.jpg');
img = (0.299*img(:,:,1)) + (0.587 * img(:,:,2)) + (0.114 * img(:,:,3));
figure, imshow(img);
imwrite(img, 'gray.jpg');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
img = imread('01.jpg');
img = imrotate(img, 90);
figure, imshow(img);
imwrite(img, 'rotate.jpg');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
img = imread('01.jpg');
% -1 needed to fix dimensions, was 201 x 301
img = img(30:270 - 1 , 100:300 - 1, :);
imwrite(img, 'crop.jpg');
figure, imshow(img);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
img = imread('01.jpg');
img = flip(img);
imshow(img);
imwrite(img, 'flip.jpg');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
img1 = imread('01.jpg');
img2 = imread('02.jpg');
img3 = imread('03.jpg');
img4 = imread('04.jpg');
canvas = zeros(300 * 2 + 10, 400 * 2 + 10, 3, 'uint8');
canvas(1:300, 1:400,:) = img1;
canvas(311:610, 1:400,:) = img2;
canvas(1:300, 411:810,:) = img3;
canvas(311:610, 411:810,:) = img4;
imshow(canvas);
imwrite(canvas, 'combine.jpg');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
img1 = imread('05.jpg');
img2 = imread('06.jpg');
for i = 1: (375 * 1242 * 3)
    result(i:1) = (img1(i:1) + img2(i:1)) / 2;
end
result = reshape(result, [375, 1242, 3]);

imwrite(result, 'average.jpg');
imshow(result);
