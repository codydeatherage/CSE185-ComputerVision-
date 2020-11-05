%% Split frequency, ratio = 0.1
img = im2double(imread('lena.jpg'));
ratio = 0.1;
[low_pass_img, high_pass_img] = separate_frequency(img, ratio);
figure,imshow(low_pass_img);
figure,imshow(high_pass_img + 0.5);
imwrite(low_pass_img, 'lena_low_0.1.jpg');
imwrite(high_pass_img + 0.5, 'lena_high_0.1.jpg');

%% Split frequency, ratio = 0.2
img = im2double(imread('lena.jpg'));
ratio = 0.2;
[low_pass_img, high_pass_img] = separate_frequency(img, ratio);
figure,imshow(low_pass_img);
figure,imshow(high_pass_img + 0.5);
imwrite(low_pass_img, 'lena_low_0.2.jpg');
imwrite(high_pass_img + 0.5, 'lena_high_0.2.jpg');

%% low marilyn / high einstein
img1 = im2double(imread('marilyn.jpg'));
img2 = im2double(imread('einstein.jpg'));
ratio = 0.1;
img_merged = hybrid_image(img1, img2, ratio);
figure, imshow(img_merged);
imwrite(img_merged, 'hybrid_1.jpg');

%% high marilyn / low einstein
name1 = 'einstein.jpg';
name2 = 'marilyn.jpg';
img1 = im2double(imread('einstein.jpg'));
img2 = im2double(imread('marilyn.jpg'));
ratio = 0.1;
img_merged = hybrid_image(img1, img2, ratio);
figure, imshow(img_merged);
imwrite(img_merged, 'hybrid_2.jpg');


