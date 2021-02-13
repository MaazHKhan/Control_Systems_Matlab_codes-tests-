clc;
clear all;

s=tf('s');

Gp = ((10)/(1.6*s+1))*(exp(-0.1*s))

Gp_simc = 0.8*(1+(1/(0.8*s)))
Gp_coon = 1.4483*(1+(1/(0.2945*s)))


step(Gp)
margin(Gp*Gp_simc)

% margin(Gp*Gp_coon)