clc;
clear all;
s=tf('s');
syms s k1 k2 k3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Testing if thw plant is controllable %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


A = [-1 2 0; 1 -3 4; -1 1 -9]
B = [1;2;-1]
C = [1 0 1]
D = 0


% For 3x3 matrix

Cm = [B A*B A^2*B]
x1 = det(Cm)
if  x1 ~= 0
    disp('The Plant is Controllable')
end  

observable = obsv(A,C)

%The poles and zeros of the plant can be determined from the transfer function:


I=eye(3,3)

x=(s*I-A) %(sI-A)
y=det(x)  %det(sI-A)
z=inv((s*I-A))


G =( simplify( C*(inv(x))*B))

[num,den]=ss2tf(A,B,C,D,1)

roots(den)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%  Calculate the gains [?1 ?2 k3] %%%%%%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


Gs = -520*(s+0.02)/(s^3+2.64*s^2+0.109*s+0.013)

A_dot = [0 1 0; 0 0 1; 13 33 13 ]

B_dot = [0;0;1]

C_dot = [0.02 1 0]

D_dot = [0]

k = [k1 k2 k3]

Acl = vpa(A_dot - B_dot*k)

x_p = vpa((s + 3.539)*(s^2 + 8.9*s + 44.81))
