nPoints = 4
%im = grabAFrame();
im = imread('fromNao2.jpg');
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

plot3(pointsCamera(3,:),-pointsCamera(1,:),-pointsCamera(2,:),'b');
pointsCamera
hold on
plot3(0,0,0,'rO')
xlabel('X ');
ylabel('Y ');
zlabel('Z ');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cameraPosition =[78.4673;0;163.1031;1.0000];
cameraPosition

pointsTorso=repmat(cameraPosition,1,4)+pointsCamera;
plot3(pointsTorso(3,:),-pointsTorso(1,:),-pointsTorso(2,:),'y');
plot3(-cameraPosition(1,:),-cameraPosition(2,:),-cameraPosition(3,:),'kO');











