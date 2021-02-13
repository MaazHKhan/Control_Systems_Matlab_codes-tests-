clc;
clear all;
syms s x y k j;
 
a4 = 1;
a3 = 9;
a2 = 26;
a1 = (24+k);
a0 = k;


m1 = [a4,a2; a3,a1]
m2 = [a4,a0; a3,0]
m3 = [a4,0 ; a3,0]

b1 = simplify(-1*det(m1)/a3)
b2 = (-1*det(m2)/a3)

m4 = [a3,a1; b1,b2]

c1 = simplify(-1*det(m4))/b1

m5 = [b1,b2; c1,0]
d1 = simplify(-1*det(m5)/c1)


S4 = [a4,a2,a0]
S3 = [a3,a1,0]
S2 = [b1,b2,0]
S1 = ([c1,0,0])
S0 = [d1,0,0]
