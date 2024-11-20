function IJ = add_noise(I, type, x, y)
% add_noise �������Բ���ǰ�����������������������.
% input:
% I������ͼ�����Ϊ�Ҷ�ͼ��
% type:  �ַ�����ȡֵ�������������
% ��˹����:     gaussian������Ϊ(x,y)��Ĭ��ֵΪ(0,10)
% ��������:     rayleigh������Ϊx��Ĭ��ֵΪ30
% ٤������:     gamma������Ϊ(x,y),Ĭ��ֵΪ(2,10)
% ָ��������    exp������Ϊx,Ĭ��ֵΪ15
% ���ȷֲ���    uniform������Ϊ(x,y)��Ĭ��ֵΪ(-20,20)
% ����������    salt & pepper: ǿ��Ϊx��Ĭ��ֵΪ0.02
% output:
% IJ:����������ͼ��
% example:
% I=imread('a.bmp');
% IJ=add_noise(I,'salt & pepper',0.1);
% imshow(IJ)

% Ԥ����
if ndims(I)>=3
    I=rgb2gray(I);
end

[M,N]=size(I);

% ����Ĭ����������
if  nargin == 1
    type='gaussian';
end

% ��ʼ����
switch lower(type)
    
    %��˹���������
    case 'gaussian'
        if nargin<4
            y=10;
        end
        if nargin <3
            x=0;
        end
        
        % ������˹�ֲ������
        R = normrnd(x,y,M,N);
        IJ=double(I)+R;
        IJ=uint8(round(IJ));
        
        %�������������
    case 'uniform'
        if nargin<4
            y=3;
        end
        if nargin <3
            x=-3;
        end
        
        % �������ȷֲ������
        R = unifrnd(x,y,M,N);
        IJ=double(I)+R;
        IJ=uint8(round(IJ));
        
        %�������������
    case 'salt & pepper'
        if nargin < 3
            x= 0.02;
        end
        
        % ����imnoise����
        IJ=imnoise(I,'salt & pepper', x);      
        
        %�������������
    case 'rayleigh'
        if nargin < 3
            x = 30;
        end
        
        % ���������ֲ������
        R = raylrnd(x,M,N);
        IJ=double(I)+R;
        IJ=uint8(round(IJ));
        
        %ָ�����������
    case 'exp'
        if nargin < 3
            x = 15;
        end
        R=exprnd(x,M,N);
        IJ=double(I)+R;
        IJ=uint8(round(IJ));
        
        %٤�����������
    case 'gamma'
        if nargin <4
            y=10;
        end
        if nargin<3
            x=2;
        end
        
        R=gamrnd(x,y,M,N);
        IJ=double(I)+R;
        IJ=uint8(round(IJ));
    otherwise
        error('Unknown distribution type.')
end
