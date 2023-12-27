function varargout = Image(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Image_OpeningFcn, ...
                   'gui_OutputFcn',  @Image_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end


% --- Executes just before Image is made visible.
function Image_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = Image_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

% --- Executes on button press in Average.
function Average_Callback(hObject, eventdata, handles)
x1 = get(handles.size_ava, 'string');
x1 = str2num(x1);
a = getappdata(0,'a');
axes(handles.axes2);
mean(a,x1)


% --- Executes on button press in Max.
function Max_Callback(hObject, eventdata, handles)
x1 = get(handles.size_max, 'string');
x1 = str2num(x1);
a = getappdata(0,'a');
axes(handles.axes2);
maxfilter(a,x1)


% --- Executes on button press in GLPF.
function GLPF_Callback(hObject, eventdata, handles)
x1 = get(handles.size_glpf, 'string');
x1 = str2num(x1);
a = getappdata(0,'a');
axes(handles.axes2);
GLPF(a,x1)


% --- Executes on button press in BLBF.
function BLBF_Callback(hObject, eventdata, handles)
d0 = get(handles.d0blbf, 'string');
d0 = str2num(d0);
n = get(handles.nblbf, 'string');
n = str2num(n);
a = getappdata(0,'a');
axes(handles.axes2);
BLPF(a,d0,n)


% --- Executes on button press in Median.
function Median_Callback(hObject, eventdata, handles)
x1 = get(handles.Size_miden, 'string');
x1 = str2num(x1);
a = getappdata(0,'a');
axes(handles.axes2);
med =medianfilter(a,x1);
imshow(med)
setappdata(0,'filename',med);


% --- Executes on button press in custome.
function custome_Callback(hObject, eventdata, handles)
a = getappdata(0,'a');
axes(handles.axes2);
customImageProcessing(a)



% --- Executes on button press in Min.
function Min_Callback(hObject, eventdata, handles)
x1 = get(handles.Size_Min, 'string');
x1 = str2num(x1);
a = getappdata(0,'a');
axes(handles.axes2);
min =minfilter(a,x1);
imshow(min)
setappdata(0,'filename',min);


% --- Executes on button press in IdleLBF.
function IdleLBF_Callback(hObject, eventdata, handles)
x1 = get(handles.Size_IdleLBF, 'string');
x1 = str2num(x1);
a = getappdata(0,'a');
axes(handles.axes2);
ILPF(a,x1);

function size_ava_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function size_ava_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Size_miden_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Size_miden_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function size_max_Callback(hObject, eventdata, handles)

function size_max_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Size_Min_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Size_Min_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function d0blbf_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function d0blbf_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function nblbf_Callback(hObject, eventdata, handles)

function nblbf_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function size_glpf_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function size_glpf_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Size_IdleLBF_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Size_IdleLBF_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in Weight.
function Weight_Callback(hObject, eventdata, handles)
a = getappdata(0,'a');
axes(handles.axes2);
 weightfilter(a)



% --- Executes on button press in Custom.
function Custom_Callback(hObject, eventdata, handles)
a = getappdata(0,'a');
axes(handles.axes2);
applyFilterToRegion(a)


% --- Executes on button press in Mid_Point.
function Mid_Point_Callback(hObject, eventdata, handles)
x1 = get(handles.size_midpoint, 'string');
x1 = str2num(x1);
a = getappdata(0,'a');
axes(handles.axes2);
mid =midpointfilter(a,x1);
imshow(mid)
setappdata(0,'filename',mid);


function size_midpoint_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function size_midpoint_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in Histogram.
function Histogram_Callback(hObject, eventdata, handles)
a = getappdata(0,'a');
axes(handles.axes2);
Histogram(a,handles.axes2); 

% --- Executes on button press in Contrast_Stretching.
function Contrast_Stretching_Callback(hObject, eventdata, handles)
NewMax = get(handles.New_Max, 'string');
NewMax = str2num(NewMax);
NewMin = get(handles.New_Min, 'string');
NewMin = str2num(NewMin);
a = getappdata(0,'a');
Contrast_Stretching = ContrastStretching(a,NewMin,NewMax);
axes(handles.axes2);
imshow(Contrast_Stretching)
setappdata(0,'filename',Contrast_Stretching);

% --- Executes on button press in Equalization.
function Equalization_Callback(hObject, eventdata, handles)
a = getappdata(0,'a');
a_gray = equalization(a);
axes(handles.axes2);
imshow(a_gray)
setappdata(0,'filename',a_gray);

function New_Min_Callback(hObject, eventdata, handles)

function New_Min_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function New_Max_Callback(hObject, eventdata, handles)

function New_Max_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in Fiple_Lift_Right.
function Fiple_Lift_Right_Callback(hObject, eventdata, handles)
a = getappdata(0,'a');
a_gray = flipImageLeftRight(a);
axes(handles.axes2);
imshow(a_gray)
setappdata(0,'filename',a_gray);
% --- Executes on button press in Flip_Up_Down.
function Flip_Up_Down_Callback(hObject, eventdata, handles)
a = getappdata(0,'a');
a_gray = flipImageUpDown(a);
axes(handles.axes2);
imshow(a_gray)
setappdata(0,'filename',a_gray);

function Calc_log_Callback(hObject, eventdata, handles)
a = getappdata(0,'a');
a_gray = LOG(a,2);
axes(handles.axes2);
imshow(a_gray)
setappdata(0,'filename',a_gray);

function LOG_Callback(hObject, eventdata, handles)
a = getappdata(0,'a');
a_gray = LOG(a,1);
axes(handles.axes2);
imshow(a_gray)
setappdata(0,'filename',a_gray);

function Nagative_Callback(hObject, eventdata, handles)
a = getappdata(0,'a');
a_gray = negative(a);
axes(handles.axes2);
imshow(a_gray)
setappdata(0,'filename',a_gray);
% hObject    handle to Nagative (see GCBO)
 
% --- Executes on button press in Gamma.
function Gamma_Callback(hObject, eventdata, handles)
x1 = get(handles.Enter_gamma, 'string');
x1 = str2num(x1);
a = getappdata(0,'a');
a_gray = Gamma(a,x1);
axes(handles.axes2);
imshow(a_gray)
setappdata(0,'filename',a_gray);

function Enter_gamma_Callback(hObject, eventdata, handles)
 

% --- Executes during object creation, after setting all properties.
function Enter_gamma_CreateFcn(hObject, eventdata, handles)
 
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Calculate.
function Calculate_Callback(hObject, eventdata, handles)
operatorIndex = handles.cla.Value;
operators = {'+', '-', '*', '/'};
operator = operators{operatorIndex};
x2 = get(handles.Enter_operate, 'string');
x2 = str2num(x2);
if x2 == 0
    bg = imread('WIN_20231214_01_37_22_Pro.jpg');
    axes(handles.axes2);
    imshow(bg)
else
    a = getappdata(0,'a');
    a_gray = Calculate(a,operator,x2);
    axes(handles.axes2);
    imshow(a_gray)
    setappdata(0,'filename',a_gray);
end


function Enter_operate_Callback(hObject, eventdata, handles)

function Enter_operate_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in cla.
function cla_Callback(hObject, eventdata, handles)

function cla_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Import_Image_Callback(hObject, eventdata, handles)
a = uigetimagefile();
filename= a;
setappdata(0,'filename',filename);
a = imread(a);
axes(handles.axes1)
imshow(a);
setappdata(0,'a',a)
setappdata(0,'filename',a);

function Exit_Callback(hObject, eventdata, handles)
close

function Reset_Callback(hObject, eventdata, handles)
ax1 = handles.axes1;
ax2 = handles.axes2;
cla(ax1, 'reset');
cla(ax2, 'reset');
set(ax1, 'Color', 'k');
set(ax2, 'Color', 'k');
a = ' ' ;
sx  = num2str(a);
set(handles.Ente_option_Binary,'string' ,sx);
set(handles.size_ava,'string' ,sx);
set(handles.Size_miden,'string' ,sx);
set(handles.size_max,'string' ,sx);
set(handles.Size_Min,'string' ,sx);
set(handles.size_glpf,'string' ,sx);
set(handles.Size_IdleLBF,'string' ,sx);
set(handles.d0blbf,'string' ,sx);
set(handles.nblbf,'string' ,sx);
set(handles.size_midpoint,'string' ,sx);
set(handles.T_Sobelv,'string' ,sx);
set(handles.Point_T,'string' ,sx);
set(handles.T_Robertv,'string' ,sx);
set(handles.T_Robletn,'string' ,sx);
set(handles.T_Sobeln,'string' ,sx);
set(handles.T_Sobel_DL,'string' ,sx);
set(handles.T_Robelrt_DL,'string' ,sx);
set(handles.T_Sobel_DR,'string' ,sx);
set(handles.T_Robert_DR,'string' ,sx);
set(handles.GHBFD0,'string' ,sx);
set(handles.Ideal_HBFD0,'string' ,sx);
set(handles.BHPF_D0,'string' ,sx);
set(handles.BHPF_N,'string' ,sx);
set(handles.Reszie_Value,'string' ,sx);
set(handles.New_Max,'string' ,sx);
set(handles.New_Min,'string' ,sx);
set(handles.Enter_operate,'string' ,sx);
set(handles.Salt_pepper_BS,'string' ,sx);
set(handles.Salt_pepper_BB,'string' ,sx);
set(handles.a_Erlang,'string' ,sx);
set(handles.b_Erlang,'string' ,sx);
set(handles.Gaussian_B,'string' ,sx);
set(handles.Gaussian_M,'string' ,sx);
set(handles.Enter_gamma,'string' ,sx);
set(handles.Rayleigh_A,'string' ,sx);
set(handles.Rayleigh_B,'string' ,sx);
set(handles.Uniform_A,'string' ,sx);
set(handles.Uniform_B,'string' ,sx);
set(handles.Exponentioal_A,'string' ,sx);




function RGB_To_Gray_Callback(hObject, eventdata, handles)
x2 = get(handles.Enter_option_Gray, 'value');
a = getappdata(0,'a');
a_gray = RGBTGRAY(a,x2);
axes(handles.axes2);
imshow(a_gray)
setappdata(0,'filename',a_gray);

function Gray_To_Binary_Callback(hObject, eventdata, handles)
x1 = get(handles.Ente_option_Binary, 'string');
x1 = str2num(x1);
a = getappdata(0,'a');
a_gray =GRAYTBINARY(a,x1);
axes(handles.axes2);
imshow(a_gray)
setappdata(0,'filename',a_gray);


 

function Ente_option_Binary_Callback(hObject, eventdata, handles)

function Ente_option_Binary_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in RGB_To_Binary.
function RGB_To_Binary_Callback(hObject, eventdata, handles)
a = getappdata(0,'a');
a_gray =RGBTBINARY(a);
axes(handles.axes2);
imshow(a_gray)
setappdata(0,'filename',a_gray);


function Enter_option_Gray_Callback(hObject, eventdata, handles)

function Enter_option_Gray_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Point.
function Point_Callback(hObject, eventdata, handles)
x1 = get(handles.Point_T, 'string');
x1 = str2num(x1);
a = getappdata(0,'a');
axes(handles.axes2);
Point =PointDetectionEdgeDetection(a,x1);
imshow(Point)
setappdata(0,'filename',Point);

function T_Point_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function T_Point_CreateFcn(hObject, eventdata, handles)
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Sobel_H.
function Sobel_H_Callback(hObject, eventdata, handles)
x1 = get(handles.T_Sobeln, 'string');
x1 = str2num(x1);
a = getappdata(0,'a');
axes(handles.axes2);
sobel =SobelhorizontalEdgeDetection(a,x1);
imshow(sobel)
setappdata(0,'filename',sobel);

function T_Sobeln_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function T_Sobeln_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Sobelv.
function Sobelv_Callback(hObject, eventdata, handles)
x1 = get(handles.T_Sobelv, 'string');
x1 = str2num(x1);
a = getappdata(0,'a');
axes(handles.axes2);
Sobel =SobelverticalEdgeDetection(a,x1);
imshow(Sobel)
setappdata(0,'filename',Sobel);





function T_Sobelv_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function T_Sobelv_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Sobel_DR.
function Sobel_DR_Callback(hObject, eventdata, handles)
x1 = get(handles.T_Sobel_DR, 'string');
x1 = str2num(x1);
a = getappdata(0,'a');
axes(handles.axes2);
So =SobeldiagonalRightEdgeDetection(a,x1);
imshow(So)
setappdata(0,'filename',So);

function T_Sobel_DR_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function T_Sobel_DR_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Sobel_DL.
function Sobel_DL_Callback(hObject, eventdata, handles)
x1 = get(handles.T_Sobel_DL, 'string');
x1 = str2num(x1);
a = getappdata(0,'a');
axes(handles.axes2);
Sob =SobeldiagonalLeftEdgeDetection(a,x1);
imshow(Sob)
setappdata(0,'filename',Sob);





function T_Sobel_DL_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function T_Sobel_DL_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Robert_V.
function Robert_V_Callback(hObject, eventdata, handles)
x1 = get(handles.T_Robertv, 'string');
x1 = str2num(x1);
a = getappdata(0,'a');
axes(handles.axes2);
Rebort =robertverticalEdgeDetection(a,x1);
imshow(Rebort)
setappdata(0,'filename',Rebort);


function T_Robertv_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function T_Robertv_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Roblet_H.
function Roblet_H_Callback(hObject, eventdata, handles)
x1 = get(handles.T_Robletn, 'string');
x1 = str2num(x1);
a = getappdata(0,'a');
axes(handles.axes2);
Hoz =roberthorizontalEdgeDetection(a,x1);
imshow(Hoz)
setappdata(0,'filename',Hoz);





function T_Robletn_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function T_Robletn_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Robelrt_DL.
function Robelrt_DL_Callback(hObject, eventdata, handles)
x1 = get(handles.T_Robelrt_DL, 'string');
x1 = str2num(x1);
a = getappdata(0,'a');
axes(handles.axes2);
RO =robertdiagonalLeftEdgeDetection(a,x1);
imshow(RO)
setappdata(0,'filename',RO);





function T_Robelrt_DL_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function T_Robelrt_DL_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Robert_DR.
function Robert_DR_Callback(hObject, eventdata, handles)
x1 = get(handles.T_Robert_DR, 'string');
x1 = str2num(x1);
a = getappdata(0,'a');
axes(handles.axes2);
re =robertdiagonalRightEdgeDetection(a,x1);
imshow(re)
setappdata(0,'filename',re);


function T_Robert_DR_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function T_Robert_DR_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes5_CreateFcn(hObject, eventdata, handles)
ah = axes('unit', 'normalized', 'position', [0 0 1 1]);

% import the background image and show it on the axes

bg = imread('WhatsApp Image 2023-12-17 at 05.21.15_f3d9458e.jpg'); imagesc(bg);

% prevent plotting over the background and turn the axis off

set(ah,'handlevisibility','off','visible','off')

% making sure the background is behind all the other uicontrols
uistack(ah,'bottom');


% --- Executes on button press in GHBF.
function GHBF_Callback(hObject, eventdata, handles)
x1 = get(handles.GHBFD0, 'string');
x1 = str2num(x1);
a = getappdata(0,'a');
axes(handles.axes2);
GHPF(a,x1)




function GHBFD0_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function GHBFD0_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Ideal_HBF.
function Ideal_HBF_Callback(hObject, eventdata, handles)
x1 = get(handles.Ideal_HBFD0, 'string');
x1 = str2num(x1);
a = getappdata(0,'a');
axes(handles.axes2);
IHPF(a,x1)




function Ideal_HBFD0_Callback(hObject, eventdata, handles)

function Ideal_HBFD0_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in BHPF.
function BHPF_Callback(hObject, eventdata, handles)
x1 = get(handles.BHPF_D0, 'string');
x1 = str2num(x1);
x2 = get(handles.BHPF_N, 'string');
x2 = str2num(x2);
a = getappdata(0,'a');
axes(handles.axes2);
bhpf = BHPF(a,x1,x2)





function BHPF_D0_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function BHPF_D0_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Point_1.
function Point_1_Callback(hObject, eventdata, handles)
a = getappdata(0,'a');
axes(handles.axes2);
Pointsharpening(a)




% --- Executes on button press in Horizontal.
function Horizontal_Callback(hObject, eventdata, handles)
a = getappdata(0,'a');
axes(handles.axes2);
horizontalsharp(a)




% --- Executes on button press in Vertical.
function Vertical_Callback(hObject, eventdata, handles)
a = getappdata(0,'a');
axes(handles.axes2);
verticalsharp(a)




% --- Executes on button press in Left_Diagonal.
function Left_Diagonal_Callback(hObject, eventdata, handles)
a = getappdata(0,'a');
axes(handles.axes2);
diagonalLeftsharp(a)




% --- Executes on button press in Right_Diagonal.
function Right_Diagonal_Callback(hObject, eventdata, handles)
a = getappdata(0,'a');
axes(handles.axes2);
diagonalrightsharp(a)




function BHPF_N_Callback(hObject, eventdata, handles)

function BHPF_N_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Point_T_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Point_T_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Reszie.
function Reszie_Callback(hObject, eventdata, handles)
x1 = get(handles.Reszie_Value, 'string');
x1 = str2num(x1);
a = getappdata(0,'a');
axes(handles.axes2);
resize(a,x1);




% --- Executes on button press in Erosion.
function Erosion_Callback(hObject, eventdata, handles)
a = getappdata(0,'a');
axes(handles.axes2);
erosion(a)

function Reszie_Value_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Reszie_Value_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Fourier_Transfrom.
function Fourier_Transfrom_Callback(hObject, eventdata, handles)
a = getappdata(0,'a');
axes(handles.axes2);
FourierTransform(a)



% --- Executes on button press in Invers_Fourier_Transfrom.
function Invers_Fourier_Transfrom_Callback(hObject, eventdata, handles)
a = getappdata(0,'a');
axes(handles.axes2);
InverseFourierTransform(a)


% --- Executes on button press in Salt_pepper.
function Salt_pepper_Callback(hObject, eventdata, handles)
x1 = get(handles.Salt_pepper_BS, 'string');
x1 = str2num(x1);
x2 = get(handles.Salt_pepper_BB, 'string');
x2 = str2num(x2);
a = getappdata(0,'a');
axes(handles.axes2);
Salt_pepper =saltandpepper(a,x1,x2);
imshow(Salt_pepper)
setappdata(0,'filename',Salt_pepper);


% --- Executes on button press in Uniform.
function Uniform_Callback(hObject, eventdata, handles)
x1 = get(handles.Uniform_A, 'string');
x1 = str2num(x1);
x2 = get(handles.Uniform_B, 'string');
x2 = str2num(x2);
a = getappdata(0,'a');
axes(handles.axes2);
Un = uniformnoise(a,x1,x2);
imshow(Un);


% --- Executes on button press in Erlang.
function Erlang_Callback(hObject, eventdata, handles)
x1 = get(handles.a_Erlang, 'string');
x1 = str2num(x1);
x2 = get(handles.b_Erlang, 'string');
x2 = str2num(x2);
a = getappdata(0,'a');
axes(handles.axes2);
Erlang =erlanggamma(a,x1,x2);
imshow(Erlang)
setappdata(0,'filename',Erlang);


% --- Executes on button press in Rayleigh.
function Rayleigh_Callback(hObject, eventdata, handles)
x1 = get(handles.Rayleigh_A, 'string');
x1 = str2num(x1);
x2 = get(handles.Rayleigh_B, 'string');
x2 = str2num(x2);
a = getappdata(0,'a');
axes(handles.axes2);
Rayleigh =rayleighnoise(a,x1,x2);
imshow(Rayleigh)
setappdata(0,'filename',Rayleigh);

% --- Executes on button press in Exponentioal.
function Exponentioal_Callback(hObject, eventdata, handles)
x1 = get(handles.Exponentioal_A, 'string');
x1 = str2num(x1);
a = getappdata(0,'a');
axes(handles.axes2);
exponentialnoise(a,x1)



function Salt_pepper_BS_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Salt_pepper_BS_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Salt_pepper_BB_Callback(hObject, eventdata, handles)

function Salt_pepper_BB_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Gaussian_B_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Gaussian_B_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Gaussian_M_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Gaussian_M_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Gaussian.
function Gaussian_Callback(hObject, eventdata, handles)
x1 = get(handles.Gaussian_B, 'string');
x1 = str2num(x1);
x2 = get(handles.Gaussian_M, 'string');
x2 = str2num(x2);
a = getappdata(0,'a');
axes(handles.axes2);
Gaussian =guassiannoise(a,x1,x2);
imshow(Gaussian)
setappdata(0,'filename',Gaussian);


function Uniform_A_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Uniform_A_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Uniform_B_Callback(hObject, eventdata, handles)

function Uniform_B_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function a_Erlang_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function a_Erlang_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function b_Erlang_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function b_Erlang_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Rayleigh_A_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Rayleigh_A_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Rayleigh_B_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function Rayleigh_B_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Exponentioal_A_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function Exponentioal_A_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
