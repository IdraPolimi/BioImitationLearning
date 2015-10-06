

close all

global rot
nPoints = 5;

%im = grabAFrame();
im = imread('nostrafusion.jpg');
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

figure;
plot(coordPoints(2,:),coordPoints(1,:));

pointsCamera = [];
for i = 1:nPoints
    pointsCamera = [pointsCamera,fromWorldToCamera(ERot,ETran, coordPoints(:,i))];
end

figure;


pointsCameraRot = [];
for i = 1:nPoints
    pointsCameraRot=[pointsCameraRot,(pointsCamera(:,i)'*rot)'];
end
plot3(pointsCameraRot(1,:),pointsCameraRot(2,:),pointsCameraRot(3,:),'b');
hold on
plot3(0,0,0,'rO')
xlabel('X ');
ylabel('Y ');
zlabel('Z ');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pointsTorso = [];
for i = 1:nPoints
    pointsTorso=[pointsTorso, Camera2Torso(pointsCameraRot(:,i),getHeadAngles())];
end
figure;
plot3(pointsTorso(1,:),pointsTorso(2,:),pointsTorso(3,:),'kO-');
hold on
plot3(0,0,0,'rO')
xlabel('X ');
ylabel('Y ');
zlabel('Z ');




