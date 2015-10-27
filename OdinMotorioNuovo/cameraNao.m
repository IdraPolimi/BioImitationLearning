
function [ centers ] = cameraNao( )

%global PICTURE
video = ALVideoDeviceProxy('192.168.1.2',9559);
PORT=9559;
MOTION=ALMotionProxy('192.168.1.2', PORT);
check=1;
while check<=5
    disp('faccio partire il movimento:')
    check
    movimenti((1:4)+4*(check-1))
    input('posiziona la pallina')
    video.subscribeCamera('matlab',int16(1),int16(0),int16(11),int16(30));
    res = video.getImageRemote('matlab');
    %res = PICTURE.getImageRemote('matlab');
    rgb  = res{7};
    im = uint8(rand(120,160,3));
    %im = uint8(rand(960,1280,3));
    video.unsubscribe('matlab');
    %PICTURE.unsubscribe('matlab');
    
    v = 1;
    for j=1:120,
        for i=1:160,
            alpha = bitand(uint8(255),uint8(255));
            alpha = bitshift(uint8(alpha), uint8(24));
            red = bitand(uint8(rgb(i*j)),uint8(255));
            red = bitshift(red,16);
            
            green = bitand(uint8(rgb(i*j+1)), uint8(255));
            green = bitshift(red,uint8(8));
            
            blue = bitand(uint8(rgb(i*j+2)), uint8(255));
            
            
            red = rgb(v);
            green = rgb(v+1);
            blue = rgb(v+2);
            
            im(j,i,1) = red;
            im(j,i,2) = green;
            im(j,i,3) = blue;
            v = v+3;
        end
    end
    
    image(im);
    %image(rgb);
    axis image
    title('RGB image');
    
    [centers, radii] = imfindcircles(im,[10 35],'ObjectPolarity','bright', 'Sensitivity',0.9);
    h = viscircles(centers,radii);
    if (isempty(centers))
        input('pallina non trovata, rifaccio il movimento, rimetti nella posizione iniziale')
    else
        im_f(check).sig=im;
        
        input('metti il braccio sulla pallina')
        reward(check).sig=cell2mat(MOTION.getPosition('LArm', int8(0), false));
        check=check+1;
        input('pallina trovata, faccio il movimento dopo, rimetti nella posizione iniziale')
    end
end
save('img_actor.mat','im_f')
save('reward_actor.mat','reward')
end
