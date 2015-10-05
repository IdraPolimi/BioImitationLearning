function [major,minor,cent]=findObstacle(imBackground, imForeground, threshold)

imBackground=im2double(imBackground);
imForeground=im2double(imForeground);
m1 = mean2(rgb2gray(imBackground));
m2 = mean2(rgb2gray(imForeground));

newImForeground = imForeground - (m2-m1);

imDiff = rgb2gray(newImForeground)-rgb2gray(imBackground);


imDiff = abs(imDiff)./(std2(rgb2gray(imForeground)-rgb2gray(imBackground)))>threshold;

se=strel('disk',10,4);
imDiff=imerode(imDiff,se);
imDiff=imdilate(imDiff,se);
%imDiff = abs(imDiff)>threshold;


hsvImg = rgb2hsv(imForeground);
satur = hsvImg(:,:,2);
filtSatur = satur.*imDiff;
filtSaturTh=filtSatur>0.3;
imshow(filtSaturTh)
stats=regionprops(filtSaturTh,'MajorAxisLength','MinorAxisLength','Centroid');
major=cat(1,stats.MajorAxisLength);
minor=cat(1,stats.MinorAxisLength);
cent=cat(1,stats.Centroid);





% stats=regionprops(imDiff,'MajorAxisLength','MinorAxislength','Centroid','Area');
% area=stats.Area;
% center=stats.Centroid;
% minor=stats.MinorAxisLength;
% major=stats.MajorAxisLength;
% 
% 
% stats=regionprops(imDiff,'ConvexHull');
% 
% stats.ConvexHull
% chull=cat(1,stats.ConvexHull);
% 
% imshow(imDiff);
% hold on
% plot(chull(:,1),chull(:,2),'-');
% [B,~,~,~]=bwboundaries(imDiff);
% 
% ind = 0;
% maxSize = 0;
% for i = 1:size(B)
%     if( size(B{i},1)>maxSize)
%         maxSize = size(B{i},1);
%         ind = i;
%     end
% end
% 
% boundary = B{ind}
% 
% maxcol=max(boundary(:,2));
% mincol=min(boundary(:,2));
% centercol=(maxcol-mincol)/2;
% maxrow=max(boundary(:,1));
% minrow=min(boundary(:,1));
% centerrow=(maxrow-minrow)/2;
% imForeground(minrow+centerrow-5:minrow+centerrow+5,mincol+centercol-5:mincol+centercol+5,:)=255;
% figure 
% imshow(imForeground)
% cx=mincol+centercol;
% cy=minrow+centerrow;
% ray=max(sqrt((boundary(:,2)-cx).^2+(boundary(:,1)-cy).^2));

% hold on
% ang=0:0.01:2*pi;
% xp=ray*cos(ang);
% yp=ray*sin(ang);
% plot(cx+xp,cy+yp);

% raymin=min(sqrt((boundary(:,2)-cx).^2+(boundary(:,1)-cy).^2));


% t=linspace(0,2*pi);
% plot(raymin*cos(t)+cx,ray*sin(t)+cy);




end