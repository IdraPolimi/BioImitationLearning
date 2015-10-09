function [ETran,ERot]=preCalibration()

global FC
global CC
global ALPHA_C
global KC

nPoints=input('Numero di punti sulla foto');
pointsPix=selectPointsInImage('TableAndNao.jpg',nPoints);
pointsMM=input('Matrice coordinate in MM');

[~,ETran,ERot,~,~,~,~] = compute_extrinsic(pointsPix,pointsMM,FC,CC,KC,ALPHA_C);



























end