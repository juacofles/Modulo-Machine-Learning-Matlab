function varargout = GUIDE_Modulo(varargin)
% GUIDE_MODULO MATLAB code for GUIDE_Modulo.fig
%      GUIDE_MODULO, by itself, creates a new GUIDE_MODULO or raises the existing
%      singleton*.
%
%      H = GUIDE_MODULO returns the handle to a new GUIDE_MODULO or the handle to
%      the existing singleton*.
%
%    GUIDE_MODULO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIDE_MODULO.M with the given input arguments.
%
%      GUIDE_MODULO('Property','Value',...) creates a new GUIDE_MODULO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUIDE_Modulo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUIDE_Modulo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUIDE_Modulo

% Last Modified by GUIDE v2.5 01-Jul-2023 19:36:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUIDE_Modulo_OpeningFcn, ...
                   'gui_OutputFcn',  @GUIDE_Modulo_OutputFcn, ...
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


% --- Executes just before GUIDE_Modulo is made visible.
function GUIDE_Modulo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUIDE_Modulo (see VARARGIN)

% Choose default command line output for GUIDE_Modulo
handles.a=arduino;
%handles.a=arduino % Conecta a arduino y guarda la información en un handles
handles.servo=servo(handles.a,'D9'); %Servo 1
handles.servo2=servo(handles.a,'D8'); %Servo 2
writePosition(handles.servo,0);
writePosition(handles.servo2,0);
set(handles.movimiento_S1,'Min',0,'Max',1,'value',0,'SliderStep',[0.1 0.1]);  
set(handles.movimiento_S2,'Min',0,'Max',1,'value',0,'SliderStep',[0.1 0.1]);
handles.output=hObject;
guidata(hObject, handles);

% UIWAIT makes GUIDE_Modulo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUIDE_Modulo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on slider movement.
function movimiento_S1_Callback(hObject, eventdata, handles)
% hObject    handle to movimiento_S1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
Servo1 = get(hObject,'Value')
writePosition(handles.servo,Servo1); 


% --- Executes during object creation, after setting all properties.
function movimiento_S1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to movimiento_S1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function movimiento_S2_Callback(hObject, eventdata, handles)
% hObject    handle to movimiento_S2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
Servo2 = get(hObject,'Value')
writePosition(handles.servo2,Servo2); 


% --- Executes during object creation, after setting all properties.
function movimiento_S2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to movimiento_S2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in Mover_Cinematica.
function Mover_Cinematica_Callback(hObject, eventdata, handles)
% hObject    handle to Mover_Cinematica (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Boton_Control_Imagen.
function Boton_Control_Imagen_Callback(hObject, eventdata, handles)
% hObject    handle to Boton_Control_Imagen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    load Red1.mat
    cam=webcam();
    cam.Resolution='640x480';
    c=0;
    while c<100
    img=snapshot(cam);
    [a,b]=maskprueba(img);
    a=bwareaopen(a,10000);
    Respuesta=sim(Red_Gestos,a(:))
    for i = 1:length(Respuesta)
        if Respuesta(i) >= 0.75 && Respuesta(i) <= 1
            switch i
                case 1
                    disp('gesto 1')
                case 2
                    disp('gesto 2')
                case 3
                    disp('gesto 3')
                case 4
                    disp('gesto 4')
            end
        end
    end
    c=c+1;
    imshow(a);
    end
    clear cam


% --- Executes on button press in Comando_Control_Voz.
function Comando_Control_Voz_Callback(hObject, eventdata, handles)
% hObject    handle to Comando_Control_Voz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    load RedAudio.mat
    recObj = audiorecorder(8000,16,1,0);
    set(handles.Comando_Control_Voz,'string','Inicializando Micro');
    disp('Inicializando Micro');
    recordblocking(recObj,2);
    n=1;
    
    for k=1:1:n
    set(handles.Comando_Control_Voz,'string','Presione ENTER para grabar');
    b=input('Presione ENTER para grabar');
    disp('Hable!!!!');
    set(handles.Comando_Control_Voz,'string','Hable');
    recordblocking(recObj,3);
    disp('Silencio!!!!');
    set(handles.Comando_Control_Voz,'string','Silencio');
    y = getaudiodata(recObj);
    MF=mfcc(y,8000);
    RtaVoz=sim(RedVoz,MF(:))
    pause(3);
    set(handles.Comando_Control_Voz,'string','Comando');
    end


% --- Executes on button press in Boton_Logo1.
function Boton_Logo1_Callback(hObject, eventdata, handles)
% hObject    handle to Boton_Logo1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Boton_Logo2.
function Boton_Logo2_Callback(hObject, eventdata, handles)
% hObject    handle to Boton_Logo2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% % --- Executes on button press in Conectar_Arduino.
% function Conectar_Arduino_Callback(hObject, eventdata, handles)
% % hObject    handle to Conectar_Arduino (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
%     handles.a=arduino;
%     handles.servo=servo(handles.a,'D9'); %Servo 1
%     handles.servo2=servo(handles.a,'D8'); %Servo 2
%     writePosition(handles.servo,0);
%     writePosition(handles.servo2,0);


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
clear handles.a % Cierra y termina la conexión con arduino
delete(hObject);