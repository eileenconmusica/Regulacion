%% REGULACIÓN AUTOMÁTICA
% Curso 2017-18
% Componentes del grupo
% Alarcón Sánchez, Francisco
% Gordillo Bosque, Irene
% Pérez __, Alejandro
% 
%
%
%% Generación de parámetros y obtención de la función de trasferencia
clear;
clc;
[Datos, G]=GeneraParametros([2 5 3 5 1 6 8 0]);
M=Datos(1);
J=Datos(2);
K=Datos(3);
fv=Datos(4);
r=Datos(5);
% La inercia de un cilindro viene dada por la expresión J=m*r^2/2, por lo
% que su masa es:
Mc=2*J/r^2;

%% Función de transferencia discretizada
Gd=c2d(G,0.1);
% (((( Habría que hacer dibujillos y eso)))
%% Space State
[num, den]=tfdata(G, 'v');
[A B C D]=tf2ss(num, den);
%sys=[A B C D];
% La salida es la posición x

