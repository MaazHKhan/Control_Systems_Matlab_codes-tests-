clc;
clear all;
syms s x y;
syms k;
% s = tf('s');
% 
% eq = simplify(x+2)*(3*x^2+18*x-10)

% OS=20;
% zeta=(-log(OS/100)/log(exp(1)))/(sqrt(pi^2 +(log(OS/100)/log(exp(1)))^2))
gc=(4*s+1)/(4*s) 
gp = 5/(3*k+s)

out = simplify((gc*gp)/(1+(gc*gp)))