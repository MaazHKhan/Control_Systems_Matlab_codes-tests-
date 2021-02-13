clc;
clear all;
% s=tf('s');
syms s kc ;

%This code has been tested on exam 2019 and sicktest 2019

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% Sick test 2019 and Exam 2019 %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
denom = factor(s^2+7*s+12)

G_plant = 5/(( s + 4)*(s + 3))
z2=0.01

%%% This value are usally given in the test %%%
os = 18.5
Ts = 0.8453; 
% Tp = 1.5
% zeta=0.517;
correction_factor = 12*0



%%% damping ration Calculations %%%
zeta = -(log(os/100)/sqrt(pi^2+(log(os/100))^2))

%%% Phase margin Calculations %%%
phiM = atan(2*zeta/sqrt(-2*zeta^2+sqrt(1+4*zeta^4)))*180/pi
phi_M2 = phiM + correction_factor %phase margin with correction factor

%%% W bandwith Calculations %%%
wbw = 4/(Ts*zeta)*sqrt(1-2*zeta^2+sqrt(4*zeta^4-4*zeta^2+2)) %if Ts is given
% wbw = pi/(Tp*sqrt(1-zeta^2))*sqrt(1-2*zeta^2+sqrt(4*zeta^4-4*zeta^2+2)) %if Tp is given

%%% Phase Required Calculations %%%
phi_req_Wbw = -180 +  phi_M2
phi_G = rad2deg( -atan(0.9*wbw/4) - atan(0.9*wbw/3)) %plant phi

%%% PID contoller Phi (Comment out which is not required) %%%
phi_PI = rad2deg(-pi/2+ atan(0.9*wbw/0.01))
phi_D = phi_req_Wbw - phi_PI - phi_G

% rember phi_add = atan(wbw/z_d) 
z_d = 0.9*wbw/(tan(deg2rad(phi_D))) %Direvative zero location for PD

%%%% controller Transfer funtion %%%%
G_c = vpa((s+z_d)*(s+z2)/(s)) % fix acroding to what is required 
G_loop= G_c*G_plant

s = i*wbw*0.9
abs_G_Loop = abs(G_loop)
abs_G_Loop = vpa(subs(abs_G_Loop))

K = 1/abs_G_Loop

