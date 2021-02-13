%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% State Space to transfer Function %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear all;
% state space to tf ref q1 2018
s=tf('s');
syms s;

% A=[0 1 0; 0 -4 3; -1 -1 -2]
% B=[0;2;0]
% C=[1 0 0]
% D=0
% I=eye(3,3)
% 
% x=(s*I-A) %(sI-A)
% y=det(x)  %det(sI-A)
% z=(x^(-1))/y %(sI-A)^-1
% 
% G = C*z*B
% 
% 
% [num,den]=ss2tf(A,B,C,D,1);
% roots(den);


A=[-5 -4 0; 1 0 0; 1 1 0]
B=[1;0;0]
C=[0 1 2]
D=0


% A=[-6 -8 0; 1 0 0; 0 1 0]
% B=[1;0;0]
% C=[0 40 200]
% D=0

I=eye(3,3)

x=(s*I-A) %(sI-A)
y=det(x)  %det(sI-A)
z=inv((s*I-A))



G =( simplify( C*(inv(x))*B))




[num,den]=ss2tf(A,B,C,D,1);

roots(den)





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Testing if thw plant is controllable %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


A1 = [-5 -4 0; 1 0 0; 1 1 0]
B1 = [1;0;0]
C1 = [0 1 2]
D1 = 0

% For 3x3 matrix

Cm = [B1 A1*B1 A^2*B]
x1 = det(Cm)
if  x1 ~= 0
    disp('Controllable')
end    

