function varargout = newmrittika(varargin)
% NEWMRITTIKA MATLAB code for newmrittika.fig
%      NEWMRITTIKA, by itself, creates a new NEWMRITTIKA or raises the existing
%      singleton*.
%
%      H = NEWMRITTIKA returns the handle to a new NEWMRITTIKA or the handle to
%      the existing singleton*.
%
%      NEWMRITTIKA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEWMRITTIKA.M with the given input arguments.
%
%      NEWMRITTIKA('Property','Value',...) creates a new NEWMRITTIKA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before newmrittika_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to newmrittika_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help newmrittika

% Last Modified by GUIDE v2.5 21-Aug-2015 21:39:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @newmrittika_OpeningFcn, ...
                   'gui_OutputFcn',  @newmrittika_OutputFcn, ...
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


% --- Executes just before newmrittika is made visible.
function newmrittika_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to newmrittika (see VARARGIN)

% Choose default command line output for newmrittika
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes newmrittika wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = newmrittika_OutputFcn(hObject, eventdata, handles) 
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
a=uigetfile();
filename=a;
setappdata(0,'filename',filename);
a=imread(a);
axes(handles.image_ax);
imshow(a);
setappdata(0,'a',a)
setappdata(0,'filename',a);
plot(handles.image_ax,'a')

% --- Executes on button press in zoom.
function zoom_Callback(hObject, eventdata, handles)
% hObject    handle to zoom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% hObject    handle to toolbar_zoomin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global zoom_use current_object stop_updating;
zoom_use=0;
stop_updating = 0;
h = zoom(handles.del_pwr);
h = zoom(handles.gmag);
set(h,'ActionPostCallback',@mypostcallback);
set(h,'Enable','on');
current_object = gcf;
while zoom_use ==0
    uiwait(gcf);
    pushbutton_redrawsmithchart_Callback(hObject, eventdata, handles)
    if stop_updating == 1
        break;
    end
end

% ----occurs after mouse button up for zoom function
function mypostcallback(obj,evd)
global newLim zoom_use current_object;
newLim = get(evd.Axes,'XLim');
disp(sprintf('The new X-Limits are [%.2f %.2f].',newLim));
zoom_use=1;
axis 'auto y';
disp(zoom_use);
uiresume(current_object);

% --------------------------------------------------------------------
function toolbar_zoomin_OffCallback(hObject, eventdata, handles)
% hObject    handle to toolbar_zoomin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global stop_updating;
zoom off;
stop_updating = 1;








% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

a=getappdata(0,'a');
imshow(a);
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
a_bw=im2bw(a,.57);
axes(handles.image_ax);
imshow(a_bw)
setappdata(0,'filename',a_bw);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

msgbox('Its a beta version full verion will be arriving soon team-Mrittika©')
pause(2);
close();
close();
% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over text1.
function text1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Histogram.
function Histogram_Callback(hObject, eventdata, handles)
% hObject    handle to Histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
input=a;
input=rgb2gray(input);
axes(handles.axes1)
imhist(input);

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
input=a;
gray=rgb2gray(input);
axes(handles.axes1)
imshow(gray);


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

l=imdistline();
msgbox('Measured in Pixels')
dist=getDistance(1)
% --- Executes on button press in gray2binary.
function gray2binary_Callback(hObject, eventdata, handles)
% hObject    handle to gray2binary (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

a=getappdata(0,'a');
input=a;
gray = rgb2gray(input);
adj_img = imadjust(gray, [0.3,0.7],[]);
bw_img = im2bw(adj_img);
axes(handles.axes1)
imshow(bw_img);

% --- Executes on button press in canny.
function canny_Callback(hObject, eventdata, handles)
% hObject    handle to canny (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=getappdata(0,'a');
I=rgb2gray(I);
BW2=edge(I,'canny');
axes(handles.axes1);
imshow(BW2);

% --- Executes on button press in Prewitt.
function Prewitt_Callback(hObject, eventdata, handles)
% hObject    handle to Prewitt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=getappdata(0,'a');
I=rgb2gray(I);
BW2=edge(I,'prewitt');
axes(handles.axes1);
imshow(BW2);


% --- Executes on button press in Bitplan.
function Bitplan_Callback(hObject, eventdata, handles)
% hObject    handle to Bitplan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

a=getappdata(0,'a');
input=a;

img = double(input);
bp0 = mod(img,2);
bp1 = mod(floor(img/2),2);
bp2 = mod(floor(img/4),2);
bp3 = mod(floor(img/8),2);
bp4 = mod(floor(img/16),2);
bp5 = mod(floor(img/32),2);
bp6 = mod(floor(img/64),2);
bp7 = mod(floor(img/128),2);
axes(handles.axes1)
imshow(bp0);title('bit-plane 0:LSB');
imshow(bp1);title('bit-plane 1');
imshow(bp2);title('bit-plane 2');
imshow(bp3);title('bit-plane 3');
imshow(bp4);title('bit-plane 4');
imshow(bp5);title('bit-plane 5');
imshow(bp6);title('bit-plane 6');
imshow(bp7);title('bit-plane 7:MSB');

% --- Executes on button press in contour.
function contour_Callback(hObject, eventdata, handles)
% hObject    handle to contour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)






% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% create an axes that spans the whole gui
ah = axes('unit', 'normalized', 'position', [0 0 1 1]); 
% import the background image and show it on the axes
bg = imread('s2.jpg'); imagesc(bg);
% prevent plotting over the background and turn the axis off
set(ah,'handlevisibility','off','visible','off')
% making sure the background is behind all the other uicontrols
uistack(ah, 'bottom');
