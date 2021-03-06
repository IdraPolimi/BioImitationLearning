function pts = selectPointsInImage(image, n)
%  readPointsInImage return points clicked by the user in the displayed
%  image
%  INPUT: the image and the number of point to be selected.
%  OUTPUT: a 2xn matrix; each column is a point [x;y]

pts = zeros(2, n);
imshow(image);
k = 0;
hold on; % and keep it there while we plot
nclick=0;

while nclick<n
    [xi, yi, ~] = ginput(1);
    [xxi] = cornerfinder([xi;yi],image,5,5);% get a point
    k = k + 1;
    pts(1,k) = xxi(1);
    pts(2,k) = xxi(2);
    plot(xxi(1), xxi(2), 'go');         % first point on its own
    nclick=nclick+1;  
end
hold off;
end


%  150.3    1046.6    588.2    810.0    1233.1
%  467.4    508.4    599.4    680.1    821.2

% omckk =
%
%    -0.9865
%     0.0091
%    -0.0259
%
%
% Tckk =
%
%  -135.3989
%   -12.5928
%   505.3279
%
%
% Rckk =
%
%     0.9997    0.0177    0.0195
%    -0.0260    0.5513    0.8339
%     0.0040   -0.8341    0.5516

%newImage

% 0.2492    1.1376    0.5870    0.7724    1.1831
% 0.3696    0.4617    0.5163    0.6198    0.8257

% x_kk=[249.2  1137.6  587  772.4 1183.1;369.6  461.7  516.3  619.8 825.7]
%
% X_kk=[0 0 76.5 113.5 158;0 315 163 222 315;0 0 0 0 0]

% omckk =
%
%    -1.9857
%    -2.6860
%     1.6653
%
%
% Tckk =
%
%  -137.1091
%   -38.2138
%   434.6896
%
%
% Rckk =
%
%    -0.3124    0.9494   -0.0337
%     0.4523    0.1175   -0.8841
%    -0.8354   -0.2914   -0.4661

%%predict
% 154.8128
%   661.9218
