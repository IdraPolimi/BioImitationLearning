% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly excecuted under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 1132.279306109289800 ; 1132.207678277928800 ];

%-- Principal point:
cc = [ 604.533267620450940 ; 445.085398083953630 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.031301309803082 ; 0.052098282074318 ; -0.003661275470608 ; -0.003400149337110 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 3.703457548121837 ; 3.629638034147725 ];

%-- Principal point uncertainty:
cc_error = [ 4.090508492066931 ; 3.692299253663056 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.006633581746187 ; 0.015841306337697 ; 0.001022636337890 ; 0.001005074678423 ; 0.000000000000000 ];

%-- Image size:
nx = 1280;
ny = 960;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 7;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 2.108742e+00 ; 2.189112e+00 ; 1.182724e-01 ];
Tc_1  = [ -2.092116e+02 ; -1.307985e+02 ; 5.144375e+02 ];
omc_error_1 = [ 2.634415e-03 ; 3.070310e-03 ; 6.105568e-03 ];
Tc_error_1  = [ 1.915242e+00 ; 1.744615e+00 ; 2.028662e+00 ];

%-- Image #2:
omc_2 = [ 1.841406e+00 ; 1.889930e+00 ; -2.052761e-01 ];
Tc_2  = [ -2.156271e+02 ; -5.862326e+01 ; 5.514782e+02 ];
omc_error_2 = [ 2.235552e-03 ; 2.790430e-03 ; 4.535861e-03 ];
Tc_error_2  = [ 2.001915e+00 ; 1.857768e+00 ; 1.810372e+00 ];

%-- Image #3:
omc_3 = [ -2.168458e+00 ; -2.160505e+00 ; 1.507768e-01 ];
Tc_3  = [ -8.839138e+01 ; -8.795653e+01 ; 4.837353e+02 ];
omc_error_3 = [ 2.426240e-03 ; 2.605240e-03 ; 5.360858e-03 ];
Tc_error_3  = [ 1.745752e+00 ; 1.585503e+00 ; 1.607823e+00 ];

%-- Image #4:
omc_4 = [ -1.942061e+00 ; -1.935297e+00 ; 4.370203e-01 ];
Tc_4  = [ -4.092543e+01 ; -9.236121e+01 ; 5.574611e+02 ];
omc_error_4 = [ 2.619874e-03 ; 2.538357e-03 ; 4.485043e-03 ];
Tc_error_4  = [ 1.992702e+00 ; 1.805428e+00 ; 1.673824e+00 ];

%-- Image #5:
omc_5 = [ 1.813106e+00 ; 1.843100e+00 ; 6.787096e-01 ];
Tc_5  = [ -1.369068e+02 ; -1.124920e+02 ; 3.043534e+02 ];
omc_error_5 = [ 3.044113e-03 ; 2.223164e-03 ; 4.218141e-03 ];
Tc_error_5  = [ 1.146832e+00 ; 1.048976e+00 ; 1.279017e+00 ];

%-- Image #6:
omc_6 = [ 2.328363e+00 ; 1.238329e+00 ; 4.795833e-01 ];
Tc_6  = [ -3.307437e+02 ; 2.775276e+01 ; 6.538425e+02 ];
omc_error_6 = [ 3.797821e-03 ; 2.239461e-03 ; 5.949844e-03 ];
Tc_error_6  = [ 2.491455e+00 ; 2.277534e+00 ; 2.517153e+00 ];

%-- Image #7:
omc_7 = [ 2.711366e+00 ; 1.479691e+00 ; -8.104694e-02 ];
Tc_7  = [ -2.288390e+02 ; -4.755570e+01 ; 5.071143e+02 ];
omc_error_7 = [ 3.107888e-03 ; 2.240644e-03 ; 5.554319e-03 ];
Tc_error_7  = [ 1.845625e+00 ; 1.706044e+00 ; 1.837250e+00 ];

