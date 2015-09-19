nPoints = 4
%im = grabAFrame();
im = imread('Immagini/fromNao.jpg');
pixelPoints = selectPointsInImage(im,nPoints);
coordPoints =[];
for i = 1:nPoints
    coordPoints = [coordPoints,input('Point in mm as column vector: ')];
end
[~,ETran,ERot,~,~,~,~] = compute_extrinsic(pixelPoints,coordPoints,FC,CC,KC,ALPHA_C);

coordPoints =[];
for i = 1:nPoints
    coordPoints = [coordPoints,UV2XY(pixelPoints(:,i),FC,CC,ALPHA_C,ERot,ETran,0)];
end

plot(coordPoints(1,:),coordPoints(2,:));

pointsCamera = [];
for i = 1:nPoints
    pointsCamera = [pointsCamera,fromWorldToCamera(ERot,ETran,coordPoints(:,i))];
end
figure;
plot3(pointsCamera(1,:),pointsCamera(2,:),pointsCamera(3,:));


