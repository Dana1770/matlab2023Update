function varargout = project(varargin)
% PROJECT MATLAB code for project.fig
%      PROJECT, by itself, creates a new PROJECT or raises the existing
%      singleton*.
%
%      H = PROJECT returns the handle to a new PROJECT or the handle to
%      the existing singleton*.
%
%      PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT.M with the given input arguments.
%
%      PROJECT('Property','Value',...) creates a new PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help project

% Last Modified by GUIDE v2.5 21-Dec-2021 19:48:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @project_OpeningFcn, ...
                   'gui_OutputFcn',  @project_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before project is made visible.
function project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to project (see VARARGIN)

% Choose default command line output for project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
path=uigetimagefile();
img=imread(path);
imshow(img,[],'Parent',handles.axes1);
handles.img=img;
guidata(hObject,handles);
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)

% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% Max Filter
% Min Filter
% Midpoint Filter
% Median Filter
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
img=handles.img;
val=get(handles.popupmenu1,'value');
str=get(handles.popupmenu1,'string');
if(str(val)=="GRAY To Binary")
     threshold = str2double(inputdlg('Enter value of threshold'));
    new=GrayTwoBinary(img,threshold);
    axes(handles.axes2);
    imshow(new);
elseif(str(val)=="RGB To GRAY")
    option = str2double(inputdlg('Enter value of option'));
    new=RgbTwoGray(img,option);
    axes(handles.axes2);
    imshow(new);
elseif(str(val)=="Equalization")
     new=equalization(img);
    axes(handles.axes2);
    imshow(new);
    
elseif(str(val)=="RGB To Binary")
    prompt = {'Enter value of option:','Enter value of threshold'};
    answer = inputdlg(prompt);
    option = str2num(answer{1});
    threshold = str2num(answer{2});
    new=RgbTwoBinary(img,option,threshold);
    axes(handles.axes2);
    imshow(new);
elseif(str(val)=="Brightness and Darkness")
    prompt = {'Enter number to increase or decrease:','Enter value of option + or - or * or /'};
    answer = inputdlg(prompt);
    number = str2num(answer{1});
    option =(answer{2});
    new=BrightnessAndDarkness(img,number,option);
    axes(handles.axes2);
    imshow(new);
elseif(str(val)=="Contrast Streching")
      prompt = {'Enter value of new minimum:','Enter value of new maximum '};
    answer = inputdlg(prompt);
    newmin = str2num(answer{1});
    newmax =str2num(answer{2});
    new=ContrastStretching (img,newmin,newmax);
    imshow(new,[],'Parent',handles.axes2);
    axes(handles.axes2);
    imshow(new);
    elseif(str(val)=="Log")
    prompt = {'Enter constant '};
    answer = inputdlg(prompt);
    number = str2num(answer{1});
    new=loge(img,number);
    axes(handles.axes2);
    imshow(new);
elseif(str(val)=="Negative")
    new=negative(img);
    axes(handles.axes2);
    imshow(new);
    elseif(str(val)=="Gamma")
    prompt = {'Enter number ','enter constant '};
    answer = inputdlg(prompt);
    number = str2num(answer{1});
    constant = str2num(answer{2});
    new=gama(img,number,constant);
    axes(handles.axes2);
    imshow(new);
elseif(str(val)=="Identity")
      new= identity(img);
      axes(handles.axes2);
    imshow(new);
elseif(str(val)=="Inverse Log")
    prompt = {'enter constant '};
    answer = inputdlg(prompt);
    constant = str2num(answer{1});
    new=inverseloge(img,constant);
    axes(handles.axes2);
    imshow(new);
 elseif(str(val)=="Root")
    prompt = {'enter constant '};
    answer = inputdlg(prompt);
    constant = str2num(answer{1});
    new=root(img,constant);
    axes(handles.axes2);
    imshow(new);
    elseif(str(val)=="Mean Filter")
    prompt = {'enter size of filter ','option for padding with zero or ignore border or dublicate'};
    answer = inputdlg(prompt);
    size = str2num(answer{1});
    option = str2num(answer{2});
    new=meanfilter(img,size,option);
    axes(handles.axes2);
    imshow(new);
elseif(str(val)=="Weight Filter")
    prompt = {'option for padding with zero or ignore border or dublicate'};
    answer = inputdlg(prompt);
    option = str2num(answer{1});
    new= weightfilter(img,option);
    axes(handles.axes2);
    imshow(new);
   elseif(str(val)=="Point Detection")
    prompt = {'option for padding with zero or ignore border or dublicate'};
    answer = inputdlg(prompt);
    option = str2num(answer{1});
    new= pointdetection(img,option);
    axes(handles.axes2);
    imshow(new);
    elseif(str(val)=="Point Sharpling")
    prompt = {'option for padding with zero or ignore border or dublicate'};
    answer = inputdlg(prompt);
    option = str2num(answer{1});
    new= pointsharpling(img,option);
    axes(handles.axes2);
    imshow(new);
    elseif(str(val)=="Min Filter")
    prompt = {'size of filter ','option for padding with zero or ignore border or dublicate'};
    answer = inputdlg(prompt);
    size = str2num(answer{1});
    option = str2num(answer{2});
    new= minfilter(img,size,option);
    axes(handles.axes2);
    imshow(new);
    elseif(str(val)=="Max Filter")
    prompt = {'size of filter ','option for padding with zero or ignore border or dublicate'};
    answer = inputdlg(prompt);
    size = str2num(answer{1});
    option = str2num(answer{2});
    new= maxfilter(img,size,option);
    axes(handles.axes2);
    imshow(new);
    elseif(str(val)=="Median Filter")
    prompt = {'size of filter ','option for padding with zero or ignore border or dublicate'};
    answer = inputdlg(prompt);
    size = str2num(answer{1});
    option = str2num(answer{2});
    new= medfilter(img,size,option);
    axes(handles.axes2);
    imshow(new);
    elseif(str(val)=="Midpoint Filter")
    prompt = {'size of filter ','option for padding with zero or ignore border or dublicate'};
    answer = inputdlg(prompt);
    size = str2num(answer{1});
    option = str2num(answer{2});
    new= midfilter(img,size,option);
    axes(handles.axes2);
    imshow(new);
elseif(str(val)=="Histogram")
    histogram(img); 
    elseif(str(val)=="Butter Worth Low Pass Filter")
    prompt = {'enter value of D0 '};
    answer = inputdlg(prompt);
    D = str2num(answer{1});
    new= butterworthlowpass(img,D);
    axes(handles.axes2);
    imshow(new);
    elseif(str(val)=="Butter Worth High Pass Filter")
    prompt = {'enter value of D0 '};
    answer = inputdlg(prompt);
    D = str2num(answer{1});
    new= butterworthhighpass(img,D);
    axes(handles.axes2);
    imshow(new);
    elseif(str(val)=="Ideal High Pass Filter")
    prompt = {'enter value of D0 '};
    answer = inputdlg(prompt);
    D = str2num(answer{1});
    new=  idealhighpass(img,D);
    axes(handles.axes2);
    imshow(new);
    elseif(str(val)=="Ideal low Pass Filter")
    prompt = {'enter value of D0 '};
    answer = inputdlg(prompt);
    D = str2num(answer{1});
    new=ideallowpass(img,D);
    axes(handles.axes2);
    imshow(new);
    elseif(str(val)=="Gaussian low Pass Filter")
    prompt = {'enter value of D0 '};
    answer = inputdlg(prompt);
    D = str2num(answer{1});
    new= gaussianlowpass(img,D);
    axes(handles.axes2);
    imshow(new);
    elseif(str(val)=="Gaussian High Pass Filter")
    prompt = {'enter value of D0 '};
    answer = inputdlg(prompt);
    D = str2num(answer{1});
    new=gaussianhighpass(img,D);
    axes(handles.axes2);
    imshow(new);
     elseif(str(val)=="Salt&Pepper")
    prompt = {'enter probabelty of salt ',' enter probabelty of pepper'};
    answer = inputdlg(prompt);
    ps = str2num(answer{1});
    pp = str2num(answer{2});
    new=saltandpepper(img,ps,pp);
    axes(handles.axes2);
    imshow(new);
     elseif(str(val)=="Exponential_noise")
    prompt = {'enter number'};
    answer = inputdlg(prompt);
    a = str2num(answer{1});
    new=exponentialnoise(img,a);
    axes(handles.axes2);
    imshow(new);
     elseif(str(val)=="Guassian_noise")
    prompt = {'enter mean','enter segma'};
    answer = inputdlg(prompt);
    mean = str2num(answer{1});
    segma = str2num(answer{2});
    new=guassiannoise(img,mean,segma);
    axes(handles.axes2);
    imshow(new);
    elseif(str(val)=="Rayleigh_noise")
    prompt = {'enter first number','enter second number'};
    answer = inputdlg(prompt);
    a = str2num(answer{1});
   b = str2num(answer{2});
    new=rayleighnoise(img,a,b);
    axes(handles.axes2);
    imshow(new);
     elseif(str(val)=="Uniform_noise")
    prompt = {'enter first gray level','enter second gray level'};
    answer = inputdlg(prompt);
    a = str2num(answer{1});
   b = str2num(answer{2});
    new=uniformnoise(img,a,b);
    axes(handles.axes2);
    imshow(new);
     elseif(str(val)=="Gamma_noise")
    prompt = {'enter first number','enter second number'};
    answer = inputdlg(prompt);
    a = str2num(answer{1});
   b = str2num(answer{2});
    new=erlanggamma(img,a,b);
    axes(handles.axes2);
    imshow(new);
     elseif(str(val)=="Line Detection")
    prompt = {'enter 1 for sobel filter or 2 for robert mask','enter 1 for horizontal detection or 2 for vertical detection or 3 for  left diagonal detection or 4 for  left diagonal detection','enter 1 for padding 0 or 2 for ignore border or 3 for dublicate'};
    answer = inputdlg(prompt);
    a = str2num(answer{1});
    b = str2num(answer{2});
    c = str2num(answer{3});
    new=linedetection(img,a,b,c);
    axes(handles.axes2);
    imshow(new);
     elseif(str(val)=="Line Sharpling")
    prompt = {'enter 1 for sobel filter or 2 for robert mask','enter 1 for horizontal detection or 2 for vertical detection or 3 for  left diagonal detection or 4 for  left diagonal detection','enter 1 for padding 0 or 2 for ignore border or 3 for dublicate'};
    answer = inputdlg(prompt);
    a = str2num(answer{1});
    b = str2num(answer{2});
    c = str2num(answer{3});
    new=linesharpling(img,a,b,c);
    axes(handles.axes2);
    imshow(new);
end
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
