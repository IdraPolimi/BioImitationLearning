function [cx,cy,ray]=findObstacle(imBackground, imForeground, threshold)

m1 = mean2(rgb2gray(imBackground));
m2 = mean2(rgb2gray(imForeground));
newImForeground = imForeground + (m1-m2);

imDiff = rgb2gray(imBackground)-rgb2gray(newImForeground);

imDiff = abs(imDiff)>threshold;
[B,~,~,~]=bwboundaries(imDiff);

ind = 0;
maxSize = 0;
for i = 1:size(B)
    if( size(B{i},1)>maxSize)
        maxSize = size(B{i},1);
        ind = i;
    end
end

boundary = B{ind}

maxcol=max(boundary(:,2));
mincol=min(boundary(:,2));
centercol=(maxcol-mincol)/2;
maxrow=max(boundary(:,1));
minrow=min(boundary(:,1));
centerrow=(maxrow-minrow)/2;
imForeground(minrow+centerrow-5:minrow+centerrow+5,mincol+centercol-5:mincol+centercol+5,:)=255;
figure 
imshow(imForeground)
cx=mincol+centercol;
cy=minrow+centerrow;
ray=max(sqrt((boundary(:,2)-cx).^2+(boundary(:,1)-cy).^2));
hold on
ang=0:0.01:2*pi;
xp=ray*cos(ang);
yp=ray*sin(ang);
plot(cx+xp,cy+yp);
end