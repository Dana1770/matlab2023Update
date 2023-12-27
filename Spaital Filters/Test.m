old_image = imread('cameraman.tif');
% old_image = imread('G:\Photo\Wallpaper\1.jpg');

% -------------------------------------------------------
% <<<<<<<<<<<<<<<<<<<< Avarage Filter >>>>>>>>>>>>>>>>>>>
blurRGBImage(old_image, 3);

% -----------------------------------------------------------------------
% <<<<<<<<<<<<<<<<<<<< vertical Edge Detection Filter >>>>>>>>>>>>>>>>>>>
SobelverticalEdgeDetection(old_image);

% -----------------------------------------------------------------------
% <<<<<<<<<<<<<<<<<<<< Horizontal Edge Detection Filter >>>>>>>>>>>>>>>>>
SobelhorizontalEdgeDetection(old_image);

% -----------------------------------------------------------------------
% <<<<<<<<<<<<<<< Main diagonal Edge Detection Filter >>>>>>>>>>>>>>>>>>>
SobelMaindiagonalEdgeDetection(old_image);

% -----------------------------------------------------------------------
% <<<<<<<<<<<<<<<< Cross diagonal Edge Detection Filter >>>>>>>>>>>>>>>>>
SobelCrossdiagonalEdgeDetection(old_image);

% -----------------------------------------------------------------------
% <<<<<<<<<<<<<<<<<<<< Robert 1 Edge Detection Filter >>>>>>>>>>>>>>>>>>>
robert1EdgeDetection(old_image);

% -----------------------------------------------------------------------
% <<<<<<<<<<<<<<<<<<<< Robert 2 Edge Detection Filter >>>>>>>>>>>>>>>>>>>
robert2EdgeDetection(old_image);

% -----------------------------------------------------------------------
% <<<<<<<<<<<<<<<<<<<< Robert 3 Edge Detection Filter >>>>>>>>>>>>>>>>>>>
robert3EdgeDetection(old_image);

% -----------------------------------------------------------------------
% <<<<<<<<<<<<<<<<<<<< Robert 4 Edge Detection Filter >>>>>>>>>>>>>>>>>>>
robert4EdgeDetection(old_image);

% ---------------------------------------------------------
% <<<<<<<<<<<<<<<<<<<< Laplacian Filter >>>>>>>>>>>>>>>>>>>
LaplacianFilter(old_image);
