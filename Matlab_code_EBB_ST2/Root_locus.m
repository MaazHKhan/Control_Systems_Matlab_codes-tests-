clc;
clear all;
syms s x y;
syms k;
% s = tf('s');
s = tf('s');
% 
% sys = (s+1)/(s^ 4+9*s^3+26*s^2+24*s)
% con = (s+2)/(s+3.7892)
% G = (s+2)/(s^3+5*s+2)
% closed_loop = feedback(sys,1)

% 
% new = 4.726/(s^2+3*s+4.726)
% 
% P = pole(new)
% margin(new)
% rlocus((s^2+s+1)/(s^4+2*s^3+s^2-s-1))

% eq = (x+2)*(3x^2+18*x-10)
% % factor(eq,x)
% f1=factor(s^2+s+1)
% f2=factor(s^4+2*s^3+3*s^2+s+1)
m = [1,0,0,0,0]*[1,0,0;0,0,1;0,0,1;0,1,0;0,1,0]