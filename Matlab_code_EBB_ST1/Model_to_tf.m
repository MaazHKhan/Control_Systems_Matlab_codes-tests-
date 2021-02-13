clc;
clear all;

s=tf('s');
syms s;
syms f;

% System of eqtion form model (refrence memo HW 2B Question 1)
x = [(4*s^2+2*s+6) -2*s 0; -2*s (4*s^2+4*s+6) -6; 0 -6 (4*s^2+2*s+6)]
det(x)

% Repalce the colum for the variable you want to solve for. 
x3 =[(4*s^2+2*s+6) -2*s 0; -2*s (4*s^2+4*s+6) f; 0 -6 0]
det(x3)

X3 = (det(x3))/(det(x))

Final_TF = X3/f

simplify(Final_TF) 