function varargout = Image_Processing_LabKit_GUI(varargin)
% Image_Processing_LabKit_GUI MATLAB code for Image_Processing_LabKit_GUI.fig
%      Image_Processing_LabKit_GUI, by itself, creates a new Image_Processing_LabKit_GUI or raises the existing
%      singleton*.
%
%      H = Image_Processing_LabKit_GUI returns the handle to a new Image_Processing_LabKit_GUI or the handle to
%      the existing singleton*.
%
%      Image_Processing_LabKit_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in Image_Processing_LabKit_GUI.M with the given input arguments.
%
%      Image_Processing_LabKit_GUI('Property','Value',...) creates a new Image_Processing_LabKit_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Image_Processing_LabKit_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Image_Processing_LabKit_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Image_Processing_LabKit_GUI

% Last Modified by GUIDE v2.5 20-Nov-2024 21:09:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Image_Processing_LabKit_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Image_Processing_LabKit_GUI_OutputFcn, ...
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


% --- Executes just before Image_Processing_LabKit_GUI is made visible.
function Image_Processing_LabKit_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Image_Processing_LabKit_GUI (see VARARGIN)

% Choose default command line output for Image_Processing_LabKit_GUI
handles.output = hObject;

set(handles.save,'Enable','off');
set(handles.reset,'Enable','off');
set(handles.g1,'Visible','off');
set(handles.g2,'Visible','off');
set(handles.g3,'Visible','off');
set(handles.g4,'Visible','off');
set(handles.g5,'Visible','off');
set(handles.n1,'Enable','off');
set(handles.n2,'Enable','off');
set(handles.n3,'Enable','off');
set(handles.n4,'Enable','off');
set(handles.n5,'Enable','off');
set(handles.n6,'Enable','off');
set(handles.n7,'Enable','off');
set(handles.n8,'Enable','off');
set(handles.f1,'Enable','off');
set(handles.f2,'Enable','off');
set(handles.f3,'Enable','off');
set(handles.slider1,'Enable','off');
set(handles.slider2,'Enable','off');
set(handles.slider3,'Enable','off');
set(handles.slider4,'Enable','off');
set(handles.slider5,'Enable','off');
set(handles.m1,'Enable','off');
set(handles.m2,'Enable','off');
set(handles.m3,'Enable','off');
set(handles.m4,'Enable','off');
set(handles.m5,'Enable','off');
set(handles.m6,'Enable','off');
set(handles.m7,'Enable','off');
set(handles.m8,'Enable','off');
set(handles.p1,'Enable','off');
set(handles.invc,'Enable','off');
set(handles.g1,'Visible','on');
set(handles.g2,'Visible','on');
set(handles.g3,'Visible','on');
set(handles.g4,'Visible','on');
set(handles.g5,'Visible','on');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Image_Processing_LabKit_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Image_Processing_LabKit_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%彩色直方图更新函数
function updateg345(handles)
ImageData1 = reshape(handles.img(:,:,1), [size(handles.img, 1) * size(handles.img, 2) 1]);
ImageData2 = reshape(handles.img(:,:,2), [size(handles.img, 1) * size(handles.img, 2) 1]);
ImageData3 = reshape(handles.img(:,:,3), [size(handles.img, 1) * size(handles.img, 2) 1]);
[H1, X1] = hist(ImageData1, 1:5:256);
[H2, X2] = hist(ImageData2, 1:5:256);
[H3, X3] = hist(ImageData3, 1:5:256);
axes(handles.g3); 
cla;
hold on;
plot(X1, H1, 'r');  
axis([0 256 0 max(H1)]);
axes(handles.g4); 
cla;
hold on;
plot(X2, H2, 'g');
axis([0 256 0 max(H2)]);
axes(handles.g5); 
cla;
hold on;
plot(X3, H3, 'b');  
axis([0 256 0 max(H3)]);

% 灰度直方图更新函数
function updateg3_1(handles)
% 清除其他颜色直方图
axes(handles.g4); 
cla;
axes(handles.g5); 
cla;

% 绘制直方图
ImageData = reshape(handles.img, [size(handles.img, 1) * size(handles.img, 2) 1]);
[H, X] = hist(ImageData, 1:5:256);
axes(handles.g3); 
cla;
hold on;
plot(X, H, 'k');  
axis([0 256 0 max(H)]);



% 打开
% --- Executes on button press in load.
function load_Callback(hObject, eventdata, handles)

[file path]=uigetfile({'*.jpg;*.bmp;*.jpeg;*.png'}, '打开文件');
image=[path file];
handles.file=image;
if (file==0)
    warndlg('您似乎没有打开图片哦...（；´д｀）ゞ') ;
end
[fpath, fname, fext]=fileparts(file);
validex=({'.bmp','.jpg','.jpeg','.png'});
found=0;
for (x=1:length(validex))
if (strcmpi(fext,validex{x}))
       found=1;
     
set(handles.save,'Enable','on');
set(handles.exit,'Enable','on');
set(handles.reset,'Enable','on');
set(handles.n1,'Enable','on');
set(handles.n2,'Enable','on');
set(handles.n3,'Enable','on');
set(handles.n4,'Enable','on');
set(handles.n5,'Enable','on');
set(handles.n6,'Enable','on');
set(handles.n7,'Enable','on');
set(handles.n8,'Enable','on');
set(handles.f1,'Enable','on');
set(handles.f2,'Enable','on');
set(handles.f3,'Enable','on');
set(handles.slider1,'Enable','on');
set(handles.slider2,'Enable','on');
set(handles.slider3,'Enable','on');
set(handles.slider4,'Enable','on');
set(handles.slider5,'Enable','on');
set(handles.m1,'Enable','on');
set(handles.m2,'Enable','on');
set(handles.m3,'Enable','on');
set(handles.m4,'Enable','on');
set(handles.m5,'Enable','on');
set(handles.m6,'Enable','on');
set(handles.m7,'Enable','on');
set(handles.m8,'Enable','on');
set(handles.p1,'Enable','on');
set(handles.invc,'Enable','on');

handles.img=imread(image);
handles.original=imread(image);
axes(handles.g1); 
cla; 
imshow(handles.original);
axes(handles.g2); 
cla; 
imshow(handles.img);
guidata(hObject,handles);
break; 
end
end
if (found==0)
     errordlg('文件扩展名似乎不正确哦，请从可用扩展名[.jpg、.jpeg、.bmp、.png]中选择文件','哎呀，出错了！');
end
% 检查图像是否为彩色，并更新对应直方图
mysize=size(handles.img);
if numel(mysize)>2
    updateg345(handles)
else
    updateg3_1(handles)
end 
guidata(hObject,handles);

% hObject    handle to load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 
% 退出
% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)

close all;

% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% 导出
% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)

[file path]= uiputfile('*.jpg','Save Image as');
save=[path file]; imwrite(handles.img,save,'jpg');

% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% 还原
% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)

handles.img=handles.original;
axes(handles.g2); 
cla; 
imshow(handles.img);
updateg345(handles);
guidata(hObject,handles);

% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% 加载示例图像
% --- Executes on button press in example.
function example_Callback(hObject, eventdata, handles)
set(handles.save,'Enable','on');
set(handles.exit,'Enable','on');
set(handles.reset,'Enable','on');
set(handles.n1,'Enable','on');
set(handles.n2,'Enable','on');
set(handles.n3,'Enable','on');
set(handles.n4,'Enable','on');
set(handles.n5,'Enable','on');
set(handles.n6,'Enable','on');
set(handles.n7,'Enable','on');
set(handles.n8,'Enable','on');
set(handles.f1,'Enable','on');
set(handles.f2,'Enable','on');
set(handles.f3,'Enable','on');
set(handles.slider1,'Enable','on');
set(handles.slider2,'Enable','on');
set(handles.slider3,'Enable','on');
set(handles.slider4,'Enable','on');
set(handles.slider5,'Enable','on');
set(handles.m1,'Enable','on');
set(handles.m2,'Enable','on');
set(handles.m3,'Enable','on');
set(handles.m4,'Enable','on');
set(handles.m5,'Enable','on');
set(handles.m6,'Enable','on');
set(handles.m7,'Enable','on');
set(handles.m8,'Enable','on');
set(handles.p1,'Enable','on');
set(handles.invc,'Enable','on');

handles.img=imread('merge.png');
handles.original=imread('merge.png');
axes(handles.g1); 
cla; 
imshow(handles.original);
axes(handles.g2); 
cla; 
imshow(handles.img);
guidata(hObject,handles);
% 检查图像是否为彩色，并更新对应直方图
mysize=size(handles.img);
if numel(mysize)>2
    updateg345(handles)
else
    updateg3_1(handles)
end 
guidata(hObject,handles);

% hObject    handle to example (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in n1.
function n1_Callback(hObject, eventdata, handles)

handles.img = imnoise(handles.img,'gaussian');
axes(handles.g2); 
cla; 
imshow(handles.img);
guidata(hObject,handles);

% 检查图像是否为彩色
mysize=size(handles.img);
if numel(mysize)>2
    updateg345(handles)
else
    updateg3_1(handles)
end 

% hObject    handle to n1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in n2.
function n2_Callback(hObject, eventdata, handles)

handles.img = imnoise(handles.img,'poisson');
axes(handles.g2); 
cla; 
imshow(handles.img);
guidata(hObject,handles);

% 检查图像是否为彩色
mysize=size(handles.img);
if numel(mysize)>2
    updateg345(handles)
else
    updateg3_1(handles)
end 

% hObject    handle to n2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in n3.
function n3_Callback(hObject, eventdata, handles)

handles.img = imnoise(handles.img,'salt & pepper',0.02);
axes(handles.g2); 
cla; 
imshow(handles.img);
guidata(hObject,handles);

% 检查图像是否为彩色
mysize=size(handles.img);
if numel(mysize)>2
    updateg345(handles)
else
    updateg3_1(handles)
end 

% hObject    handle to n3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in n4.
function n4_Callback(hObject, eventdata, handles)

handles.img = imnoise(handles.img,'speckle',0.04);
axes(handles.g2); 
cla; 
imshow(handles.img);
guidata(hObject,handles);

% 检查图像是否为彩色
mysize=size(handles.img);
if numel(mysize)>2
    updateg345(handles)
else
    updateg3_1(handles)
end 


% hObject    handle to n4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in n5.
function n5_Callback(hObject, eventdata, handles)
% 提取三个颜色通道
r=handles.img(:,:,1);
g=handles.img(:,:,2); 
b=handles.img(:,:,3);

% 分别添加瑞利噪声并还原图像
r1=add_noise(r, 'rayleigh',30);
g1=add_noise(g, 'rayleigh',30);
b1=add_noise(b, 'rayleigh',30);
rcon=cat(3,r1,g1,b1);

% 显示图像
axes(handles.g2); 
cla; 
imshow(rcon)
handles.img=rcon;
updateg345(handles)

% hObject    handle to n5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in n6.
function n6_Callback(hObject, eventdata, handles)
% 提取三个颜色通道
r=handles.img(:,:,1);
g=handles.img(:,:,2); 
b=handles.img(:,:,3);

% 分别添加指数噪声并还原图像
r1=add_noise(r, 'exp',15);
g1=add_noise(g, 'exp',15);
b1=add_noise(b, 'exp',15);
rcon=cat(3,r1,g1,b1);

% 显示图像
axes(handles.g2); 
cla; 
imshow(rcon)
handles.img=rcon;
updateg345(handles)

% hObject    handle to n6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in n7.
function n7_Callback(hObject, eventdata, handles)
% 提取三个颜色通道
r=handles.img(:,:,1);
g=handles.img(:,:,2); 
b=handles.img(:,:,3);

% 分别添加伽马噪声并还原图像
r1=add_noise(r, 'gamma',2,10);
g1=add_noise(g, 'gamma',2,10);
b1=add_noise(b, 'gamma',2,10);
rcon=cat(3,r1,g1,b1);

% 显示图像
axes(handles.g2); 
cla; 
imshow(rcon)
handles.img=rcon;
updateg345(handles)
% hObject    handle to n7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in n8.
function n8_Callback(hObject, eventdata, handles)
% 提取三个颜色通道
r=handles.img(:,:,1);
g=handles.img(:,:,2); 
b=handles.img(:,:,3);

% 分别添加伽马噪声并还原图像
r1=add_noise(r, 'uniform', -20, 20);
g1=add_noise(g, 'uniform', -20, 20);
b1=add_noise(b, 'uniform', -20, 20);
rcon=cat(3,r1,g1,b1);

% 显示图像
axes(handles.g2); 
cla; 
imshow(rcon)
handles.img=rcon;
updateg345(handles)

% hObject    handle to n8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in f2.
function f2_Callback(hObject, eventdata, handles)

hsize=[8 8]; sigma=1.7;
h=fspecial('gaussian',hsize,sigma);
handles.img=imfilter(handles.img,h,'replicate');
axes(handles.g2); cla; imshow(handles.img);
guidata(hObject,handles);

% 检查图像是否为彩色
mysize=size(handles.img);
if numel(mysize)>2
    updateg345(handles)
else
    updateg3_1(handles)
end 

% hObject    handle to f2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in f1.
function f1_Callback(hObject, eventdata, handles)

h=fspecial('average'); % 创建一个平均滤波器，用于图像平滑处理
handles.img=imfilter(handles.img,h,'replicate'); % 使用创建的平均滤波器对图像进行滤波，边界处理采用复制边缘像素的方法
axes(handles.g2); cla; imshow(handles.img)
guidata(hObject,handles);

% 检查图像是否为彩色
mysize=size(handles.img);
if numel(mysize)>2
    updateg345(handles)
else
    updateg3_1(handles)
end 

% hObject    handle to f1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in f3.
function f3_Callback(hObject, eventdata, handles)

r=medfilt2(handles.img(:,:,1));
g=medfilt2(handles.img(:,:,2));
b=medfilt2(handles.img(:,:,3)); 
handles.img=cat(3,r,g,b);
axes(handles.g2); cla; imshow(handles.img);
guidata(hObject,handles);

mysize=size(handles.img);
if numel(mysize)>2
    updateg345(handles)
else
    updateg3_1(handles)
end 

% hObject    handle to f3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)

x=get(hObject,'Value');
r=handles.img(:,:,1);
g=handles.img(:,:,2);
b=handles.img(:,:,3);
r1=r+x; 
rcon=cat(3,r1,g,b);
axes(handles.g2); 
cla; 
imshow(rcon)
handles.img=rcon;
updateg345(handles)

% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)

x=get(hObject,'Value');
r=handles.img(:,:,1);
g=handles.img(:,:,2); 
b=handles.img(:,:,3);
g1=g+x; 
gcon=cat(3,r,g1,b);
axes(handles.g2); 
cla; 
imshow(gcon)
handles.img=gcon;

updateg345(handles)

% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)

x=get(hObject,'Value');
r=handles.img(:,:,1);
g=handles.img(:,:,2); 
b=handles.img(:,:,3);
b1=b+x; 
bcon=cat(3,r,g,b1);
axes(handles.g2); 
cla; 
imshow(bcon)
handles.img=bcon;
updateg345(handles)

% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes on button press in m4.
function m4_Callback(hObject, eventdata, handles)

handles.img = rgb2gray(handles.img);
axes(handles.g2);
cla;
imshow(handles.img);
guidata(hObject,handles);
updateg3_1(handles);


% hObject    handle to m4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in m6.
function m6_Callback(hObject, eventdata, handles)

handles.img=fliplr(handles.img);
axes(handles.g2);
cla;
imshow(handles.img);
guidata(hObject,handles);

mysize=size(handles.img);
if numel(mysize)>2
    updateg345(handles)
else
    updateg3_1(handles)
end 

% hObject    handle to m6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in m8.
function m8_Callback(hObject, eventdata, handles)

map3= colorcube(256);
handles.img=rgb2ind(handles.img,map3);
axes(handles.g2);
cla;
imshow(handles.img);
guidata(hObject,handles);

% 检查图像是否为彩色
mysize=size(handles.img);
if numel(mysize)>2
    updateg345(handles)
else
    updateg3_1(handles)
end 

% hObject    handle to m8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in m7.
function m7_Callback(hObject, eventdata, handles)

handles.img=flipud(handles.img);
axes(handles.g2);
cla;
imshow(handles.img);
guidata(hObject,handles);

% 检查图像是否为彩色
mysize=size(handles.img);
if numel(mysize)>2
    updateg345(handles)
else
    updateg3_1(handles)
end 

% hObject    handle to m7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in m1.
function m1_Callback(hObject, eventdata, handles)

mysize=size(handles.img);
if numel(mysize)>2
    handles.img=rgb2gray(handles.img);
end
handles.img=edge(handles.img,'sobel');
axes(handles.g2);
cla;
imshow(handles.img);
guidata(hObject,handles);
updateg3_1(handles);

% hObject    handle to m1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in m2.
function m2_Callback(hObject, eventdata, handles)

% 检查图像是否为彩色
mysize=size(handles.img);
if numel(mysize)>2
    handles.img=rgb2gray(handles.img);
end
handles.img=edge(handles.img,'roberts');
axes(handles.g2);
cla;
imshow(handles.img);
guidata(hObject,handles);
updateg3_1(handles);

% hObject    handle to m2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on button press in m3.
function m3_Callback(hObject, eventdata, handles)

% 检查图像是否为彩色
mysize=size(handles.img);
if numel(mysize)>2
    handles.img=rgb2gray(handles.img);
end
handles.img=edge(handles.img,'log');
axes(handles.g2);
cla;
imshow(handles.img);
guidata(hObject,handles);
updateg3_1(handles);

% hObject    handle to m3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in invc.
function invc_Callback(hObject, eventdata, handles)

x=handles.img;
r=x(:,:,1); r=256-r;
g=x(:,:,2); g=256-g;
b=x(:,:,3); b=256-b;
handles.img=cat(3,r,g,b);
axes(handles.g2);
cla; 
imshow(handles.img);
updateg345(handles);
guidata(hObject,handles);

% hObject    handle to invc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in m5.
function m5_Callback(hObject, eventdata, handles)

thresh = graythresh(handles.img);     %自动确定二值化阈值
handles.img = im2bw(handles.img,thresh);
axes(handles.g2);
cla;
imshow(handles.img);
guidata(hObject,handles);
updateg3_1(handles);

% hObject    handle to m5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)

x=get(hObject,'Value');
img=handles.img;
img=img+x;
axes(handles.g2); cla; imshow(img)
handles.img=img;
updateg345(handles)

% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)

rrv=(get(hObject,'Value'));
handles.rot=handles.img;
handles.rot=imrotate(handles.rot,rrv);
axes(handles.g2); 
cla; 
imshow(handles.rot);
guidata(hObject,handles)

% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes on button press in p1.
function p1_Callback(hObject, eventdata, handles)
%维纳滤波复原，复原含有噪声和运动模糊的图片

% 检查图像是否为彩色
mysize=size(handles.img);
if numel(mysize)>2
    handles.img = rgb2gray(handles.img);
end

I=handles.img;
I=im2double(I);
LEN=20; % 参数设置
THETA=10;
PSF=fspecial('motion',LEN,THETA); % 产生PSF
J=imfilter(I,PSF,'conv','circular');% 运动模糊
noise=0.03*randn(size(I));
K=imadd(J,noise); % 添加噪声
NP=abs(fft2(noise)).^2;
NPower=sum(NP(:))/prod(size(noise));
NCORR=fftshift(real(ifft2(NP)));
IP=abs(fft2(I).^2);
IPower=sum(IP(:))/prod(size(I));
ICORR=fftshift(real(ifft2(IP)));
L=deconvwnr(K,PSF,NCORR,ICORR);
handles.img=L;

axes(handles.g2); 
cla; 
imshow(handles.img);
guidata(hObject,handles);

updateg3_1(handles)

% hObject    handle to p1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
