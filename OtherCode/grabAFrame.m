function image = grabAFrame()

video = ALVideoDeviceProxy('10.79.5.60',9559);
video.subscribeCamera('matlab',int16(0),int16(3),int16(11),int16(25));
res = video.getImageRemote('matlab')
rgb  = res{7}';
video.unsubscribe('matlab');

imRedIdx  = rgb(1:3:3*1280*960);
imGreenIdx  =rgb(2:3:3*1280*960);
imBlueIdx  = rgb(3:3:3*1280*960);
 v = 1;
    for j=1:960,
        for i=1:1280,
            red = rgb(v);
            green = rgb(v+1);
            blue = rgb(v+2);
            image(j,i,1) = red;
            image(j,i,2) = green;
            image(j,i,3) = blue;
            v = v+3;
        end
    end

imshow(image)
imwrite(image,'fromNao.jpg');
end

