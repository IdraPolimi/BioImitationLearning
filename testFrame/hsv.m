hue=240;
h=[hue/360 0.05];
s=[];

hsv1=rgb2hsv(im2);
hsv2=ColorFilter(hsv1,h,s);
rgb2=hsv2rgb(hsv2);
imshow(rgb2)