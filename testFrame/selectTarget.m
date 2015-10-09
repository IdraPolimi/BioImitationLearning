function [center,major,minor,indexmin]=selectTarget(image,stats)


imshow(image)
viscircles(cat(1,stats.Centroid),((cat(1,stats.MajorAxisLength)+cat(1,stats.MinorAxisLength))/4));

[xi, yi, ~] = ginput(1);

matClick=repmat([xi,yi],size(stats));
%cat(1,stats.Centroid)

diff=cat(1,stats.Centroid)-matClick;
distanceC=sqrt(sum(abs(diff).^2,2));
indexmin=find(distanceC == min(distanceC));

center=stats(indexmin).Centroid;
major=stats(indexmin).MinorAxisLength;
minor=stats(indexmin).MajorAxisLength;















end