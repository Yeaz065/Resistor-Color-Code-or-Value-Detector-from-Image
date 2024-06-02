function varargout = Graphical_interface(varargin)
% GRAPHICAL_INTERFACE MATLAB code for Graphical_interface.fig
%      GRAPHICAL_INTERFACE, by itself, creates a new GRAPHICAL_INTERFACE or raises the existing
%      singleton*.
%
%      H = GRAPHICAL_INTERFACE returns the handle to a new GRAPHICAL_INTERFACE or the handle to
%      the existing singleton*.
%
%      GRAPHICAL_INTERFACE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GRAPHICAL_INTERFACE.M with the given input arguments.
%
%      GRAPHICAL_INTERFACE('Property','Value',...) creates a new GRAPHICAL_INTERFACE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Graphical_interface_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Graphical_interface_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Graphical_interface

% Last Modified by GUIDE v2.5 21-Jul-2021 19:54:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Graphical_interface_OpeningFcn, ...
                   'gui_OutputFcn',  @Graphical_interface_OutputFcn, ...
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


% --- Executes just before Graphical_interface is made visible.
function Graphical_interface_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Graphical_interface (see VARARGIN)

% Choose default command line output for Graphical_interface
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Graphical_interface wait for user response (see UIRESUME)
% uiwait(handles.figure);
axes(handles.axes3)
imshow('buet_logo.png')

% Adding image in background
ah = axes('unit', 'normalized', 'position', [0 0 1 1]); 
bg = imread('background.jpg'); imagesc(bg);
set(ah,'handlevisibility','off','visible','off')
uistack(ah, 'bottom');

% --- Outputs from this function are returned to the command line.
function varargout = Graphical_interface_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname] = uigetfile({'*.jpg';'*.jpeg'},'File Selector');
imageres= strcat(pathname, filename);
set(handles.pathname, 'string',imageres );
%axes(handles.axes2)
%imshow(imageres)
run('Main_script.m')






% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;
run('Graphical_interface.m')
