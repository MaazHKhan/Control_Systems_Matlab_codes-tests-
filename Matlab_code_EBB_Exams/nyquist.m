clc
clear all
s=tf('s');
syms s ;
syms w;


H = tf([2 5 1],[1 2 3])
nyquist(H)