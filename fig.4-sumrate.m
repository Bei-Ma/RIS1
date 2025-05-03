close all;
clear all;
clc;
for i=1:5000
k=10;%k为莱斯因子

%对于RIS元素分别取i=10:60时，生成莱斯信道：h_r1、h_rician2、h_rician3是1*210(210=10+20+30+40+50+60)

h_r1u=[];
h_rician1u=0;
for u=1:1:3%用户数1,2,3
    for i=10:10:60
h_rician1u=sqrt(k/(k+1))*ones(1,i).*exp(1i*2*pi*rand(1,i))+sqrt(1/(k+1))*sqrt(1/2)*(randn(1,i)+1i*randn(1,i));
h_r1u=[h_r1u,h_rician1u];
    end 
end
h_rician2u=rand()*h_r1u;%产生hkH的第二行，是与第一行线性相关的，是1*210的向量，对于一个M取值，是1*M的向量。
h_rician3u=rand()*h_r1u;%产生hkH的第三行，是与第一行线性相关的，是1*210的向量，对于一个M取值，是1*M的向量。
hkHu=[h_r1u;h_rician2u;h_rician3u];%产生hkH，是一个秩为1的3*210矩阵，对于一个M取值，hkH是3*M的向量。
%下面计算RIS元素M=10时
%用户1
h1=h_r1u(:,1:10)';%h_rician取第一行的1到10列，M=10,得hknH-M，n=1:3,天线数，再进行共轭转置得h1是10*1的行向量
h2=h_r1u(:,11:30)';%h_rician取第一行的11到30列，M=20,得hknH-M，再进行共轭转置得h2是20*1的行向量
h3=h_r1u(:,31:60)';%h_rician取第一行的11到30列，M=30,得hknH-M，再进行共轭转置得h3是30*1的行向量
h4=h_r1u(:,61:100)';%h_rician取第一行的11到30列，M=40,得hknH-M，再进行共轭转置得h4是40*1的行向量
h5=h_r1u(:,101:150)';%h_rician取第一行的11到30列，M=50,得hknH-M，再进行共轭转置得h5是50*1的行向量
h6=h_r1u(:,151:210)';%h_rician取第一行的11到30列，M=60,得hknH-M，再进行共轭转置得h是60*1的行向量
%用户2
h1user2=h_r1u(:,211:220)';%h_rician取第一行的1到10列，M=10,得hknH-M，n=1:3,天线数，再进行共轭转置得h1是10*1的行向量
h2user2=h_r1u(:,221:240)';%h_rician取第一行的11到30列，M=20,得hknH-M，再进行共轭转置得h2是20*1的行向量
h3user2=h_r1u(:,241:270)';%h_rician取第一行的11到30列，M=30,得hknH-M，再进行共轭转置得h3是30*1的行向量
h4user2=h_r1u(:,271:310)';%h_rician取第一行的11到30列，M=40,得hknH-M，再进行共轭转置得h4是40*1的行向量
h5user2=h_r1u(:,311:360)';%h_rician取第一行的11到30列，M=50,得hknH-M，再进行共轭转置得h5是50*1的行向量
h6user2=h_r1u(:,361:420)';%h_rician取第一行的11到30列，M=60,得hknH-M，再进行共轭转置得h是60*1的行向量
%用户3
h1user3=h_r1u(:,421:430)';%h_rician取第一行的1到10列，M=10,得hknH-M，n=1:3,天线数，再进行共轭转置得h1是10*1的行向量
h2user3=h_r1u(:,431:450)';%h_rician取第一行的11到30列，M=20,得hknH-M，再进行共轭转置得h2是20*1的行向量
h3user3=h_r1u(:,451:480)';%h_rician取第一行的11到30列，M=30,得hknH-M，再进行共轭转置得h3是30*1的行向量
h4user3=h_r1u(:,481:520)';%h_rician取第一行的11到30列，M=40,得hknH-M，再进行共轭转置得h4是40*1的行向量
h5user3=h_r1u(:,521:570)';%h_rician取第一行的11到30列，M=50,得hknH-M，再进行共轭转置得h5是50*1的行向量
h6user3=h_r1u(:,571:630)';%h_rician取第一行的11到30列，M=60,得hknH-M，再进行共轭转置得h是60*1的行向量
%用户1
u1=h1/norm(h1,2);%u1是h1归一化值,u1也是10*1行向量
u2=h2/norm(h2,2);%u1是h2归一化值,u2也是20*1行向量
u3=h3/norm(h3,2);%u1是h3归一化值,u3也是30*1行向量
u4=h4/norm(h4,2);%u1是h4归一化值,u4也是40*1行向量
u5=h5/norm(h5,2);%u1是h5归一化值,u5也是50*1行向量
u6=h6/norm(h6,2);%u1是h6归一化值,u6也是60*1行向量
%用户2
u1user2=h1user2/norm(h1user2,2);%u1是h1归一化值,u1也是10*1行向量
u2user2=h2user2/norm(h2user2,2);%u1是h2归一化值,u2也是20*1行向量
u3user2=h3user2/norm(h3user2,2);%u1是h3归一化值,u3也是30*1行向量
u4user2=h4user2/norm(h4user2,2);%u1是h4归一化值,u4也是40*1行向量
u5user2=h5user2/norm(h5user2,2);%u1是h5归一化值,u5也是50*1行向量
u6user2=h6user2/norm(h6user2,2);%u1是h6归一化值,u6也是60*1行向量
%用户3
u1user3=h1user3/norm(h1user3,2);%u1是h1归一化值,u1也是10*1行向量
u2user3=h2user3/norm(h2user3,2);%u1是h2归一化值,u2也是20*1行向量
u3user3=h3user3/norm(h3user3,2);%u1是h3归一化值,u3也是30*1行向量
u4user3=h4user3/norm(h4user3,2);%u1是h4归一化值,u4也是40*1行向量
u5user3=h5user3/norm(h5user3,2);%u1是h5归一化值,u5也是50*1行向量
u6user3=h6user3/norm(h6user3,2);%u1是h6归一化值,u6也是60*1行向量
%gk 发送端-RIS,是M(10:60)*3的莱斯信道矩阵
%对于RIS元素分别取i=10:60时，生成莱斯信道
%用户1
gk1=sqrt(k/(k+1))*ones(10,3).*exp(1i*2*pi*rand(10,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(10,3)+1i*randn(10,3));
gk2=sqrt(k/(k+1))*ones(20,3).*exp(1i*2*pi*rand(20,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(20,3)+1i*randn(20,3));
gk3=sqrt(k/(k+1))*ones(30,3).*exp(1i*2*pi*rand(30,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(30,3)+1i*randn(30,3));
gk4=sqrt(k/(k+1))*ones(40,3).*exp(1i*2*pi*rand(40,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(40,3)+1i*randn(40,3));
gk5=sqrt(k/(k+1))*ones(50,3).*exp(1i*2*pi*rand(50,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(50,3)+1i*randn(50,3));
gk6=sqrt(k/(k+1))*ones(60,3).*exp(1i*2*pi*rand(60,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(60,3)+1i*randn(60,3));
%用户2    
gk1user2=sqrt(k/(k+1))*ones(10,3).*exp(1i*2*pi*rand(10,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(10,3)+1i*randn(10,3));
gk2user2=sqrt(k/(k+1))*ones(20,3).*exp(1i*2*pi*rand(20,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(20,3)+1i*randn(20,3));
gk3user2=sqrt(k/(k+1))*ones(30,3).*exp(1i*2*pi*rand(30,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(30,3)+1i*randn(30,3));
gk4user2=sqrt(k/(k+1))*ones(40,3).*exp(1i*2*pi*rand(40,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(40,3)+1i*randn(40,3));
gk5user2=sqrt(k/(k+1))*ones(50,3).*exp(1i*2*pi*rand(50,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(50,3)+1i*randn(50,3));
gk6user2=sqrt(k/(k+1))*ones(60,3).*exp(1i*2*pi*rand(60,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(60,3)+1i*randn(60,3));
%用户3    
gk1user3=sqrt(k/(k+1))*ones(10,3).*exp(1i*2*pi*rand(10,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(10,3)+1i*randn(10,3));
gk2user3=sqrt(k/(k+1))*ones(20,3).*exp(1i*2*pi*rand(20,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(20,3)+1i*randn(20,3));
gk3user3=sqrt(k/(k+1))*ones(30,3).*exp(1i*2*pi*rand(30,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(30,3)+1i*randn(30,3));
gk4user3=sqrt(k/(k+1))*ones(40,3).*exp(1i*2*pi*rand(40,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(40,3)+1i*randn(40,3));
gk5user3=sqrt(k/(k+1))*ones(50,3).*exp(1i*2*pi*rand(50,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(50,3)+1i*randn(50,3));
gk6user3=sqrt(k/(k+1))*ones(60,3).*exp(1i*2*pi*rand(60,3))+sqrt(1/(k+1))*sqrt(1/2)*(randn(60,3)+1i*randn(60,3));
%用户1
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
%用户2
[U1user2 S1user2 V1user2]=svd(gk1user2);
[U2user2 S2user2 V2user2]=svd(gk2user2);
[U3user2 S3user2 V3user2]=svd(gk3user2);
[U4user2 S4user2 V4user2]=svd(gk4user2);
[U5user2 S5user2 V5user2]=svd(gk5user2);
[U6user2 S6user2 V6user2]=svd(gk6user2);
w1user2=U1user2(:,1);%w1是gk1矩阵的最大奇异值对应的左奇异值向量10*1
w2user2=U2user2(:,1);%w2是gk2矩阵的最大奇异值对应的左奇异值向量20*1
w3user2=U3user2(:,1);%w3是gk3矩阵的最大奇异值对应的左奇异值向量30*1
w4user2=U4user2(:,1);%w4是gk4矩阵的最大奇异值对应的左奇异值向量40*1
w5user2=U5user2(:,1);%w5是gk5矩阵的最大奇异值对应的左奇异值向量50*1
w6user2=U6user2(:,1);%w6是gk6矩阵的最大奇异值对应的左奇异值向量60*1
B1user2=u1user2*(w1user2');
B2user2=u2user2*(w2user2');
B3user2=u3user2*(w3user2');
B4user2=u4user2*(w4user2');
B5user2=u5user2*(w5user2');
B6user2=u6user2*(w6user2');
A1user2=B1user2+transpose(B1user2);%A1是10*10矩阵
A2user2=B2user2+transpose(B2user2);%A1是20*20矩阵
A3user2=B3user2+transpose(B3user2);%A1是30*30矩阵
A4user2=B4user2+transpose(B4user2);%A1是40*40矩阵
A5user2=B5user2+transpose(B5user2);%A1是50*50矩阵
A6user2=B6user2+transpose(B6user2);%A1是60*60矩阵
%用户3
[U1user3 S1user3 V1user3]=svd(gk1user3);
[U2user3 S2user3 V2user3]=svd(gk2user3);
[U3user3 S3user3 V3user3]=svd(gk3user3);
[U4user3 S4user3 V4user3]=svd(gk4user3);
[U5user3 S5user3 V5user3]=svd(gk5user3);
[U6user3 S6user3 V6user3]=svd(gk6user3);
w1user3=U1user3(:,1);%w1是gk1矩阵的最大奇异值对应的左奇异值向量10*1
w2user3=U2user3(:,1);%w2是gk2矩阵的最大奇异值对应的左奇异值向量20*1
w3user3=U3user3(:,1);%w3是gk3矩阵的最大奇异值对应的左奇异值向量30*1
w4user3=U4user3(:,1);%w4是gk4矩阵的最大奇异值对应的左奇异值向量40*1
w5user3=U5user3(:,1);%w5是gk5矩阵的最大奇异值对应的左奇异值向量50*1
w6user3=U6user3(:,1);%w6是gk6矩阵的最大奇异值对应的左奇异值向量60*1
B1user3=u1user3*(w1user3');
B2user3=u2user3*(w2user3');
B3user3=u3user3*(w3user3');
B4user3=u4user3*(w4user3');
B5user3=u5user3*(w5user3');
B6user3=u6user3*(w6user3');
A1user3=B1user3+transpose(B1user3);%A1是10*10矩阵
A2user3=B2user3+transpose(B2user3);%A1是20*20矩阵
A3user3=B3user3+transpose(B3user3);%A1是30*30矩阵
A4user3=B4user3+transpose(B4user3);%A1是40*40矩阵
A5user3=B5user3+transpose(B5user3);%A1是50*50矩阵
A6user3=B6user3+transpose(B6user3);%A1是60*60矩阵
%下面对A1 Takagi分解
%用户1
[Ut St Vt]=svd(A1);
G_star=(Vt').';
t=diag(Ut'*G_star);
theta=0.5*atan2d(imag(t),real(t));%角度为单位
v=exp(j*theta/180*pi);%复指数函数中的用的是弧度，所以角度要除以180再乘以pi
F=Ut*diag(v);
C=F*St*F.';%C=A1，C是A1进行Takagi分解的形式
fan1=F*F.';%相移矩阵10*10矩阵

%用户2
[Utuser2 Stuser2 Vtuser2]=svd(A1user2);
G_staruser2=(Vtuser2').';
tuser2=diag(Utuser2'*G_staruser2);
thetauser2=0.5*atan2d(imag(tuser2),real(tuser2));%角度为单位
vuser2=exp(j*thetauser2/180*pi);%复指数函数中的用的是弧度，所以角度要除以180再乘以pi
Fuser2=Utuser2*diag(vuser2);
Cuser2=Fuser2*Stuser2*Fuser2.';%C=A1，C是A1进行Takagi分解的形式
fan1user2=Fuser2*Fuser2.';%相移矩阵10*10矩阵
%用户3
[Utuser3 Stuser3 Vtuser3]=svd(A1user3);
G_staruser3=(Vtuser3').';
tuser3=diag(Utuser3'*G_staruser3);
thetauser3=0.5*atan2d(imag(tuser3),real(tuser3));%角度为单位
vuser3=exp(j*thetauser3/180*pi);%复指数函数中的用的是弧度，所以角度要除以180再乘以pi
Fuser3=Utuser3*diag(vuser3);
Cuser3=Fuser3*Stuser3*Fuser3.';%C=A1，C是A1进行Takagi分解的形式
fan1user3=Fuser3*Fuser3.';%相移矩阵10*10矩阵
PL11=-30-10*3.2*log10(30);%发送端到RIS路损
PL1=10^(PL11/10);
PL22=-30-10*2.8*log10(20);%RIS到接收端路损
PL2=10^(PL22/10);
PL=sqrt(PL1)*sqrt(PL2);%等效信道总路损
no=2*10^(-13.4)*PL^(-2);%把路损分之一后放在噪声功率处

hkH=[h1'; rand()*h1'; rand()*h1'];
heq1=hkH*fan1*gk1;
heq1d=hkH*fan1*gk1/(rand*gk1+rand*gk1);%BD-RIS 有干扰
max1=log2(1+(norm(heq1,'fro'))^2/no);%对heq1矩阵等效信道求F范数再平方再取对数
max1d=log2(1+(norm(heq1d,'fro'))^2/no);%BD-RIS 有干扰
hkHuser2=[h1user2'; rand()*h1user2'; rand()*h1user2'];
heq1user2=hkHuser2*fan1user2*gk1user2;
heq1user2d=hkHuser2*fan1user2*gk1user2/(rand*gk1user2+rand*gk1user2);%BD-RIS 有干扰
max1user2=log2(1+(norm(heq1user2,'fro'))^2/no);%对heq1矩阵等效信道求F范数再平方再取对数
max1user2d=log2(1+(norm(heq1user2d,'fro'))^2/no);%BD-RIS 有干扰
hkHuser3=[h1user3'; rand()*h1user3'; rand()*h1user3'];
heq1user3=hkHuser3*fan1user3*gk1user3;
heq1user3d=hkHuser3*fan1user3*gk1user3/(rand*gk1user3+rand*gk1user3);%BD-RIS 有干扰
max1user3=log2(1+(norm(heq1user3,'fro'))^2/no);%对heq1矩阵等效信道求F范数再平方再取对数
max1user3d=log2(1+(norm(heq1user3d,'fro'))^2/no);
%下面对A2 Takagi分解
%用户1
[Ut2 St2 Vt2]=svd(A2);
G_star2=(Vt2').';
t2=diag(Ut2'*G_star2);
theta2=0.5*atan2d(imag(t2),real(t2));%角度为单位
v2=exp(j*theta2/180*pi);%复指数函数中的用的是弧度，所以角度要除以180再乘以pi
F2=Ut2*diag(v2);
C2=F2*St2*F2.';%C=A1，C是A1进行Takagi分解的形式
fan2=F2*F2.';%相移矩阵20*20矩阵
%用户2
[Ut2user2 St2user2 Vt2user2]=svd(A2user2);
G_star2user2=(Vt2user2').';
t2user2=diag(Ut2user2'*G_star2user2);
theta2user2=0.5*atan2d(imag(t2user2),real(t2user2));%角度为单位
v2user2=exp(j*theta2user2/180*pi);%复指数函数中的用的是弧度，所以角度要除以180再乘以pi
F2user2=Ut2user2*diag(v2user2);
C2user2=F2user2*St2user2*F2user2.';%C=A1，C是A1进行Takagi分解的形式
fan2user2=F2user2*F2user2.';%相移矩阵20*20矩阵
%用户3
[Ut2user3 St2user3 Vt2user3]=svd(A2user3);
G_star2user3=(Vt2user3').';
t2user3=diag(Ut2user3'*G_star2user3);
theta2user3=0.5*atan2d(imag(t2user3),real(t2user3));%角度为单位
v2user3=exp(j*theta2user3/180*pi);%复指数函数中的用的是弧度，所以角度要除以180再乘以pi
F2user3=Ut2user3*diag(v2user3);
C2user3=F2user3*St2user3*F2user3.';%C=A1，C是A1进行Takagi分解的形式
fan2user3=F2user3*F2user3.';%相移矩阵20*20矩阵

hkH2=[h2'; rand()*h2'; rand()*h2'];
heq2=hkH2*fan2*gk2;
heq2d=hkH2*fan2*gk2/(rand*gk2+rand*gk2);
max2=log2(1+(norm(heq2,'fro'))^2/no);%对heq2矩阵等效信道求F范数再平方再取对数
max2d=log2(1+(norm(heq2d,'fro'))^2/no);%BD-RIS有干扰
hkH2user2=[h2user2'; rand()*h2user2'; rand()*h2user2'];
heq2user2=hkH2user2*fan2user2*gk2user2;
heq2user2d=hkH2user2*fan2user2*gk2user2/(rand*gk2user2+rand*gk2user2);
max2user2=log2(1+(norm(heq2user2,'fro'))^2/no);%对heq2矩阵等效信道求F范数再平方再取对数
max2user2d=log2(1+(norm(heq2user2d,'fro'))^2/no);
hkH2user3=[h2user3'; rand()*h2user3'; rand()*h2user3'];
heq2user3=hkH2user3*fan2user3*gk2user3;
heq2user3d=hkH2user3*fan2user3*gk2user3/(rand*gk2user3+rand*gk2user3);
max2user3=log2(1+(norm(heq2user3,'fro'))^2/no);%对heq2矩阵等效信道求F范数再平方再取对数
max2user3d=log2(1+(norm(heq2user3d,'fro'))^2/no);
%下面对A3 Takagi分解
%用户1
[Ut3 St3 Vt3]=svd(A3);
G_star3=(Vt3').';
t3=diag(Ut3'*G_star3);
theta3=0.5*atan2d(imag(t3),real(t3));%角度为单位
v3=exp(j*theta3/180*pi);%复指数函数中的用的是弧度，所以角度要除以180再乘以pi
F3=Ut3*diag(v3);
C3=F3*St3*F3.';%C=A1，C是A3进行Takagi分解的形式
fan3=F3*F3.';%相移矩阵20*20矩阵
%用户2
[Ut3user2 St3user2 Vt3user2]=svd(A3user2);
G_star3user2=(Vt3user2').';
t3user2=diag(Ut3user2'*G_star3user2);
theta3user2=0.5*atan2d(imag(t3user2),real(t3user2));%角度为单位
v3user2=exp(j*theta3user2/180*pi);%复指数函数中的用的是弧度，所以角度要除以180再乘以pi
F3user2=Ut3user2*diag(v3user2);
C3user2=F3user2*St3user2*F3user2.';%C=A1，C是A3进行Takagi分解的形式
fan3user2=F3user2*F3user2.';%相移矩阵20*20矩阵
%用户3
[Ut3user3 St3user3 Vt3user3]=svd(A3user3);
G_star3user3=(Vt3user3').';
t3user3=diag(Ut3user3'*G_star3user3);
theta3user3=0.5*atan2d(imag(t3user3),real(t3user3));%角度为单位
v3user3=exp(j*theta3user3/180*pi);%复指数函数中的用的是弧度，所以角度要除以180再乘以pi
F3user3=Ut3user3*diag(v3user3);
C3user3=F3user3*St3user3*F3user3.';%C=A1，C是A3进行Takagi分解的形式
fan3user3=F3user3*F3user3.';%相移矩阵20*20矩阵

hkH3=[h3'; rand()*h3'; rand()*h3'];
heq3=hkH3*fan3*gk3;
heq3d=hkH3*fan3*gk3/(rand*gk3+rand*gk3);
max3=log2(1+(norm(heq3,'fro'))^2/no);%对heq2矩阵等效信道求F范数再平方再取对数
max3d=log2(1+(norm(heq3d,'fro'))^2/no);
hkH3user2=[h3user2'; rand()*h3user2'; rand()*h3user2'];
heq3user2=hkH3user2*fan3user2*gk3user2;
heq3user2d=hkH3user2*fan3user2*gk3user2/(rand*gk3user2+rand*gk3user2);
max3user2=log2(1+(norm(heq3user2,'fro'))^2/no);%对heq2矩阵等效信道求F范数再平方再取对数
max3user2d=log2(1+(norm(heq3user2d,'fro'))^2/no);
hkH3user3=[h3user3'; rand()*h3user3'; rand()*h3user3'];
heq3user3=hkH3user3*fan3user3*gk3user3;
heq3user3d=hkH3user3*fan3user3*gk3user3/(rand*gk3user3+rand*gk3user3);
max3user3=log2(1+(norm(heq3user3,'fro'))^2/no);%对heq2矩阵等效信道求F范数再平方再取对数
max3user3d=log2(1+(norm(heq3user3d,'fro'))^2/no);
%下面对A4 Takagi分解
%用户1
[Ut4 St4 Vt4]=svd(A4);
G_star4=(Vt4').';
t4=diag(Ut4'*G_star4);
theta4=0.5*atan2d(imag(t4),real(t4));%角度为单位
v4=exp(j*theta4/180*pi);%复指数函数中的用的是弧度，所以角度要除以180再乘以pi
F4=Ut4*diag(v4);
C4=F4*St4*F4.';%C=A1，C是A1进行Takagi分解的形式
fan4=F4*F4.';%相移矩阵20*20矩阵
%用户2
[Ut4user2 St4user2 Vt4user2]=svd(A4user2);
G_star4user2=(Vt4user2').';
t4user2=diag(Ut4user2'*G_star4user2);
theta4user2=0.5*atan2d(imag(t4user2),real(t4user2));%角度为单位
v4user2=exp(j*theta4user2/180*pi);%复指数函数中的用的是弧度，所以角度要除以180再乘以pi
F4user2=Ut4user2*diag(v4user2);
C4user2=F4user2*St4user2*F4user2.';%C=A1，C是A1进行Takagi分解的形式
fan4user2=F4user2*F4user2.';%相移矩阵20*20矩阵
%用户3
[Ut4user3 St4user3 Vt4user3]=svd(A4user3);
G_star4user3=(Vt4user3').';
t4user3=diag(Ut4user3'*G_star4user3);
theta4user3=0.5*atan2d(imag(t4user3),real(t4user3));%角度为单位
v4user3=exp(j*theta4user3/180*pi);%复指数函数中的用的是弧度，所以角度要除以180再乘以pi
F4user3=Ut4user3*diag(v4user3);
C4user3=F4user3*St4user3*F4user3.';%C=A1，C是A1进行Takagi分解的形式
fan4user3=F4user3*F4user3.';%相移矩阵20*20矩阵

hkH4=[h4'; rand()*h4'; rand()*h4'];
heq4=hkH4*fan4*gk4;
heq4d=hkH4*fan4*gk4/(rand*gk4+rand*gk4);
max4=log2(1+(norm(heq4,'fro'))^2/no);%对heq2矩阵等效信道求F范数再平方再取对数
max4d=log2(1+(norm(heq4d,'fro'))^2/no);
hkH4user2=[h4user2'; rand()*h4user2'; rand()*h4user2'];
heq4user2=hkH4user2*fan4user2*gk4user2;
heq4user2d=hkH4user2*fan4user2*gk4user2/(rand*gk4user2+rand*gk4user2);
max4user2=log2(1+(norm(heq4user2,'fro'))^2/no);%对heq2矩阵等效信道求F范数再平方再取对数
max4user2d=log2(1+(norm(heq4user2d,'fro'))^2/no);
hkH4user3=[h4user3'; rand()*h4user3'; rand()*h4user3'];
heq4user3=hkH4user3*fan4user3*gk4user3;
heq4user3d=hkH4user3*fan4user3*gk4user3/(rand*gk4user3+rand*gk4user3);
max4user3=log2(1+(norm(heq4user3,'fro'))^2/no);%对heq2矩阵等效信道求F范数再平方再取对数
max4user3d=log2(1+(norm(heq4user3d,'fro'))^2/no);
%下面对A5 Takagi分解
%用户1
[Ut5 St5 Vt5]=svd(A5);
G_star5=(Vt5').';
t5=diag(Ut5'*G_star5);
theta5=0.5*atan2d(imag(t5),real(t5));%角度为单位
v5=exp(j*theta5/180*pi);%复指数函数中的用的是弧度，所以角度要除以180再乘以pi
F5=Ut5*diag(v5);
C5=F5*St5*F5.';%C=A1，C是A1进行Takagi分解的形式
fan5=F5*F5.';%相移矩阵20*20矩阵
%用户2
[Ut5user2 St5user2 Vt5user2]=svd(A5user2);
G_star5user2=(Vt5user2').';
t5user2=diag(Ut5user2'*G_star5user2);
theta5user2=0.5*atan2d(imag(t5user2),real(t5user2));%角度为单位
v5user2=exp(j*theta5user2/180*pi);%复指数函数中的用的是弧度，所以角度要除以180再乘以pi
F5user2=Ut5user2*diag(v5);
C5user2=F5user2*St5user2*F5user2.';%C=A1，C是A1进行Takagi分解的形式
fan5user2=F5user2*F5user2.';%相移矩阵20*20矩阵
%用户3
[Ut5user3 St5user3 Vt5user3]=svd(A5user3);
G_star5user3=(Vt5user3').';
t5user3=diag(Ut5user3'*G_star5user3);
theta5user3=0.5*atan2d(imag(t5user3),real(t5user3));%角度为单位
v5user3=exp(j*theta5user3/180*pi);%复指数函数中的用的是弧度，所以角度要除以180再乘以pi
F5user3=Ut5user3*diag(v5user3);
C5user3=F5user3*St5user3*F5user3.';%C=A1，C是A1进行Takagi分解的形式
fan5user3=F5user3*F5user3.';%相移矩阵20*20矩阵

hkH5=[h5'; rand()*h5'; rand()*h5'];
heq5=hkH5*fan5*gk5;
heq5d=hkH5*fan5*gk5/(rand*gk5+rand*gk5);
max5=log2(1+(norm(heq5,'fro'))^2/no);%对heq2矩阵等效信道求F范数再平方再取对数
max5d=log2(1+(norm(heq5d,'fro'))^2/no);
hkH5user2=[h5user2'; rand()*h5user2'; rand()*h5user2'];
heq5user2=hkH5user2*fan5user2*gk5user2;
heq5user2d=hkH5user2*fan5user2*gk5user2/(rand*gk5user2+rand*gk5user2);
max5user2=log2(1+(norm(heq5user2,'fro'))^2/no);%对heq2矩阵等效信道求F范数再平方再取对数
max5user2d=log2(1+(norm(heq5user2d,'fro'))^2/no);
hkH5user3=[h5user3'; rand()*h5user3'; rand()*h5user3'];
heq5user3=hkH5user3*fan5user3*gk5user3;
heq5user3d=hkH5user3*fan5user3*gk5user3/(rand*gk5user3+rand*gk5user3);
max5user3=log2(1+(norm(heq5user3,'fro'))^2/no);%对heq2矩阵等效信道求F范数再平方再取对数
max5user3d=log2(1+(norm(heq5user3d,'fro'))^2/no);
%下面对A6 Takagi分解
%用户1
[Ut6 St6 Vt6]=svd(A6);
G_star6=(Vt6').';
t6=diag(Ut6'*G_star6);
theta6=0.5*atan2d(imag(t6),real(t6));%角度为单位
v6=exp(j*theta6/180*pi);%复指数函数中的用的是弧度，所以角度要除以180再乘以pi
F6=Ut6*diag(v6);
C6=F6*St6*F6.';%C=A1，C是A1进行Takagi分解的形式
fan6=F6*F6.';%相移矩阵20*20矩阵
%用户2
[Ut6user2 St6user2 Vt6user2]=svd(A6user2);
G_star6user2=(Vt6user2').';
t6user2=diag(Ut6user2'*G_star6user2);
theta6user2=0.5*atan2d(imag(t6user2),real(t6user2));%角度为单位
v6user2=exp(j*theta6user2/180*pi);%复指数函数中的用的是弧度，所以角度要除以180再乘以pi
F6user2=Ut6user2*diag(v6user2);
C6user2=F6user2*St6user2*F6user2.';%C=A1，C是A1进行Takagi分解的形式
fan6user2=F6user2*F6user2.';%相移矩阵20*20矩阵
%用户3
[Ut6user3 St6user3 Vt6user3]=svd(A6user3);
G_star6user3=(Vt6user3').';
t6user3=diag(Ut6user3'*G_star6user3);
theta6user3=0.5*atan2d(imag(t6user3),real(t6user3));%角度为单位
v6user3=exp(j*theta6user3/180*pi);%复指数函数中的用的是弧度，所以角度要除以180再乘以pi
F6user3=Ut6user3*diag(v6user3);
C6user3=F6user3*St6user3*F6user3.';%C=A1，C是A1进行Takagi分解的形式
fan6user3=F6user3*F6user3.';%相移矩阵20*20矩阵

hkH6=[h6'; rand()*h6'; rand()*h6'];
heq6=hkH6*fan6*gk6;
heq6d=hkH6*fan6*gk6/(rand*gk6+rand*gk6);
max6=log2(1+(norm(heq6,'fro'))^2/no);%对heq2矩阵等效信道求F范数再平方再取对数
max6d=log2(1+(norm(heq6d,'fro'))^2/no);
hkH6user2=[h6user2'; rand()*h6user2'; rand()*h6user2'];
heq6user2=hkH6user2*fan6user2*gk6user2;
heq6user2d=hkH6user2*fan6user2*gk6user2/(rand*gk6user2+rand*gk6user2);
max6user2=log2(1+(norm(heq6user2,'fro'))^2/no);%对heq2矩阵等效信道求F范数再平方再取对数
max6user2d=log2(1+(norm(heq6user2d,'fro'))^2/no);
hkH6user3=[h6user3'; rand()*h6user3'; rand()*h6user3'];
heq6user3=hkH6user3*fan6user3*gk6user3;
heq6user3d=hkH6user3*fan6user3*gk6user3/(rand*gk6user3+rand*gk6user3);
max6user3=log2(1+(norm(heq6user3,'fro'))^2/no);%对heq2矩阵等效信道求F范数再平方再取对数
max6user3d=log2(1+(norm(heq6user3d,'fro'))^2/no);
%UE1r=max1/10+max1user2/10+max1user3/10;%i=10,10个RIS单元
UE1r=max1+max1user2+max1user3;%i=10,10个RIS单元
UE2r=max2+max2user2+max2user3;%i=20,20个RIS单元
UE3r=max3+max3user2+max3user3;%i=30,30个RIS单元
UE4r=max4+max4user2+max4user3;%i=40,40个RIS单元
UE5r=max5+max5user2+max5user3;%i=50,50个RIS单元
UE6r=max6+max6user2+max6user3;%i=60,60个RIS单元
NdB=10*log10(-80);%将噪声-80dBm转换为dB
UE1rd=max1d+max1user2d+max1user3d;
UE2rd=max2d+max2user2d+max2user3d;
UE3rd=max3d+max3user2d+max3user3d;
UE4rd=max4d+max4user2d+max4user3d;
UE5rd=max5d+max5user2d+max5user3d;
UE6rd=max6d+max6user2d+max6user3d;
X=[10 20 30 40 50 60];
R=[UE1r UE2r UE3r UE4r UE5r UE6r];
Rd=[UE1rd UE2rd UE3rd UE4rd UE5rd UE6rd];





%对角相移矩阵情况
%i=10,10个RIS单元
fi1u1=diag(randn(1,10));%用户1对角相移矩阵
fi1u2=diag(randn(1,10));%用户2对角相移矩阵
fi1u3=diag(randn(1,10));%用户3对角相移矩阵
heq1u1=hkH*fi1u1*gk1;
heq1u2=hkHuser2*fi1u2*gk1user2;
heq1u3=hkHuser3*fi1u3*gk1user3;
dr1=log2(1+(norm(heq1u1,'fro'))^2/no)+log2(1+(norm(heq1u2,'fro'))^2/no)+log2(1+(norm(heq1u3,'fro'))^2/no);
%i=20,20个RIS单元
fi2u1=diag(randn(1,20));%用户1对角相移矩阵
fi2u2=diag(randn(1,20));%用户2对角相移矩阵
fi2u3=diag(randn(1,20));%用户3对角相移矩阵
heq2u1=hkH2*fi2u1*gk2;
heq2u2=hkH2user2*fi2u2*gk2user2;
heq2u3=hkH2user3*fi2u3*gk2user3;
dr2=log2(1+(norm(heq2u1,'fro'))^2/no)+log2(1+(norm(heq2u2,'fro'))^2/no)+log2(1+(norm(heq2u3,'fro'))^2/no);
%i=30,30个RIS单元
fi3u1=diag(randn(1,30));%用户1对角相移矩阵
fi3u2=diag(randn(1,30));%用户2对角相移矩阵
fi3u3=diag(randn(1,30));%用户3对角相移矩阵
heq3u1=hkH3*fi3u1*gk3;
heq3u2=hkH3user2*fi3u2*gk3user2;
heq3u3=hkH3user3*fi3u3*gk3user3;
dr3=log2(1+(norm(heq3u1,'fro'))^2/no)+log2(1+(norm(heq3u2,'fro'))^2/no)+log2(1+(norm(heq3u3,'fro'))^2/no);
%i=40,40个RIS单元
fi4u1=diag(randn(1,40));%用户1对角相移矩阵
fi4u2=diag(randn(1,40));%用户2对角相移矩阵
fi4u3=diag(randn(1,40));%用户3对角相移矩阵
heq4u1=hkH4*fi4u1*gk4;
heq4u2=hkH4user2*fi4u2*gk4user2;
heq4u3=hkH4user3*fi4u3*gk4user3;
%dr4=log10(1+(norm(heq4u1,'fro'))^2/no)+log10(1+(norm(heq4u2,'fro'))^2/no)+log10(1+(norm(heq4u3,'fro'))^2/no);
dr4=log2(1+(norm(heq4u1,'fro'))^2/no)+log2(1+(norm(heq4u2,'fro'))^2/no)+log2(1+(norm(heq4u3,'fro'))^2/no);
%i=50,50个RIS单元
fi5u1=diag(randn(1,50));%用户1对角相移矩阵
fi5u2=diag(randn(1,50));%用户2对角相移矩阵
fi5u3=diag(randn(1,50));%用户3对角相移矩阵
heq5u1=hkH5*fi5u1*gk5;
heq5u2=hkH5user2*fi5u2*gk5user2;
heq5u3=hkH5user3*fi5u3*gk5user3;
dr5=log2(1+(norm(heq5u1,'fro'))^2/no)+log2(1+(norm(heq5u2,'fro'))^2/no)+log2(1+(norm(heq5u3,'fro'))^2/no);
%i=60,60个RIS单元
fi6u1=diag(randn(1,60));%用户1对角相移矩阵
fi6u2=diag(randn(1,60));%用户2对角相移矩阵
fi6u3=diag(randn(1,60));%用户3对角相移矩阵
heq6u1=hkH6*fi6u1*gk6;
heq6u2=hkH6user2*fi6u2*gk6user2;
heq6u3=hkH6user3*fi6u3*gk6user3;
dr6=log2(1+(norm(heq6u1,'fro'))^2/no)+log2(1+(norm(heq6u2,'fro'))^2/no)+log2(1+(norm(heq6u3,'fro'))^2/no);%对heq2矩阵等效信道求F范数再平方再取对数
DR=[dr1 dr2 dr3 dr4 dr5 dr6];

end
figure;
hold on;
grid on;
smoothR=smooth(R,5);
smoothRd=smooth(Rd,5);%BD-RIS 有干扰
smoothDR=smooth(DR,5);

%plot(X,smoothR,'-bo',X,smoothDR,'--rs',X,smoothnr,'-k^',X,smoothRd,'-go','LineWidth',2);
plot(X,smoothR,'-bo',X,smoothDR,'--rs',X,smoothRd,'-go','LineWidth',2);
xlabel('Number of RIS elements');
ylabel('Receive SNR(dB)');