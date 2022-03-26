function varargout = RESPUESTA_TEMPORAL(varargin)
% RESPUESTA_TEMPORAL MATLAB code for RESPUESTA_TEMPORAL.fig
%      RESPUESTA_TEMPORAL, by itself, creates a new RESPUESTA_TEMPORAL or raises the existing
%      singleton*.
%
%      H = RESPUESTA_TEMPORAL returns the handle to a new RESPUESTA_TEMPORAL or the handle to
%      the existing singleton*.
%
%      RESPUESTA_TEMPORAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESPUESTA_TEMPORAL.M with the given input arguments.
%
%      RESPUESTA_TEMPORAL('Property','Value',...) creates a new RESPUESTA_TEMPORAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RESPUESTA_TEMPORAL_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RESPUESTA_TEMPORAL_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RESPUESTA_TEMPORAL

% Last Modified by GUIDE v2.5 10-Jul-2018 19:18:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RESPUESTA_TEMPORAL_OpeningFcn, ...
                   'gui_OutputFcn',  @RESPUESTA_TEMPORAL_OutputFcn, ...
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


% --- Executes just before RESPUESTA_TEMPORAL is made visible.
function RESPUESTA_TEMPORAL_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RESPUESTA_TEMPORAL (see VARARGIN)

% Choose default command line output for RESPUESTA_TEMPORAL
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RESPUESTA_TEMPORAL wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = RESPUESTA_TEMPORAL_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function num_Callback(hObject, eventdata, handles)
% hObject    handle to num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of num as text
%        str2double(get(hObject,'String')) returns contents of num as a double


% --- Executes during object creation, after setting all properties.
function num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function den_Callback(hObject, eventdata, handles)
% hObject    handle to den (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of den as text
%        str2double(get(hObject,'String')) returns contents of den as a double


% --- Executes during object creation, after setting all properties.
function den_CreateFcn(hObject, eventdata, handles)
% hObject    handle to den (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in RESET.
function RESET_Callback(hObject, eventdata, handles)
% hObject    handle to RESET (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.num,'String','0');
set(handles.den,'String','0');
set(handles.Beta,'String','-');
set(handles.tr,'String','-');
set(handles.tp,'String','-');
set(handles.MP,'String','-');
set(handles.ts1,'String','-');
set(handles.ts2,'String','-');
set(handles.E,'String','-');
set(handles.Wn,'String','-');
set(handles.Wd,'String','-');

% --- Executes on button press in EXIT.
function EXIT_Callback(hObject, eventdata, handles)
% hObject    handle to EXIT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(RESPUESTA_TEMPORAL);


% --- Executes on button press in INICIO.
function INICIO_Callback(hObject, eventdata, handles)
% hObject    handle to INICIO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y x t NUM DEN ymax;
syms E WN WD BETA t_subida t_pico sobreelongacion_max t_asentamiento_98percent t_asentamiento_95percent;
num=str2num(get(handles.num,'String'));
den=str2num(get(handles.den,'String'));
NUM=num;
DEN=den;
if isempty(num)
        msgbox('Introduzca un numero en lugar de un caracter en el numerador','Error');
else
end
if isempty(den)
        msgbox('Introduzca un numero en lugar de un caracter en el denominador','Error');
else
end
t=0:0.005:5;
[y,x,t]=step(num,den,t);
r=1;while y(r)<1.0001;r=r+1;end;
t_subida=(r-1)*0.005;
[ymax,tp]=max(y);
sobreelongacion_max=ymax-1;
t_pico=(tp-1)*0.005;
WD=3.1416/t_pico;
E=abs((log(sobreelongacion_max))/sqrt((3.1416^2)+((log(sobreelongacion_max))^2)));
WN=WD/sqrt(1-(E^2));
BETA=atan(WD/(E*WN));
t_asentamiento_95percent=3/(E*WN);
t_asentamiento_98percent=4/(E*WN);
set(handles.Beta,'String',BETA);
set(handles.tr,'String',t_subida);
set(handles.tp,'String',t_pico);
set(handles.E,'String',E);
set(handles.Wn,'String',WN);
set(handles.Wd,'String',WD);
set(handles.MP,'String',sobreelongacion_max);
set(handles.ts1,'String',t_asentamiento_95percent);
set(handles.ts2,'String',t_asentamiento_98percent);

function Beta_Callback(hObject, eventdata, handles)
% hObject    handle to Beta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of Beta as text
%        str2double(get(hObject,'String')) returns contents of Beta as a double
% --- Executes during object creation, after setting all properties.

function Beta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Beta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tr_Callback(hObject, eventdata, handles)
% hObject    handle to tr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tr as text
%        str2double(get(hObject,'String')) returns contents of tr as a double

% --- Executes during object creation, after setting all properties.
function tr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tp_Callback(hObject, eventdata, handles)
% hObject    handle to tp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tp as text
%        str2double(get(hObject,'String')) returns contents of tp as a double


% --- Executes during object creation, after setting all properties.
function tp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MP_Callback(hObject, eventdata, handles)
% hObject    handle to MP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MP as text
%        str2double(get(hObject,'String')) returns contents of MP as a double


% --- Executes during object creation, after setting all properties.
function MP_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ts1_Callback(hObject, eventdata, handles)
% hObject    handle to ts1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ts1 as text
%        str2double(get(hObject,'String')) returns contents of ts1 as a double


% --- Executes during object creation, after setting all properties.
function ts1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ts1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ts2_Callback(hObject, eventdata, handles)
% hObject    handle to ts2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ts2 as text
%        str2double(get(hObject,'String')) returns contents of ts2 as a double


% --- Executes during object creation, after setting all properties.
function ts2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ts2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in opciones.
function opciones_Callback(hObject, eventdata, handles)
% hObject    handle to opciones (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns opciones contents as cell array
%        contents{get(hObject,'Value')} returns selected item from opciones

num=str2num(get(handles.num,'String'));
den=str2num(get(handles.den,'String'));
if isempty(num)
        msgbox('Introduzca un numero en lugar de un caracter en el numerador','Error');
else
end
if isempty(den)
        msgbox('Introduzca un numero en lugar de un caracter en el denominador','Error');
else
end
opcion=get(handles.opciones,'Value');
switch opcion
    case 1
        axes(handles.axes2)
        step(num,den)
    case 2
        axes(handles.axes2)
        rlocus(num,den)
    case 3
        axes(handles.axes2)
        bode(num,den)
end
% --- Executes during object creation, after setting all properties.

function opciones_CreateFcn(hObject, eventdata, handles)
% hObject    handle to opciones (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function E_Callback(hObject, eventdata, handles)
% hObject    handle to E (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of E as text
%        str2double(get(hObject,'String')) returns contents of E as a double


% --- Executes during object creation, after setting all properties.
function E_CreateFcn(hObject, eventdata, handles)
% hObject    handle to E (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Wn_Callback(hObject, eventdata, handles)
% hObject    handle to Wn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Wn as text
%        str2double(get(hObject,'String')) returns contents of Wn as a double


% --- Executes during object creation, after setting all properties.
function Wn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Wn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Wd_Callback(hObject, eventdata, handles)
% hObject    handle to Wd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Wd as text
%        str2double(get(hObject,'String')) returns contents of Wd as a double


% --- Executes during object creation, after setting all properties.
function Wd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Wd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in INICIO2.
function INICIO2_Callback(hObject, eventdata, handles)
% hObject    handle to INICIO2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global NUM DEN;
syms A B C D;
num=str2num(get(handles.num,'String'));
den=str2num(get(handles.den,'String'));
if isempty(num)
        msgbox('Introduzca un numero en lugar de un caracter en el numerador','Error');
else
end
if isempty(den)
        msgbox('Introduzca un numero en lugar de un caracter en el denominador','Error');
else
end
NUM=num;
DEN=den;
[A,B,C,D]=tf2ss(NUM,DEN);
set(handles.A,'String',num2str(A,10));
set(handles.B,'String',num2str(B,10));
set(handles.C,'String',num2str(C,10));
set(handles.D,'String',num2str(D,10));


% --- Executes on selection change in A.
function A_Callback(hObject, eventdata, handles)
% hObject    handle to A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns A contents as cell array
%        contents{get(hObject,'Value')} returns selected item from A


% --- Executes during object creation, after setting all properties.
function A_CreateFcn(hObject, eventdata, handles)
% hObject    handle to A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in C.
function C_Callback(hObject, eventdata, handles)
% hObject    handle to C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns C contents as cell array
%        contents{get(hObject,'Value')} returns selected item from C


% --- Executes during object creation, after setting all properties.
function C_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in B.
function B_Callback(hObject, eventdata, handles)
% hObject    handle to B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns B contents as cell array
%        contents{get(hObject,'Value')} returns selected item from B


% --- Executes during object creation, after setting all properties.
function B_CreateFcn(hObject, eventdata, handles)
% hObject    handle to B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in D.
function D_Callback(hObject, eventdata, handles)
% hObject    handle to D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns D contents as cell array
%        contents{get(hObject,'Value')} returns selected item from D


% --- Executes during object creation, after setting all properties.
function D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ROUTH.
function ROUTH_Callback(hObject, eventdata, handles)
% hObject    handle to ROUTH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global DEN;
syms TABLA Right_poles RAICES;
den=str2num(get(handles.den,'String'));
DEN=den;
if isempty(den)
        msgbox('Introduzca un numero en lugar de un caracter en el denominador','Error');
else
end
m=length(DEN);
n=round(m/2);
q=1;
k=0;
for p=1:length(den)
    if rem(p,2)==0
        c_even(k)=DEN(p);
    else
        c_odd(q)=DEN(p);
        k=k+1;
        q=q+1;
    end
end
TABLA=zeros(m,n);
if m/2 ~= round(m/2)
    c_even(n)=0;
end
TABLA(1,:)=c_odd;
TABLA(2,:)=c_even;
if TABLA(2,1)==0
    TABLA(2,1)=0.01;
end
for i=3:m
    for j=1:n-1
        x=TABLA(i-1,1);
        if x==0
            x=0.01;
        end
        TABLA(i,j)=((TABLA(i-1,1)*TABLA(i-2,j+1))-(TABLA(i-2,1)*TABLA(i-1,j+1)))/x;
    end
    if TABLA(i,:)==0
        order=(m-i+1);
        c=0;
        d=1;
        for j=1:n-1
             TABLA(i,j)=(order-c)*(TABLA(i-1,d));
             d=d+1;
             c=c+2;
        end
    end
    if TABLA(i,1)==0
        TABLA(i,1)=0.01;
    end
end
Right_poles=0;
for i=1:m-1
    if sign(TABLA(i,1))*sign(TABLA(i+1,1))==-1
        Right_poles=Right_poles+1;
    end
end
RAICES=roots(den);
set(handles.TABLAROUTH,'String',num2str(TABLA,10));
set(handles.RIGHT,'String',Right_poles);
set(handles.ROOTS,'String',num2str(RAICES,10));

% --- Executes on selection change in TABLAROUTH.
function TABLAROUTH_Callback(hObject, eventdata, handles)
% hObject    handle to TABLAROUTH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns TABLAROUTH contents as cell array
%        contents{get(hObject,'Value')} returns selected item from TABLAROUTH


% --- Executes during object creation, after setting all properties.
function TABLAROUTH_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TABLAROUTH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in ROOTS.
function ROOTS_Callback(hObject, eventdata, handles)
% hObject    handle to ROOTS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ROOTS contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ROOTS


% --- Executes during object creation, after setting all properties.
function ROOTS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ROOTS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
