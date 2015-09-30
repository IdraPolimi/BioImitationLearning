r=im(:,:,1); g=im(:,:,2); b=im(:,:,3);
diff=imsubtract(r,rgb2gray(im));
bw=im2bw(diff,0.18);
area=bwareaopen(bw,300);
rm=immultiply(area,r);  gm=g.*0;  bm=b.*0;
image=cat(3,rm,gm,bm);
im=imread('TableAndNao.jpg');


r=im(:,:,1); g=im(:,:,2); b=im(:,:,3);
diff=imsubtract(g,rgb2gray(im));
bw=im2bw(diff,0.03);%0.18
area=bwareaopen(bw,8000);
indexes=find(area>0)
minindexes=min(indexes);
maxindexes=max(indexes);
c=imcontour(area);
[B,~,~,~]=bwboundaries(area);
boundary = B{1};
im(minrow+centerrow-5:minrow+centerrow+5,mincol+centercol-5:mincol+centercol+5,:)=255;
centerx=mincol+centercol;
centery=minrow+centerrow;
raggio=max(sqrt((boundary(:,2)-centerx).^2+(boundary(:,1)-centery).^2));
hold on
ang=0:0.01:2*pi;
xp=raggio*cos(ang);
yp=raggio*sin(ang);
plot(centery+xp,centerx+yp);