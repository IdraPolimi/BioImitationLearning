function pts = readPoints(image, n)
%readPoints   Read manually-defined points from image
%   POINTS = READPOINTS(IMAGE) displays the image in the current figure,
%   then records the position of each click of button 1 of the mouse in the
%   figure, and stops when another button is clicked. The track of points
%   is drawn as it goes along. The result is a 2 x NPOINTS matrix; each
%   column is [X; Y] for one point.
% 
%   POINTS = READPOINTS(IMAGE, N) reads up to N points only.

if nargin < 2
    n = Inf;
    pts = zeros(2, 0);
else
    pts = zeros(2, n);
end

imshow(image);     % display image
xold = 0;
yold = 0;
k = 0;
hold on; % and keep it there while we plot
nclick=0;

while nclick<n
    [xi, yi, but] = ginput(1);      % get a point
    if ~isequal(but, 1)             % stop if not button 1
        break
    end
    k = k + 1;
    pts(1,k) = xi;
    pts(2,k) = yi;

      if xold
          plot([xold xi], [yold yi], 'go-');  % draw as we go
          
      else
          plot(xi, yi, 'go');         % first point on its own
           nclick=nclick+1;
      end
      if isequal(k, n)
          break
      end
      xold = xi;
      yold = yi;
     
  end
hold off;
if k < size(pts,2)
    pts = pts(:, 1:k);
end

end


%312.7500  500.2500  411.7500  681.7500
%434.7500  559.2500  613.2500  733.2500



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
