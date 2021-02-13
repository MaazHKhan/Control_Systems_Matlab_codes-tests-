clc;
clear all;
s=tf('s');

% To get step info as well as 

% G=((2*(s + 2))/(s^3 + 6*s^2 + 11*s + 3))
% G = (0.75*exp(-1*s))/(s + 0.75) 
G = (16)/(s^2 + 3*s + 16)

% figure(1)
% step(G);
% 
% figure(2)
% margin(G);
info = stepinfo(G)



% To get closed loop equation for two or more loop functions

G1 = 1+(4/s)
G2 = 1/(s*(2*s+3))
GL = G1*G2
Closed_loop_G = feedback(GL,1)
