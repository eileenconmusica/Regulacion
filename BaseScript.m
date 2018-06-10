%% REGULACI�N AUTOM�TICA
% Curso 2017-18
% Componentes del grupo
% Alarc�n S�nchez, Francisco
% Gordillo Bosque, Irene
% P�rez Cobaleda, Alejandro
% 
%
%
%% 1-2 Generaci�n de par�metros y obtenci�n de la funci�n de trasferencia
clear;
clc;
[Datos, G]=GeneraParametros([2 5 3 5 1 6 8 0]);
M=Datos(1);
J=Datos(2);
K=Datos(3);
fv=Datos(4);
r=Datos(5);
% La inercia de un cilindro viene dada por la expresi�n J=m*r^2/2, por lo
% que su masa es:
Mc=2*J/r^2;

%% 3 Funci�n de transferencia discretizada
Gd=c2d(G,0.1);
% (((( Habr�a que hacer dibujillos y eso)))
%% 4 Space State 
[num, den]=tfdata(G, 'v');
[A,B,C,D]=tf2ss(num, den);
sysC=ss(A,B,C,D);
% La salida es la posici�n x
% DSS T=0.1
[d1num, d1den]=tfdata(Gd, 'v');
[Gd1,Hd1,Cd1,Dd1]=tf2ss(d1num, d1den);
sysD1=ss(Gd1,Hd1,Cd1,Dd1);
% DSS T=1
Gd2=c2d(G,1);
[d2num, d2den]=tfdata(Gd2, 'v');
[G,H,C,D]=tf2ss(d2num, d2den);
sysD2=ss(A,B,C,D);


