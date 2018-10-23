clear; close all; clc

% No li feu cas a aquest programa, esta mitges

n=3;
dist=1;
x=zeros(1, n);
j=-((n-1)/2);
for i=1:n
    x(i)=j*dist;
    j=j + 1;
end

r=@(x)(pfun(x)-f(x))^2;
