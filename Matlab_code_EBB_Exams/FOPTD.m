clc;
clear all;
%%%%% Sick Test 2020 %%%%
s=tf('s');
syms s ;

y_0 = 30
y_inf = 20
u_0 = 50
u_inf = 70

K = (y_inf - y_0)/(u_inf - u_0)

system_reaction_time = 52.5

td = system_reaction_time - 50

y_tau = y_0 - (y_0 - y_inf)*(0.632)

tau = 56 - system_reaction_time