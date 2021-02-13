clc;
clear all;
% Random stuff calculator
% s=tf('s');
s=tf('s')
syms s;
syms f;
zf = 100*10^2 + 1/(s*2*10^-6);
zi = 500*10^3 + 1/(s*2*10^-6);
simplify(zf/zi);

