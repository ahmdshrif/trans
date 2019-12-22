function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 15-Dec-2018 23:18:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled

handles.output = hObject;
if isfield(handles, 'metricdata') && ~isreset
    return;
end
handles.metricdata.Vn = 0 ;
handles.metricdata.In = 0 ;
handles.metricdata.Pn = 0 ;
handles.metricdata.Vsc= 0 ;
handles.metricdata.Isc= 0 ;
handles.metricdata.Psc= 0 ;

 
% Update handles structure
guidata(hObject, handles);


% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
myImage1 = imread('C:\Users\ahmed\Desktop\trans\a.png');
myImage2 = imread('C:\Users\ahmed\Desktop\trans\b.jpg');
axes(handles.axes1);
imshow(myImage1)
axes(handles.axes2);
imshow(myImage2)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in calculate.
function calculate_Callback(hObject, eventdata, handles)
% hObject    handle to calculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
theta = acos(handles.metricdata.Pn / ( handles.metricdata.Vn * handles.metricdata.In));
Ie = handles.metricdata.In * cos(theta);
Re = handles.metricdata.Vn / Ie ;
set(handles.out_Re_h , 'string' , Re);
Im = handles.metricdata.In * sin(theta);
Xm =  handles.metricdata.Vn / Im;
set(handles.out_Xm , 'string' , Xm);
Raq = handles.metricdata.Psc / handles.metricdata.Isc^2 ;
set(handles.out_Raq , 'string' , Raq);
Xaq =(sqrt((handles.metricdata.Vsc / handles.metricdata.Isc )^2  - Raq^2));
set(handles.out_Xaq , 'string' , Xaq);








function Isc_Callback(hObject, eventdata, handles)
% hObject    handle to Isc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Isc = str2double(get(hObject, 'String'));
if isnan(Isc)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end 

handles.metricdata.Isc = Isc;
guidata(hObject,handles) 

% Hints: get(hObject,'String') returns contents of Isc as text
%        str2double(get(hObject,'String')) returns contents of Isc as a double


% --- Executes during object creation, after setting all properties.
function Isc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Isc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Vsc_Callback(hObject, eventdata, handles)
% hObject    handle to Vsc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Vsc = str2double(get(hObject, 'String'));
if isnan(Vsc)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end 

handles.metricdata.Vsc = Vsc;
guidata(hObject,handles) 

% --- Executes during object creation, after setting all properties.
function Vsc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vsc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Psc_Callback(hObject, eventdata, handles)
% hObject    handle to Psc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Psc = str2double(get(hObject, 'String'));
if isnan(Psc)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end 

handles.metricdata.Psc = Psc;
guidata(hObject,handles) 


% --- Executes during object creation, after setting all properties.
function Psc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Psc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Vn_Callback(hObject, eventdata, handles)
% hObject    handle to Vn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Vn = str2double(get(hObject, 'String'));
if isnan(Vn)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end 

handles.metricdata.Vn = Vn;
guidata(hObject,handles) 



% --- Executes during object creation, after setting all properties.
function Vn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function In_Callback(hObject, eventdata, handles)
% hObject    handle to In (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
In = str2double(get(hObject, 'String'));
if isnan(In)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end 

handles.metricdata.In = In;
guidata(hObject,handles) 



% --- Executes during object creation, after setting all properties.
function In_CreateFcn(hObject, eventdata, handles)
% hObject    handle to In (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pn_Callback(hObject, eventdata, handles)
% hObject    handle to Pn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Pn = str2double(get(hObject, 'String'));
if isnan(Pn)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end 

handles.metricdata.Pn = Pn;
guidata(hObject,handles) 


% --- Executes during object creation, after setting all properties.
function Pn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function out_Re_h_Callback(hObject, eventdata, handles)
% hObject    handle to out_Re_h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of out_Re_h as text
%        str2double(get(hObject,'String')) returns contents of out_Re_h as a double


% --- Executes during object creation, after setting all properties.
function out_Re_h_CreateFcn(hObject, eventdata, handles)
% hObject    handle to out_Re_h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function out_Xm_Callback(hObject, eventdata, handles)
% hObject    handle to out_Xm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of out_Xm as text
%        str2double(get(hObject,'String')) returns contents of out_Xm as a double


% --- Executes during object creation, after setting all properties.
function out_Xm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to out_Xm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function out_Raq_Callback(hObject, eventdata, handles)
% hObject    handle to out_Raq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of out_Raq as text
%        str2double(get(hObject,'String')) returns contents of out_Raq as a double


% --- Executes during object creation, after setting all properties.
function out_Raq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to out_Raq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function out_Xaq_Callback(hObject, eventdata, handles)
% hObject    handle to out_Xaq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of out_Xaq as text
%        str2double(get(hObject,'String')) returns contents of out_Xaq as a double


% --- Executes during object creation, after setting all properties.
function out_Xaq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to out_Xaq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.out_Re_h , 'string' , 0);
set(handles.out_Xm , 'string' , 0);
set(handles.out_Raq , 'string' , 0);
set(handles.out_Xaq , 'string' , 0);
handles.metricdata.Pn = 0 ;
handles.metricdata.In = 0 ;
handles.metricdata.Vn = 0 ;
handles.metricdata.Psc = 0 ;
handles.metricdata.Isc = 0 ;
handles.metricdata.Vsc = 0 ;
handles.metricdata.out_Re_h = 0;
handles.metricdata.out_Xm = 0;
handles.metricdata.out_Raq = 0;
handles.metricdata.out_Xaq = 0;

set(handles.Vn , 'string' , handles.metricdata.Vn);
set(handles.In , 'string' , 0);
set(handles.Pn , 'string' , 0);
set(handles.Vsc , 'string' , 0);
set(handles.Isc , 'string' , 0);
set(handles.Psc , 'string' , 0);






