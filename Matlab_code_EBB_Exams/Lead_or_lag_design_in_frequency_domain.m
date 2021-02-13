clc
clear all
s=tf('s');
syms s ;
syms w;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% Lead or lag design in frequency domain %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Exam 2018 Q2

%%% This value are usally given in the test %%%

os = 15
Ts = 0.0; 
% Tp = 2
correction_factor = 5

zeta = -(log(os/100)/sqrt(pi^2+(log(os/100))^2))

phiM = atan(2*zeta/sqrt(-2*zeta^2+sqrt(1+4*zeta^4)))*180/pi + correction_factor
phi_req = -180 + phiM 

phi_g = rad2deg(atan(w/4) - atan(w/2) - atan(w/6) - atan(w/8)) == phi_req %121.82 = phi_req

w_phiM = vpa(solve(phi_g,w))

