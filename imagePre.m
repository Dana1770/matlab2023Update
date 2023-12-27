function varargout = imagePre(varargin)
gui_Singleton = 1;
global result;
result = [];
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @imagePre_OpeningFcn, ...
                   'gui_OutputFcn',  @imagePre_OutputFcn, ...
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


% --- Executes just before imagePre is made visible.
function imagePre_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = imagePre_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

% --- Executes on button press in Average.
function Average_Callback(hObject, eventdata, handles)
x1 = get(handles.size_ava, 'string');
x1 = str2num(x1);
a = getappdata(0,'a');
input1=drawHistogram(a);
a=SmoothingWithMeanFilter(a,x1);
input2=drawHistogram(a);
axes(handles.axes2);
imshow(a);
axes(handles.axes7);
imshow(input1);
axes(handles.axes6);
imshow(input2);
% --- Executes on button press in Max.
function Max_Callback(hObject, eventdata, handles)
x1 = get(handles.ma, 'string');
x1 = str2num(x1);
a = getappdata(0,'a');
input=drawHistogram(a);
a=ApplyMaxFilter(a,x1);
input1=drawHistogram(a);
axes(handles.axes2);
imshow(a);
axes(handles.axes7);
imshow(input);
axes(handles.axes6);
imshow(input1);

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
input=drawHistogram(a);
med =ApplyMedianFilter(a,x1);
input1=drawHistogram(med);
axes(handles.axes2);
imshow(med)
axes(handles.axes7);
imshow(input)
axes(handles.axes6);
imshow(input1)
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
input=drawHistogram(a);
min =ApplyMinFilter(a,x1);
input1=drawHistogram(a);
axes(handles.axes2);
imshow(min)
axes(handles.axes7);
imshow(input)
axes(handles.axes6);
imshow(input1)
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

function ma_Callback(hObject, eventdata, handles)

function ma_CreateFcn(hObject, eventdata, handles)
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
input1=drawHistogram(a);
axes(handles.axes2);
imshow(Contrast_Stretching)
axes(handles.axes6);
imshow(input1)
setappdata(0,'filename',input1);
setappdata(0,'filename',Contrast_Stretching);

% --- Executes on button press in Equalization.
function Equalization_Callback(hObject, eventdata, handles)
a = getappdata(0,'a');
a_gray = equalization(a);
input=drawHistogram(a_gray);
axes(handles.axes2);
imshow(a_gray)
axes(handles.axes6);
imshow(input)
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
x1 = get(handles.GM, 'string');
x1 = str2num(x1);
a=getappdata(0,'a');
input=a;
input=FixNoiseWithMeanFilter(input,x1);
input1=drawHistogram(input);
setappdata(0,'filename',input1);
setappdata(0,'filename',input);
axes(handles.axes2);
imshow(input)
axes(handles.axes3);
imshow(input1)



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
    input=drawHistogram(a)
    axes(handles.axes2);
    imshow(a_gray)
    axes(handles.axes6);
    imshow(input)
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
a = uigetfile();
filename= a;
setappdata(0,'filename',filename);
a = imread(a);
input=drawHistogram(a);
axes(handles.axes1)
imshow(a);
axes(handles.axes7)
imshow(input);
setappdata(0,'a',a)
setappdata(0,'filename',a);
result=uint8(a);

function Exit_Callback(hObject, eventdata, handles)
msgbox('Thanks For Using Image Processing Tool')
pause(1)
close();
close();

function Reset_Callback(hObject, eventdata, handles)
% ax1 = handles.axes1;
% ax2 = handles.axes2;
% cla(ax1, 'reset');
% cla(ax2, 'reset');
% set(ax1, 'Color', 'k');
% set(ax2, 'Color', 'k');
% a = ' ' ;
% sx  = num2str(a);
% set(handles.Ente_option_Binary,'string' ,sx);
% set(handles.size_ava,'string' ,sx);
% set(handles.Size_miden,'string' ,sx);
% set(handles.ma,'string' ,sx);
% set(handles.Size_Min,'string' ,sx);
% set(handles.size_glpf,'string' ,sx);
% set(handles.Size_IdleLBF,'string' ,sx);
% set(handles.d0blbf,'string' ,sx);
% set(handles.nblbf,'string' ,sx);
% set(handles.size_midpoint,'string' ,sx);
% set(handles.T_Sobelv,'string' ,sx);
% set(handles.Point_T,'string' ,sx);
% set(handles.T_Robertv,'string' ,sx);
% set(handles.T_Robletn,'string' ,sx);
% set(handles.T_Sobeln,'string' ,sx);
% set(handles.T_Sobel_DL,'string' ,sx);
% set(handles.T_Robelrt_DL,'string' ,sx);
% set(handles.T_Sobel_DR,'string' ,sx);
% set(handles.T_Robert_DR,'string' ,sx);
% set(handles.GHBFD0,'string' ,sx);
% set(handles.Ideal_HBFD0,'string' ,sx);
% set(handles.BHPF_D0,'string' ,sx);
% set(handles.BHPF_N,'string' ,sx);
% set(handles.Reszie_Value,'string' ,sx);
% set(handles.New_Max,'string' ,sx);
% set(handles.New_Min,'string' ,sx);
% set(handles.Enter_operate,'string' ,sx);
% set(handles.Salt_pepper_BS,'string' ,sx);
% set(handles.Salt_pepper_BB,'string' ,sx);
% set(handles.a_Erlang,'string' ,sx);
% set(handles.b_Erlang,'string' ,sx);
% set(handles.Gaussian_B,'string' ,sx);
% set(handles.Gaussian_M,'string' ,sx);
% set(handles.Enter_gamma,'string' ,sx);
% set(handles.Rayleigh_A,'string' ,sx);
% set(handles.Rayleigh_B,'string' ,sx);
% set(handles.Uniform_A,'string' ,sx);
% set(handles.Uniform_B,'string' ,sx);
% set(handles.Exponentioal_A,'string' ,sx);
a=getappdata(0,'a');
input=drawHistogram(a);
imshow(a);
axes(handles.axes7)
imshow(input);
axes(handles.axes2)
imshow(a);





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
a=getappdata(0,'a');
input=a;
input=EdgeDetection(input);
input1=drawHistogram(input);
setappdata(0,'filename',input1);
setappdata(0,'filename',input);
axes(handles.axes2);
imshow(input)
axes(handles.axes3);
imshow(input1)

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

% import the background imagepre and show it on the axes

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
input=drawHistogram(a);
a=Pointsharpening(a);
axes(handles.axes2);
imshow(a);
axes(handles.axes7);
imshow(input);






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
a=diagonalLeftsharp(a);
axes(handles.axes2);
imshow(a);





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
input=a;
input=DM_0L(input,x1);
input1=drawHistogram(input);
setappdata(0,'filename',input);
axes(handles.axes2);
imshow(input)
axes(handles.axes6);
imshow(input1)




% --- Executes on button press in Erosion.
function Erosion_Callback(hObject, eventdata, handles)
x1 = get(handles.Reszie_Value, 'string');
x1 = str2num(x1);
a = getappdata(0,'a');
input=DM_1_order(a,x1);
setappdata(0,'filename',input);
axes(handles.axes2);
imshow(input)

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
Salt_pepper =saltandpepper(a,x1,x2);
input=drawHistogram(Salt_pepper);
axes(handles.axes2);
imshow(Salt_pepper)
axes(handles.axes6);
imshow(input)
setappdata(0,'filename',Salt_pepper);


% --- Executes on button press in Uniform.
function Uniform_Callback(hObject, eventdata, handles)
x1 = get(handles.Uniform_A, 'string');
x1 = str2num(x1);
x2 = get(handles.Uniform_B, 'string');
x2 = str2num(x2);
a = getappdata(0,'a');
Un = uniformnoise(a,x1,x2);
input=drawHistogram(Un);
axes(handles.axes2);
imshow(Un);
axes(handles.axes6);
imshow(input);


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
Gaussian =guassiannoise(a,x1,x2);
input=drawHistogram(Gaussian);
axes(handles.axes2);
imshow(Gaussian)
axes(handles.axes6);
imshow(input)
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


% --- Executes on button press in unsharp.
function unsharp_Callback(hObject, eventdata, handles)
% hObject    handle to unsharp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
input=a;
input=unsharp(input);
input1=drawHistogram(input);
setappdata(0,'filename',input1);
setappdata(0,'filename',input);
axes(handles.axes2);
imshow(input)
axes(handles.axes6);
imshow(input1)



function f1_Callback(hObject, eventdata, handles)
% hObject    handle to f1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of f1 as text
%        str2double(get(hObject,'String')) returns contents of f1 as a double


% --- Executes during object creation, after setting all properties.
function f1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function f2_Callback(hObject, eventdata, handles)
% hObject    handle to f2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of f2 as text
%        str2double(get(hObject,'String')) returns contents of f2 as a double


% --- Executes during object creation, after setting all properties.
function f2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton59.
function pushbutton59_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton59 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x1 = get(handles.f1, 'string');
x1 = str2num(x1);
x2 = get(handles.f2, 'string');
x2= str2num(x2);
a = getappdata(0,'a');
input=RM_0_order(a,x1,x2);
setappdata(0,'filename',input);
axes(handles.axes2);
imshow(input)


% --- Executes on button press in pushbutton60.
x1 = get(handles.f1, 'string');
x1 = str2num(x1);
x2 = get(handles.f2, 'string');
x2= str2num(x2);
a = getappdata(0,'a');
input=RM_1_order(a,x1,x2);
setappdata(0,'filename',input);
axes(handles.axes2);
imshow(input)
% hObject    handle to pushbutton60 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton61.
function pushbutton61_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton61 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x1 = get(handles.f1, 'string');
x1 = str2num(x1);
x2 = get(handles.f2, 'string');
x2= str2num(x2);
a = getappdata(0,'a');
input=RM_1_order(a,x1,x2);
setappdata(0,'filename',input);
axes(handles.axes2);
imshow(input)


% --- Executes on button press in pushbutton62.
function pushbutton62_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton62 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NewMax = get(handles.New_Max, 'string');
NewMax = str2num(NewMax);
NewMin = get(handles.New_Min, 'string');
NewMin = str2num(NewMin);
a = getappdata(0,'a');
input1=drawHistogram(a);
lowContrast = applylowContrast(a,NewMin,NewMax);
axes(handles.axes2);
imshow(lowContrast)
axes(handles.axes6);
imshow(input1)
setappdata(0,'filename',input1);
setappdata(0,'filename',lowContrast);


% --- Executes on button press in pushbutton70.
function pushbutton70_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton70 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
input=SingleColorChanel(a);
input1=drawHistogram(input);
setappdata(0,'filename',input);
axes(handles.axes2);
imshow(input)
axes(handles.axes6);
imshow(input1)


% --- Executes on button press in pushbutton71.
function pushbutton71_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton71 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
input=a;
input=Decompositing(input);
input1=drawHistogram(input);
setappdata(0,'filename',input);
axes(handles.axes2);
imshow(input)
axes(handles.axes6);
imshow(input1)

% --- Executes on button press in pushbutton72.
function pushbutton72_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton72 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
input=a;
input=ConvertToGrayDesturation(input);
input1=drawHistogram(input);
setappdata(0,'filename',input);
axes(handles.axes2);
imshow(input)
axes(handles.axes6);
imshow(input1)


% --- Executes on button press in pushbutton73.
function pushbutton73_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton73 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
input=a;
input=Averaging(input);
input1=drawHistogram(input);
setappdata(0,'filename',input);
axes(handles.axes2);
imshow(input)
axes(handles.axes6);
imshow(input1)



% --- Executes on button press in pushbutton74.
function pushbutton74_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton74 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
input=a;
input=ConvertToGray(input);
input1=drawHistogram(input);
setappdata(0,'filename',input);
axes(handles.axes2);
imshow(input)
axes(handles.axes6);
imshow(input1)


% --- Executes on button press in pushbutton75.
function pushbutton75_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton75 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x1 = get(handles.ms, 'string');
x1 = str2num(x1);
a = getappdata(0,'a');
input=drawHistogram(a);
mean =MeanFilter(a,x1);
input1=drawHistogram(mean);
axes(handles.axes2);
imshow(mean)
axes(handles.axes7);
imshow(input)
axes(handles.axes6);
imshow(input)
setappdata(0,'filename',mean);




function ms_Callback(hObject, eventdata, handles)
% hObject    handle to ms (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ms as text
%        str2double(get(hObject,'String')) returns contents of ms as a double


% --- Executes during object creation, after setting all properties.
function ms_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ms (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton76.
function pushbutton76_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton76 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x1 = get(handles.mid, 'string');
x1 = str2num(x1);
a = getappdata(0,'a');
input=drawHistogram(a);
a=midpointfilter(a,x1);
input1=drawHistogram(a);
axes(handles.axes2);
imshow(a);
axes(handles.axes7);
imshow(input);
axes(handles.axes6);
imshow(input1);



function mid_Callback(hObject, eventdata, handles)
% hObject    handle to mid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mid as text
%        str2double(get(hObject,'String')) returns contents of mid as a double


% --- Executes during object creation, after setting all properties.
function mid_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton77.
function pushbutton77_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton77 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
input=EdgeDetection(a);
input1=drawHistogram(input);
setappdata(0,'filename',input1);
setappdata(0,'filename',input);
axes(handles.axes2);
imshow(input)
axes(handles.axes6);
imshow(input1)




function GM_Callback(hObject, eventdata, handles)
% hObject    handle to GM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of GM as text
%        str2double(get(hObject,'String')) returns contents of GM as a double


% --- Executes during object creation, after setting all properties.
function GM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit49_Callback(hObject, eventdata, handles)
% hObject    handle to edit49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit49 as text
%        str2double(get(hObject,'String')) returns contents of edit49 as a double


% --- Executes during object creation, after setting all properties.
function edit49_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit50_Callback(hObject, eventdata, handles)
% hObject    handle to edit50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit50 as text
%        str2double(get(hObject,'String')) returns contents of edit50 as a double


% --- Executes during object creation, after setting all properties.
function edit50_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit57_Callback(hObject, eventdata, handles)
% hObject    handle to New_Max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of New_Max as text
%        str2double(get(hObject,'String')) returns contents of New_Max as a double


% --- Executes during object creation, after setting all properties.
function edit57_CreateFcn(hObject, eventdata, handles)
% hObject    handle to New_Max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton82.
function pushbutton82_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton82 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    input = getimage(handles.axes1);
    result = getimage(handles.axes6);
    % Call histogramMatching function
    outputImage = Histogram_Matching(input, result);
    % Draw histogram for the modified imagepre
    outputHistogram = drawHistogram(outputImage);
    % Set the 'filename' appdata with the modified imagepre
    setappdata(0, 'filename', outputImage);
    % Display the modified imagepre in axes
    axes(handles.axes2);
    imshow(outputImage);
    % Display the histogram of the modified imagepre in another axes
    axes(handles.axes7);
    imshow(outputHistogram);

% --- Executes on button press in pushbutton83.
function pushbutton83_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton83 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton90.
function pushbutton90_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton90 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = uigetfile();
filename= a;
setappdata(0,'filename',filename);
a = imread(a);
axes(handles.axes6)
imshow(a);
setappdata(0,'a',a)
setappdata(0,'filename',a);


% --- Executes on button press in pushbutton91.
function pushbutton91_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton91 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = getimage(handles.axes1);
    result =getimage(handles.axes6);
    % Call histogramMatching function
    outputImage = SubtractImages(input, result);
    % Draw histogram for the modified imagepre
    outputHistogram = drawHistogram(outputImage);
    % Set the 'filename' appdata with the modified imagepre
    setappdata(0, 'filename', outputImage);
    % Display the modified imagepre in axes
    axes(handles.axes2);
    imshow(outputImage);
    % Display the histogram of the modified imagepre in another axes
    axes(handles.axes7);
    imshow(outputHistogram);


% --- Executes on button press in pushbutton92.
function pushbutton92_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton92 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = getimage(handles.axes1);
    result = getimage(handles.axes6);
    % Call histogramMatching function
    outputImage = add(input, result);
    % Draw histogram for the modified imagepre
    outputHistogram = drawHistogram(outputImage);
    % Set the 'filename' appdata with the modified imagepre
    setappdata(0, 'filename', outputImage);
    % Display the modified imagepre in axes
    axes(handles.axes2);
    imshow(outputImage);
    % Display the histogram of the modified imagepre in another axes
    axes(handles.axes7);
    imshow(outputHistogram);


% --- Executes on button press in pushbutton93.
function pushbutton93_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton93 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x1 = get(handles.sig, 'string');
x1 = str2num(x1);
a = getappdata(0,'a');
input=drawHistogram(a);
a=GuassianFilter(a,x1);
input1=drawHistogram(a);
axes(handles.axes2);
imshow(a);
axes(handles.axes7);
imshow(input);
axes(handles.axes6);
imshow(input1);


function sigma_Callback(hObject, eventdata, handles)
% hObject    handle to sigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sigma as text
%        str2double(get(hObject,'String')) returns contents of sigma as a double


% --- Executes during object creation, after setting all properties.
function sigma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton94.
function pushbutton94_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton94 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x1 = get(handles.GM, 'string');
x1 = str2num(x1);
a=getappdata(0,'a');
input=a;
input=FixNoiseWithMeanFilter(input,x1);
input1=drawHistogram(input);
setappdata(0,'filename',input1);
setappdata(0,'filename',input);
axes(handles.axes2);
imshow(input)
axes(handles.axes6);
imshow(input1)


% --- Executes on button press in pushbutton95.
function pushbutton95_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton95 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = getappdata(0,'a');
a_gray = negative(a);
input=drawHistogram(a_gray);
axes(handles.axes2);
imshow(a_gray)
axes(handles.axes6);
imshow(input)
setappdata(0,'filename',a_gray);


% --- Executes on button press in pushbutton96.
function pushbutton96_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton96 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x1 = get(handles.Enter_gamma, 'string');
x1 = str2num(x1);
a = getappdata(0,'a');
a_gray = Gamma(a,x1);
input=drawHistogram(a_gray);
axes(handles.axes2);
imshow(a_gray)
axes(handles.axes6);
imshow(input)
setappdata(0,'filename',a_gray);



function edit59_Callback(hObject, eventdata, handles)
% hObject    handle to Enter_gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Enter_gamma as text
%        str2double(get(hObject,'String')) returns contents of Enter_gamma as a double


% --- Executes during object creation, after setting all properties.
function edit59_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Enter_gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton97.
function pushbutton97_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton97 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
input=EdgeDetection(a);
input1=drawHistogram(input);
setappdata(0,'filename',input1);
setappdata(0,'filename',input);
axes(handles.axes2);
imshow(input)
axes(handles.axes6);
imshow(input1)



function edit60_Callback(hObject, eventdata, handles)
% hObject    handle to GM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of GM as text
%        str2double(get(hObject,'String')) returns contents of GM as a double


% --- Executes during object creation, after setting all properties.
function edit60_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sig_Callback(hObject, eventdata, handles)
% hObject    handle to sig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sig as text
%        str2double(get(hObject,'String')) returns contents of sig as a double


% --- Executes during object creation, after setting all properties.
function sig_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function pushbutton72_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton72 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton98.
function pushbutton98_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton98 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x1 = get(handles.sig, 'string');
x1 = str2num(x1);
a=getappdata(0,'a');
input=a;
input=GuassianFilter(input,x1);
input1=drawHistogram(input);
setappdata(0,'filename',input1);
setappdata(0,'filename',input);
axes(handles.axes2);
imshow(input)
axes(handles.axes6);
imshow(input1)





function edit62_Callback(hObject, eventdata, handles)
% hObject    handle to ma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ma as text
%        str2double(get(hObject,'String')) returns contents of ma as a double


% --- Executes during object creation, after setting all properties.
function edit62_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton99.
function pushbutton99_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton99 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
input=a;
input=weightfilter(input);
input1=drawHistogram(input);
setappdata(0,'filename',input1);
setappdata(0,'filename',input);
axes(handles.axes2);
imshow(input)
axes(handles.axes6);
imshow(input1)



function wi_Callback(hObject, eventdata, handles)
% hObject    handle to wi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wi as text
%        str2double(get(hObject,'String')) returns contents of wi as a double


% --- Executes during object creation, after setting all properties.
function wi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton100.
function pushbutton100_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton100 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton101.
function pushbutton101_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton101 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x1 = get(handles.q, 'string');
x1 = str2num(x1);
a = getappdata(0,'a');
input1=drawHistogram(a);
a=quantizeImage(a,x1);
input2=drawHistogram(a);
axes(handles.axes2);
imshow(a);
axes(handles.axes7);
imshow(input1);
axes(handles.axes6);
imshow(input2);




function q_Callback(hObject, eventdata, handles)
% hObject    handle to q (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q as text
%        str2double(get(hObject,'String')) returns contents of q as a double


% --- Executes during object creation, after setting all properties.
function q_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton103.
function pushbutton103_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton103 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit65_Callback(hObject, eventdata, handles)
% hObject    handle to Size_miden (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Size_miden as text
%        str2double(get(hObject,'String')) returns contents of Size_miden as a double


% --- Executes during object creation, after setting all properties.
function edit65_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Size_miden (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
