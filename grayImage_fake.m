function re_img = grayImage_fake(img)

hsvimg = rgb2hsv(img);
himg = hsvimg(:,:,1);
simg = hsvimg(:,:,2);
vimg = hsvimg(:,:,3);

re_img = himg*255;

max(max(re_img))
