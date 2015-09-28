global rot
nPoints = 4;

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
figure;
plot(coordPoints(1,:),coordPoints(2,:));

pointsCamera = [];
for i = 1:nPoints
    pointsCamera = [pointsCamera,fromWorldToCamera(ERot,ETran,coordPoints(:,i))];
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
    pointsCameraRot(:,i)
    pointsTorso=[pointsTorso, Camera2Torso(pointsCameraRot(:,i),[0;0.3892;0])];
end
figure;
plot3(pointsTorso(1,:),pointsTorso(2,:),pointsTorso(3,:),'kO');
hold on
plot3(0,0,0,'rO')
xlabel('X ');
ylabel('Y ');
zlabel('Z ');

% cameraPosition =[78.4673;0;163.1031;1.0000];
% cameraPosition
% 
% pointsTorso=repmat(cameraPosition,1,4)+pointsCamera;
% plot3(pointsTorso(3,:),-pointsTorso(1,:),-pointsTorso(2,:),'y');
% plot3(-cameraPosition(1,:),-cameraPosition(2,:),-cameraPosition(3,:),'kO');





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% cameraPositionForPlot =[78.4673;0;163.1031;1.0000];
% getCameraPosition([0;0.3892;0],pointsCamera(:,1)) %roll,pitch,yaw con pitch 22.3�
% plot3(ans(1)-cameraPositionForPlot(1),ans(2)-cameraPositionForPlot(2),ans(3)-cameraPositionForPlot(3),'k-*');
% %%cos� per i 4 punti
% plot3(0,0,0,'r');%origine/posizione telecamera





