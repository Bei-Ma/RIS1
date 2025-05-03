close all;
clear all;
clc;
%RISnumber(单元数)M=10，transcceiver antenna number(收发天线数)=3
for i=1:5000
k=10;%kRician factor(为莱斯因子)

%for RIS number is i=10:60，Rician channel：h_r1、h_rician2、h_rician3是1*210(210=10+20+30+40+50+60)
h_r1=[];
h_rician1=0;
for i=10:10:60
h_rician1=sqrt(k/(k+1))*ones(1,i).*exp(1i*2*pi*rand(1,i))+sqrt(1/(k+1))*sqrt(1/2)*(randn(1,i)+1i*randn(1,i));
h_r1=[h_r1,h_rician1];
end   
h_rician2=rand()*h_r1;%generate (产生) the second row of hkH(的第二行)，是与第一行线性相关的，是1*210的向量，对于一个M取值，是1*M的向量。
h_rician3=rand()*h_r1;%产生hkH的第三行，是与第一行线性相关的，是1*210的向量，对于一个M取值，是1*M的向量。
hkH=[h_r1;h_rician2;h_rician3];%产生hkH，是一个秩为1的3*210矩阵，对于一个M取值，hkH是3*M的向量。
%compute for M=10(下面计算RIS元素M=10时)

h1=h_r1(:,1:10)';%取第一行的1到10列，M=10,得hknH-M，n=1:3,天线数，再进行共轭转置得h1是10*1的行向量
h2=h_r1(:,11:30)';%取第一行的11到30列，M=20,得hknH-M，再进行共轭转置得h2是20*1的行向量
h3=h_r1(:,31:60)';%取第一行的31到60列，M=30,得hknH-M，再进行共轭转置得h3是30*1的行向量
h4=h_r1(:,61:100)';%取第一行的61到100列，M=40,得hknH-M，再进行共轭转置得h4是40*1的行向量
h5=h_r1(:,101:150)';%取第一行的101到150列，M=50,得hknH-M，再进行共轭转置得h5是50*1的行向量
h6=h_r1(:,151:210)';%取第一行的151到210列，M=60,得hknH-M，再进行共轭转置得h是60*1的行向量

u1=h1/norm(h1,2);%normalize h1 to be 10*1 vector (u1是h1归一化值,u1也是10*1行向量)
u2=h2/norm(h2,2);%normalize h2 to be 20*1 vector (u2是h2归一化值,u2也是20*1行向量)
u3=h3/norm(h3,2);%normalize h3 to be 30*1 vector (u3是h3归一化值,u3也是30*1行向量)
u4=h4/norm(h4,2);%normalize h4 to be 40*1 vector (u4是h4归一化值, u4也是40*1行向量)
u5=h5/norm(h5,2);%normalize h5 to be 50*1 vector (u5是h5归一化值, u5也是50*1行向量)
u6=h6/norm(h6,2);%normalize h6 to be 60*1 vector (u6是h6归一化值, u6也是60*1行向量)

%gk TX-RIS,Rician channel of M*3(M=10:60).(是M(10:60)*3的莱斯信道矩阵)
%对于RIS元素分别取i=10:60时，生成莱斯信道
gk1=sqrt(k/(k+1))*ones(10,3).*exp(1i*2*pi*rand(10,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(10,3)+1i*randn(10,3));
ggk1=sqrt(k/(k+1))*ones(10,3).*exp(1i*2*pi*rand(10,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(10,3)+1i*randn(10,3));%干扰信道
gggk1=sqrt(k/(k+1))*ones(10,3).*exp(1i*2*pi*rand(10,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(10,3)+1i*randn(10,3));%干扰信道
gk2=sqrt(k/(k+1))*ones(20,3).*exp(1i*2*pi*rand(20,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(20,3)+1i*randn(20,3));
ggk2=sqrt(k/(k+1))*ones(20,3).*exp(1i*2*pi*rand(20,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(20,3)+1i*randn(20,3));%干扰信道
gggk2=sqrt(k/(k+1))*ones(20,3).*exp(1i*2*pi*rand(20,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(20,3)+1i*randn(20,3));%干扰信道
gk3=sqrt(k/(k+1))*ones(30,3).*exp(1i*2*pi*rand(30,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(30,3)+1i*randn(30,3));
ggk3=sqrt(k/(k+1))*ones(30,3).*exp(1i*2*pi*rand(30,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(30,3)+1i*randn(30,3));
gggk3=sqrt(k/(k+1))*ones(30,3).*exp(1i*2*pi*rand(30,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(30,3)+1i*randn(30,3));
gk4=sqrt(k/(k+1))*ones(40,3).*exp(1i*2*pi*rand(40,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(40,3)+1i*randn(40,3));
ggk4=sqrt(k/(k+1))*ones(40,3).*exp(1i*2*pi*rand(40,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(40,3)+1i*randn(40,3));
gggk4=sqrt(k/(k+1))*ones(40,3).*exp(1i*2*pi*rand(40,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(40,3)+1i*randn(40,3));
gk5=sqrt(k/(k+1))*ones(50,3).*exp(1i*2*pi*rand(50,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(50,3)+1i*randn(50,3));
ggk5=sqrt(k/(k+1))*ones(50,3).*exp(1i*2*pi*rand(50,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(50,3)+1i*randn(50,3));
gggk5=sqrt(k/(k+1))*ones(50,3).*exp(1i*2*pi*rand(50,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(50,3)+1i*randn(50,3));
gk6=sqrt(k/(k+1))*ones(60,3).*exp(1i*2*pi*rand(60,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(60,3)+1i*randn(60,3));
ggk6=sqrt(k/(k+1))*ones(60,3).*exp(1i*2*pi*rand(60,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(60,3)+1i*randn(60,3));
gggk6=sqrt(k/(k+1))*ones(60,3).*exp(1i*2*pi*rand(60,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(60,3)+1i*randn(60,3));
[U1 S1 V1]=svd(gk1);
[U2 S2 V2]=svd(gk2);
[U3 S3 V3]=svd(gk3);
[U4 S4 V4]=svd(gk4);
[U5 S5 V5]=svd(gk5);
[U6 S6 V6]=svd(gk6);
w1=U1(:,1);%w1是gk1矩阵的最大奇异值对应的左奇异值向量10*1
w2=U2(:,1);%w2是gk2矩阵的最大奇异值对应的左奇异值向量20*1
w3=U3(:,1);%w3是gk3矩阵的最大奇异值对应的左奇异值向量30*1
w4=U4(:,1);%w4是gk4矩阵的最大奇异值对应的左奇异值向量40*1
w5=U5(:,1);%w5是gk5矩阵的最大奇异值对应的左奇异值向量50*1
w6=U6(:,1);%w6是gk6矩阵的最大奇异值对应的左奇异值向量60*1

B1=u1*(w1');
B2=u2*(w2');
B3=u3*(w3');
B4=u4*(w4');
B5=u5*(w5');
B6=u6*(w6');

A1=B1+transpose(B1);%A1是10*10矩阵
A2=B2+transpose(B2);%A1是20*20矩阵
A3=B3+transpose(B3);%A1是30*30矩阵
A4=B4+transpose(B4);%A1是40*40矩阵
A5=B5+transpose(B5);%A1是50*50矩阵
A6=B6+transpose(B6);%A1是60*60矩阵

%下面对A1 Takagi分解
[Ut St Vt]=svd(A1);
G_star=(Vt').';
t=diag(Ut'*G_star);
theta=0.5*atan2d(imag(t),real(t));%角度为单位
v=exp(j*theta/180*pi);%复指数函数中的用的是弧度，所以角度要除以180再乘以pi
F=Ut*diag(v);
C=F*St*F.';%C=A1，C是A1进行Takagi分解的形式
fan1=F*F.';%相移矩阵10*10矩阵

%channel power:F-norm(下面代码表示：heq为3*3的矩阵时对矩阵求F范数) 

heq1=hkH(:,1:10)*fan1*gk1;
%BD-RIS干扰功率
I1=hkH(:,1:10)*fan1*(ggk1+gggk1);%interference channel干扰信道
Ip1=(norm(I1,'fro'))^2;%power of interference channel干扰信道功率
max1=10*log10((norm(heq1,'fro'))^2);%dB of Ip1;(对heq1矩阵等效信道求F范数再平方再取对数)
%下面对A2 Takagi分解
[Ut2 St2 Vt2]=svd(A2);
G_star2=(Vt2').';
t2=diag(Ut2'*G_star2);
theta2=0.5*atan2d(imag(t2),real(t2));%角度为单位
v2=exp(j*theta2/180*pi);%复指数函数中的用的是弧度，所以角度要除以180再乘以pi
F2=Ut2*diag(v2);
C2=F2*St2*F2.';%C=A1，C是A1进行Takagi分解的形式
fan2=F2*F2.';%相移矩阵20*20矩阵
heq2=hkH(:,11:30)*fan2*gk2;%IA
%BD-RISinterference power(干扰功率)
I2=hkH(:,11:30)*fan2*(ggk2+gggk2);%interference channel干扰信道
Ip2=(norm(I2,'fro'))^2;%power of interference channel(干扰信道功率)
max2=10*log10((norm(heq2,'fro'))^2);%对heq2矩阵等效信道求F范数再平方再取对数

%下面对A3 Takagi分解
[Ut3 St3 Vt3]=svd(A3);
G_star3=(Vt3').';
t3=diag(Ut3'*G_star3);
theta3=0.5*atan2d(imag(t3),real(t3));%角度为单位
v3=exp(j*theta3/180*pi);%复指数函数中的用的是弧度，所以角度要除以180再乘以pi
F3=Ut3*diag(v3);
C3=F3*St3*F3.';%C=A1，C是A3进行Takagi分解的形式
fan3=F3*F3.';%相移矩阵20*20矩阵
heq3=hkH(:,31:60)*fan3*gk3;%IA
%BD-RIS干扰功率
I3=hkH(:,31:60)*fan3*(ggk3+gggk3);%干扰信道
Ip3=(norm(I3,'fro'))^2;%干扰信道功率
max3=10*log10((norm(heq3,'fro'))^2);%对heq3矩阵等效信道求F范数再平方再取对数
%下面对A4 Takagi分解
[Ut4 St4 Vt4]=svd(A4);
G_star4=(Vt4').';
t4=diag(Ut4'*G_star4);
theta4=0.5*atan2d(imag(t4),real(t4));%角度为单位
v4=exp(j*theta4/180*pi);%复指数函数中的用的是弧度，所以角度要除以180再乘以pi
F4=Ut4*diag(v4);
C4=F4*St4*F4.';%C=A1，C是A1进行Takagi分解的形式
fan4=F4*F4.';%相移矩阵20*20矩阵
heq4=hkH(:,61:100)*fan4*gk4;
%BD-RIS干扰功率
I4=hkH(:,61:100)*fan4*(ggk4+gggk4);%干扰信道
Ip4=(norm(I4,'fro'))^2;%干扰信道功率
max4=10*log10((norm(heq4,'fro'))^2);%对heq4矩阵等效信道求F范数再平方再取对数

 
%下面对A5 Takagi分解
[Ut5 St5 Vt5]=svd(A5);
G_star5=(Vt5').';
t5=diag(Ut5'*G_star5);
theta5=0.5*atan2d(imag(t5),real(t5));%角度为单位
v5=exp(j*theta5/180*pi);%复指数函数中的用的是弧度，所以角度要除以180再乘以pi
F5=Ut5*diag(v5);
C5=F5*St5*F5.';%C=A1，C是A1进行Takagi分解的形式
fan5=F5*F5.';%相移矩阵20*20矩阵
heq5=hkH(:,101:150)*fan5*gk5;
%BD-RIS干扰功率
I5=hkH(:,101:150)*fan5*(ggk5+gggk5);%干扰信道
Ip5=(norm(I5,'fro'))^2;%干扰信道功率
max5=10*log10((norm(heq5,'fro'))^2);%对heq5矩阵等效信道求F范数再平方再取对数

%下面对A6 Takagi分解
[Ut6 St6 Vt6]=svd(A6);
G_star6=(Vt6').';
t6=diag(Ut6'*G_star6);
theta6=0.5*atan2d(imag(t6),real(t6));%角度为单位
v6=exp(j*theta6/180*pi);%复指数函数中的用的是弧度，所以角度要除以180再乘以pi
F6=Ut6*diag(v6);
C6=F6*St6*F6.';%C=A1，C是A1进行Takagi分解的形式
fan6=F6*F6.';%相移矩阵20*20矩阵
heq6=hkH(:,151:210)*fan6*gk6;
%BD-RIS干扰功率
I6=hkH(:,151:210)*fan6*(ggk6+gggk6);%干扰信道
Ip6=(norm(I6,'fro'))^2;%干扰信道功率
max6=10*log10((norm(heq6,'fro'))^2);%对heq5矩阵等效信道求F范数再平方再取对数

PL11=-30-10*3.2*log10(30);%发送端到RIS路损
PL1=10^(PL11/10);
PL22=-30-10*3.2*log10(20);%RIS到接收端路损
PL2=10^(PL22/10);
PL=sqrt(PL1)*sqrt(PL2);%等效信道总路损
no=2*10^(-13.4)*PL^(-2);%把路损分之一后放在噪声功率处

NdB=10*log10(no);%将噪声-80dBm转换为dB  5mw
%noise+interference BD-RIS
NdB1=10*log10(no+Ip1);
NdB2=10*log10(no+Ip2);
NdB3=10*log10(no+Ip3);
NdB4=10*log10(no+Ip4);
NdB5=10*log10(no+Ip5);
NdB6=10*log10(no+Ip6);
X=[10 20 30 40 50 60];
Y=[max1-NdB max2-NdB max3-NdB max4-NdB max5-NdB max6-NdB];%IABD-RIS SNR
Yd=[max1-NdB1 max2-NdB2 max3-NdB3 max4-NdB4 max5-NdB5 max6-NdB6];%BD-RIS SNR

%对角相移矩阵情况
thetaD1=[];
thetad1=0;
for m=1:10
thetaD1=rand(1,10)*2*pi;
thetaD11=diag(exp(j*thetaD1));
end
thetaD2=[];
thetad2=0;
for n=1:20
thetaD2=rand(1,20)*2*pi;
thetaD22=diag(exp(j*thetaD2));
end
thetaD3=[];
thetad3=0;
for t=1:30
thetaD3=rand(1,30)*2*pi;
thetaD33=diag(exp(j*thetaD3));
end
thetaD4=[];
thetad4=0;
for g=1:40
thetaD4=rand(1,40)*2*pi;
thetaD44=diag(exp(j*thetaD4));
end
thetaD5=[];
thetad5=0;
for b=1:50
thetaD5=rand(1,50)*2*pi;
thetaD55=diag(exp(j*thetaD5));
end
thetaD6=[];
thetad6=0;
for c=1:60
thetaD6=rand(1,60)*2*pi;
thetaD66=diag(exp(j*thetaD6));
end


heq1D=hkH(:,1:10)*thetaD11*gk1;
max1D=10*log10((norm(heq1D,'fro'))^2);%对heq1D矩阵等效信道求F范数再平方再取对数,M=10
heq2D=hkH(:,11:30)*thetaD22*gk2;
max2D=10*log10((norm(heq2D,'fro'))^2);%对heq2D矩阵等效信道求F范数再平方再取对数,M=20
heq3D=hkH(:,31:60)*thetaD33*gk3;
max3D=10*log10((norm(heq3D,'fro'))^2);%对heq3D矩阵等效信道求F范数再平方再取对数,M=30
heq4D=hkH(:,61:100)*thetaD44*gk4;
max4D=10*log10((norm(heq4D,'fro'))^2);%对heq4D矩阵等效信道求F范数再平方再取对数,M=40
heq5D=hkH(:,101:150)*thetaD55*gk5;
max5D=10*log10((norm(heq5D,'fro'))^2);%对heq5D矩阵等效信道求F范数再平方再取对数,M=50
heq6D=hkH(:,151:210)*thetaD66*gk6;
max6D=10*log10((norm(heq6D,'fro'))^2);%对heq6D矩阵等效信道求F范数再平方再取对数,M=60
YD=[max1D-NdB max2D-NdB max3D-NdB max4D-NdB max5D-NdB max6D-NdB];%对角阵
end
figure;
hold on;
grid on;
smoothYD1=smooth(YD,5);
smoothY1=smooth(Y,5);%IA-BD-RIS
smoothYd=smooth(Yd,5);
plot(X,smoothY1,'-bo', X,smoothYD1,'--r^',X,smoothYd,'--g^','LineWidth',2);
xlabel('Number of RIS elements');
ylabel('Receive SNR(dB)');



