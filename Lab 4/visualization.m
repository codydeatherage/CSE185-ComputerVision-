img = im2double(imread('new_york.jpg'));
fr_map = fftshift(fft2(img));
figure, imagesc(log(abs(fr_map) + 1)), colormap jet;
imwrite(img, 'new_york_frequency.jpg');
%%
img = im2double(imread('flowers.jpg'));
fr_map = fftshift(fft2(img));
figure, imagesc(log(abs(fr_map) + 1)), colormap jet;
imwrite(img, 'flowers_frequency.jpg');
