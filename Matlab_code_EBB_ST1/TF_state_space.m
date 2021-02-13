clc;
clear all;

num=[0.5 2];
den=[1 1.5 0.5 2];
[A,B,C,D]=tf2ss(num,den);
P=[0 0 1;0 1 0;1 0 0];

A=inv(P)*A*P
B=inv(P)*B
C=C*P