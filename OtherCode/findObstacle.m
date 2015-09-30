function [cx,cy,ray]=findObstacle(im)

r=im(:,:,1); 
g=im(:,:,2); 
b=im(:,:,3);
diff=imsubtract(g,rgb2gray(im));
bw=im2bw(diff,0.03);%0.18
area=bwareaopen(bw,8000);
indexes=find(area>0);
minindexes=min(indexes);
maxindexes=max(indexes);

[B,~,~,~]=bwboundaries(area);

boundary = B{1};
maxcol=max(boundary(:,2));
mincol=min(boundary(:,2));
centercol=(maxcol-mincol)/2;
maxrow=max(boundary(:,1));
minrow=min(boundary(:,1));
centerrow=(maxrow-minrow)/2;
im(minrow+centerrow-5:minrow+centerrow+5,mincol+centercol-5:mincol+centercol+5,:)=255;

imshow(im)
cx=mincol+centercol;
cy=minrow+centerrow;
ray=max(sqrt((boundary(:,2)-cx).^2+(boundary(:,1)-cy).^2));
hold on
ang=0:0.01:2*pi;
xp=ray*cos(ang);
yp=ray*sin(ang);
plot(cx+xp,cy+yp);















end