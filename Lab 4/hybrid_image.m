function img_merged = hybrid_image(img1, img2, ratio)
[low_pass_img1, high_pass_img1] = separate_frequency(img1, ratio);
[low_pass_img2, high_pass_img2] = separate_frequency(img2, ratio); 
 img_merged = low_pass_img1 + high_pass_img2; 
end