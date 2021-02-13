clc;
clear all;
s=tf('s');
syms s ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% Sick test 2020 %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lead lag design in frequency domain 


% os = 13.25
Ts = 0.1; 
% Tp = 2
zeta=0.517;
coreection_factor = 5

% zeta = -(log(os/100)/sqrt(pi^2+(log(os/100))^2))

wbw = 4/(Ts*zeta)*sqrt(1-2*zeta^2+sqrt(4*zeta^4-4*zeta^2+2)) %if Ts is given
% wbw = pi/(Tp*sqrt(1-zeta^2))*sqrt(1-2*zeta^2+sqrt(4*zeta^4-4*zeta^2+2)) %if Tp is given
phiM = atan(2*zeta/sqrt(-2*zeta^2+sqrt(1+4*zeta^4)))*180/pi

ws = 0.8*wbw %phase-margin frequency that is equal to 80% of the required closedloop bandwidth ?_bw only for this question

%zeros
z1 = 7;

%poles
p1 = 5;
p2 = 15;

% sum of atan(plant zeros) - atan(plant poles)
phi_plant = rad2deg(atan(ws/7) - atan(ws/5) - atan(ws/15)- atan(ws/0)) %remove pi/2 if pole at zero is not present

phi_lead = phiM + (-180 - phi_plant)+coreection_factor

beta = (1-sin(deg2rad(phi_lead)))/(1+sin(deg2rad(phi_lead)))

gamma = 1/beta

T_2 = 1/(0.1*ws)

G_lag = vpa((s+1/T_2)/(s+1/(gamma*T_2)))


%%%%%%%% Lead Part %%%%%%%%

% ws = 1/T_1(sqrt(beta))

T_1 = 1/(ws*sqrt(beta))

G_lead = vpa((s+1/T_1)/(s+gamma/T_1))









