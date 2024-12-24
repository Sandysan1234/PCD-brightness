function varargout = uas_pcd_kel2(varargin)
% UAS_PCD_KEL2 MATLAB code for uas_pcd_kel2.fig
%      UAS_PCD_KEL2, by itself, creates a new UAS_PCD_KEL2 or raises the existing
%      singleton*.
%
%      H = UAS_PCD_KEL2 returns the handle to a new UAS_PCD_KEL2 or the handle to
%      the existing singleton*.
%
%      UAS_PCD_KEL2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UAS_PCD_KEL2.M with the given input arguments.
%
%      UAS_PCD_KEL2('Property','Value',...) creates a new UAS_PCD_KEL2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before uas_pcd_kel2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to uas_pcd_kel2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help uas_pcd_kel2

% Last Modified by GUIDE v2.5 24-Dec-2024 17:32:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @uas_pcd_kel2_OpeningFcn, ...
                   'gui_OutputFcn',  @uas_pcd_kel2_OutputFcn, ...
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


% --- Executes just before uas_pcd_kel2 is made visible.
function uas_pcd_kel2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to uas_pcd_kel2 (see VARARGIN)

% Choose default command line output for uas_pcd_kel2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes uas_pcd_kel2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = uas_pcd_kel2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({'*.jpg';'*.png';'*.*'});
citra = imread([pathname, filename]);
axes(handles.axes1);
imshow(citra);

handles.citraInput = citra;
guidata(hObject, handles);

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
%panggil citra input
foto = handles.citraInput;
%ambil nilai slider
nilai = get(handles.slider1,'value');
%proses brightness
cerah = foto + nilai ;
%tentukan tempat tampilan output
axes(handles.axes2);
%tampilkan output
imshow(cerah);
